import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/to_do.dart'; // Ensure this matches the actual path to your model
import '../main.dart';
import 'form_page.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  late Future<List<ToDo>> futureTodos;

  @override
  void initState() {
    super.initState();
    futureTodos = fetchTodos();
  }

  Future<List<ToDo>> fetchTodos() async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/todos?_start=0&_limit=10'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList
          .map((json) => ToDo.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'To Do',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
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
      body: FutureBuilder<List<ToDo>>(
        future: futureTodos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "Tidak ada to do list :(",
                style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                ToDo todo = snapshot.data![index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.title,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('Completed: ${todo.completed}'),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}