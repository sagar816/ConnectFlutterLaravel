import 'package:flutter/material.dart';
import 'package:flutter_laravel_fe/student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect Flutter With Laravel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Connect Flutter With Laravel'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Student studentService = Student();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Container(
            child: FutureBuilder<List>(
          future: studentService.getAllStudent(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        snapshot.data![i]['stuname'],
                        style: TextStyle(fontSize: 30.0),
                      ),
                      subtitle: Text(
                        snapshot.data![i]['email'],
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No Data Found'),
              );
            }
          },
        )));
  }
}
