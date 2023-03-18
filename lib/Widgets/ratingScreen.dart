import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ratingScreen extends StatelessWidget {
  const ratingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xfffef4f8),

            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end
                        ,children: [
                        Text(
                          'عائشة',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                          SizedBox(width: 10,),
                          CircleAvatar(
                            backgroundImage: NetworkImage('https://placeimg.com/200/200/people'),
                            radius: 30,
                          ),

                        ],
                      ),

                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.star, color: Colors.grey),
                          Icon(Icons.star, color: Colors.grey),
                          Icon(Icons.star, color: Colors.pink),
                          Icon(Icons.star, color: Colors.pink),
                          Icon(Icons.star, color: Colors.pink),

                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        'مكان رائع ومعاملة لطيفة جدا',
                        style: TextStyle(fontSize: 16),
                        maxLines: 4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
