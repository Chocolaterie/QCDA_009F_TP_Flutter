import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFBFBFB),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Fil", style: TextStyle(color: Color(0xFF55a4e0)),),
            Text("Notification"),
            Text("Messages"),
            Text("Moi")
          ],
        ),
      ),
    );
  }
}
