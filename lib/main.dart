import 'package:flutter/material.dart';
import 'page/form_page.dart';
import 'page/to_do_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(title),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.home, color: Colors.blueAccent),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home Page')),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.fort, color: Colors.blueAccent),
              title: const Text('Form'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.check, color: Colors.blueAccent),
              title: const Text('To Do'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ToDoPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Welcome to Home Page'),
      ),
    );
  }
}
