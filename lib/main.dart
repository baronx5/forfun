import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:forfun/services/api.dart';
import 'package:forfun/services/models/category.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Category>> cat = getAllCategories();

    return Scaffold(
      appBar: AppBar(
        title: const Text('hello'),
      ),
      body: FutureBuilder<List<Category>>(
        future: cat,
        builder: (context, AsyncSnapshot<List<Category>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
                return ListView(
                  children: snapshot.data!
                      .map((e) => ListTile( title: Text(e.name),))
                      .toList(),
                );

        },
      ),
    );
  }
}
