import 'package:flutter/material.dart';
import 'package:tp_flutter_qcda_009f/home-page.dart';
import 'package:tp_flutter_qcda_009f/login-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/messages",
      routes: {
        "/" : (context) => LoginPage(),
        "/messages" : (context) => MyHomePage(),
      },
    );
  }
}

