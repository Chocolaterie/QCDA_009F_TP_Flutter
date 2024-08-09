import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tp_flutter_qcda_009f/auth/auth-context.dart';
import 'package:tp_flutter_qcda_009f/shared/app-theme.dart';
import 'package:tp_flutter_qcda_009f/shared/app-validator.dart';

class LoginPage extends StatelessWidget {
  // Pour récuperer l'email et le password saisies
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Utilitaire permettant d'encaspuler
  /// uniformement des Widget dans un padding vertical de 10
  Widget wrapFormPadding(Widget widget) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 10), child: widget);
  }

  /// Lors du clique du bouton de connexion
  /// ATTENTION : On part du principe qu'on l'as mis dans le onPressed
  void onSubmit(BuildContext context) async {
    // Formulaire valide (contrôle de surface)
    if (formKey.currentState!.validate()) {
      // Le header application/json
      final headers = {'Content-Type': 'application/json'};
      // Preparer la requête (email / password)
      final bodyRequest = convert.jsonEncode(
          {'email': emailController.text, 'password': passwordController.text});

      // Appeler l'api
      var response = await http.post(Uri.parse("http://localhost:3000/auth"),
          headers: headers, body: bodyRequest);

      // Récupérer la rep http en json
      var responseBodyJson = convert.jsonDecode(response.body);

      // Tester si code ok
      if (responseBodyJson['code'] == "203") {
        // Stocker le token
        AuthContext.token = responseBodyJson['data'];
        // Changer de page
        Navigator.pushNamed(context, "/messages");
      }
      // Sinon erreur
      else {
        // Afficher la popup d'information
        showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: const Text('Erreur'),
                  content: Text(responseBodyJson['message']));
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Connexion"),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(fit: BoxFit.cover, "mobile_background.jpg"),
            Padding(
              padding: const EdgeInsets.all(60),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Image.asset(
                      "sign_in_icon.png",
                      width: 126,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        "Connexion",
                        style:
                            TextStyle(fontSize: 26, color: Color(0xDDFFFFFF)),
                      ),
                    ),
                    wrapFormPadding(TextFormField(
                      controller: emailController,
                      validator: AppValidator.emailValidator,
                      style: AppTheme.inputTextColor,
                      decoration: AppTheme.formDecoration("Email"),
                    )),
                    wrapFormPadding(TextFormField(
                      controller: passwordController,
                      style: AppTheme.inputTextColor,
                      decoration: AppTheme.formDecoration("Password"),
                    )),
                    wrapFormPadding(Row(
                      children: [
                        Switch(value: false, onChanged: (value) {}),
                        const Text(
                          "Mémoriser mes informations",
                          style: TextStyle(color: Color(0xFFFFFEFB)),
                        )
                      ],
                    )),
                    wrapFormPadding(SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              onSubmit(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(15),
                              child: Text("Connexion"),
                            ))))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
