import 'package:flutter/material.dart';
import 'package:tp_flutter_qcda_009f/app-theme.dart';

class LoginPage extends StatelessWidget {
  /// Utilitaire permettant d'encaspuler
  /// uniformement des Widget dans un padding vertical de 10
  Widget wrapFormPadding(Widget widget) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 10), child: widget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Le Titre de ma page"),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(fit: BoxFit.cover, "mobile_background.jpg"),
            Padding(
              padding: const EdgeInsets.all(60),
              child: Column(
                children: [
                  Image.asset(
                    "sign_in_icon.png",
                    width: 126,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text(
                      "Connexion",
                      style: TextStyle(fontSize: 26, color: Color(0xDDFFFFFF)),
                    ),
                  ),
                  wrapFormPadding(TextField(
                    style: AppTheme.inputTextColor,
                    decoration: AppTheme.formDecoration("Email"),
                  )),
                  wrapFormPadding(TextField(
                    style: AppTheme.inputTextColor,
                    decoration: AppTheme.formDecoration("Password"),
                  )),
                  wrapFormPadding(Row(
                    children: [
                      Switch(value: false, onChanged: (value) {}),
                      Text(
                        "Mémoriser mes informations",
                        style: TextStyle(color: Color(0xFFFFFEFB)),
                      )
                    ],
                  )),
                  wrapFormPadding(SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text("Connexion"),
                          ))))
                ],
              ),
            )
          ],
        ));
  }
}
