import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final items = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];

    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Welcome to Flutter'),
            ),
            body: ListView.separated(
              padding: EdgeInsets.all(10.0),
              itemCount: items.length,
              itemBuilder: (BuildContext ctx, int index) {
                return Container(
                  child: Text('Level $items[index]}'),
                  height: 100,);
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            )
        ),
    );
  }
}