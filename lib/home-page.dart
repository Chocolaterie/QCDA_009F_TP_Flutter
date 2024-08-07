import 'package:flutter/material.dart';
import 'package:tp_flutter_qcda_009f/card.dart';
import 'package:tp_flutter_qcda_009f/footer.dart';
import 'package:tp_flutter_qcda_009f/header.dart';

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
