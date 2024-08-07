import 'package:flutter/material.dart';
import 'package:tp_flutter_qcda_009f/card.dart';
import 'package:tp_flutter_qcda_009f/footer.dart';
import 'package:tp_flutter_qcda_009f/header.dart';
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
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Demo 1"),
        ),
        body: Column(
          children: [
            HeaderWidget(),
            Expanded(
                child: Column(
              children: [MessageCard()],
            )),
            FooterWidget()
          ],
        ));
  }
}
