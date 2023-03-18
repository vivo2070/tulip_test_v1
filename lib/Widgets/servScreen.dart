import 'package:flutter/material.dart';

class MyExpansionTile extends StatelessWidget {
  const MyExpansionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          elevation: 3,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,

            ),
            child: ExpansionTile(
              title: Text('قص الشعر',
                textDirection: TextDirection.rtl,),
              leading: Icon(Icons.arrow_drop_down),
              trailing: SizedBox.shrink(),
              children: [
                ListTile(
                  title: Text('Item 1'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Item 2'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        Card(
          elevation: 3,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,

            ),
            child: ExpansionTile(
              title: Text('قص الشعر',
                textDirection: TextDirection.rtl,),
              leading: Icon(Icons.arrow_drop_down),
              trailing: SizedBox.shrink(),
              children: [
                ListTile(
                  title: Text('Item 1'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Item 2'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        Card(
          elevation: 3,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,

            ),
            child: ExpansionTile(
              title: Text('قص الشعر',
                textDirection: TextDirection.rtl,),
              leading: Icon(Icons.arrow_drop_down),
              trailing: SizedBox.shrink(),
              children: [
                ListTile(
                  title: Text('Item 1'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Item 2'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
