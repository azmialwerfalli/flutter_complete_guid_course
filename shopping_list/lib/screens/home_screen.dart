import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.titles});
  final String titles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles,
          // style: const TextStyle(color: Colors.white),
        ),
        // backgroundColor: Colors.black,
      ),
      body: ListView(
        children: const <Widget>[
          SizedBox(height: 5,),

          ListTile(
            leading: CircleAvatar(child: Text('A')),
            title: Text('Headline'),
            // subtitle: Text('Supporting text'),
            trailing: Text('1'),
          ),
          SizedBox(height: 5,),
          ListTile(
            leading: CircleAvatar(child: Text('A')),
            title: Text('Headline'),
            // subtitle: Text('Supporting text'),
            trailing: Text('1'),
          ),
          SizedBox(height: 5,)
        ],
      ),
    );
  }
}
