import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:tp_flutter_qcda_009f/tweet.dart';

class MessageViewModel with ChangeNotifier {

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
    tweets = List<Tweet>.from(tweetsJson.map((tweetJson) => Tweet.fromJson(tweetJson)).toList());

    // 5:: Fermer un écran de chargement
    pd!.close();

    // 6 :: Notifier les observers
    notifyListeners();

  }

}