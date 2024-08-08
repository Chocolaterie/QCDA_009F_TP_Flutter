import 'package:flutter/material.dart';
import 'package:tp_flutter_qcda_009f/card.dart';
import 'package:tp_flutter_qcda_009f/footer.dart';
import 'package:tp_flutter_qcda_009f/header.dart';
import 'package:tp_flutter_qcda_009f/tweet.dart';

class MyHomePage extends StatelessWidget {

  /// Ma liste de tweet en data
  List<Tweet> tweets = [
    Tweet("danette@gmail.com", "J'aime les yaourt et wouafsusu !"),
    Tweet("merguez@gmail.com", "J'aime bien manger"),
    Tweet("lunettenoire@gmail.com", "Hydrocanon !")
  ];

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
                child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text("Rafraichir"),
                          ))),
                  Expanded(
                    child: ListView.builder(
                        itemCount: tweets.length,
                        itemBuilder: (BuildContext context, int index) {
                          // Retrouve le tweet dans la liste des tweets grace à l'index
                          var tweet = tweets[index];
                          // Afficher et envoyer le tweet dans le composant/widget (le MessageCard)
                          return MessageCard(tweet);
                    }),
                  )
                ],
              ),
            )),
            FooterWidget()
          ],
        ));
  }
}
