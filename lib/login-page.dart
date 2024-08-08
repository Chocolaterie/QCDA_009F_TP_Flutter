import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp_flutter_qcda_009f/app-theme.dart';
import 'package:tp_flutter_qcda_009f/app-validator.dart';

class LoginPage extends StatelessWidget {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Utilitaire permettant d'encaspuler
  /// uniformement des Widget dans un padding vertical de 10
  Widget wrapFormPadding(Widget widget) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 10), child: widget);
  }

  /// Lors du clique du bouton de connexion
  /// ATTENTION : On part du principe qu'on l'as mis dans le onPressed
  void onSubmit(BuildContext context) {
    // Formulaire valide (contrôle de surface)
    if (formKey.currentState!.validate()){
      // TODO (Appel web service pour le contrôle métier)
      // Changer de page
      Navigator.pushNamed(context, "/messages");
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
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Text(
                        "Connexion",
                        style: TextStyle(fontSize: 26, color: Color(0xDDFFFFFF)),
                      ),
                    ),
                    wrapFormPadding(TextFormField(
                      validator: AppValidator.emailValidator,
                      style: AppTheme.inputTextColor,
                      decoration: AppTheme.formDecoration("Email"),
                    )),
                    wrapFormPadding(TextFormField(
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
                            onPressed: () { onSubmit(context); }, child: Padding(
                              padding: const EdgeInsets.all(15),
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
