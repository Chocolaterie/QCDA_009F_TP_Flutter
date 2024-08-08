import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:tp_flutter_qcda_009f/card.dart';
import 'package:tp_flutter_qcda_009f/footer.dart';
import 'package:tp_flutter_qcda_009f/header.dart';
import 'package:tp_flutter_qcda_009f/tweet.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Ma liste de tweet en data
  List<Tweet> tweets = [];

  void callApi(BuildContext context) async {
    // Afficher un écran de chargement
    var pd = ProgressDialog(context: context);

    pd!.show(
        msg: "Récupération des tweets...",
        barrierColor: Color(0x77000000),
        progressBgColor: Colors.transparent,
        elevation: 10.0
    );

    // Faux de lag de 1 sec
    await Future.delayed(Duration(seconds: 1));

    // 1 :: Appel API HTTP
    var response = await http.get(Uri.parse("https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json"));

    // 2 :: Transformer la réponse Http en JSON
    var responseBodyJson = convert.jsonDecode(response.body);

    // 3 :: Extraire dans le body de la réponse, les données (les tweets)
    var tweetsJson = responseBodyJson;

    // 4 :: Convertir ces données en List de Tweet (en Dart)
    this.tweets = List<Tweet>.from(tweetsJson.map((tweetJson) => Tweet.fromJson(tweetJson)).toList());

    // 5 :: Pour le moment statefull dans la page entiere, pour rafraichir la page
    setState(() {});

    // Fermer un écran de chargement
    pd!.close();
  }

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
                          onPressed: () { callApi(context); },
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
