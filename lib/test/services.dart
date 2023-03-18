import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Service {
  final String servicesImages;
  final String servicesName;

  Service({
    required this.servicesImages,
    required this.servicesName,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      servicesImages: json['servicesImages'],
      servicesName: json['servicesName'],
    );
  }
}

class ServicesList extends StatefulWidget {
  @override
  _ServicesListState createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  late Future<List<Service>> futureServices;

  @override
  void initState() {
    super.initState();
    futureServices = fetchServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services List'),
      ),
      body: FutureBuilder<List<Service>>(
        future: futureServices,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final services = snapshot.data!;
            return ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.network(service.servicesImages),
                      SizedBox(height: 8),
                      Text(service.servicesName, style: TextStyle(fontSize: 18)),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Future<List<Service>> fetchServices() async {
  final response = await http.get(Uri.parse('https://www.tulipm.net/api/Services/GetAll'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final servicesJson = data['data'] as List<dynamic>;
    final services = servicesJson.map((json) => Service.fromJson(json)).toList();
    return services;
  } else {
    throw Exception('Failed to load services');
  }
}
