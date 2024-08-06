import 'package:flutter/material.dart';

/// Fond dégradé d'une boîte
const primaryGradientDecoration = BoxDecoration(
    gradient: LinearGradient(colors: [Color(0xFF3e60ac), Color(0xFF55a4e0)]));

/// Le style d'un texte en blanc (donc pour les textes du header)
const headerTextStyle = TextStyle(color: Colors.white);

class HeaderWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: primaryGradientDecoration,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Nouveau", style: headerTextStyle,),
            Text("Accueil", style: headerTextStyle,),
            Text("Rechercher", style: headerTextStyle,),
          ],
        ),
      ),
    );
  }
}
