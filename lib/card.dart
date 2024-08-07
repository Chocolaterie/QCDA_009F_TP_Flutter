import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {

  Widget makeIconButton(String imgPath){
    return IconButton(onPressed: () {}, icon: Image.asset(imgPath, width: 22,));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Row(children: [
              Image.network("https://avatar.iran.liara.run/public", width: 96,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("crevette-nutella@gmail.com", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("56s", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),),
                      ],
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat")
                  ],),
                ),
              )
            ],),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  makeIconButton("reply.png"),
                  makeIconButton("retweet.png"),
                  makeIconButton("favorite.png"),
              ],),
            )
          ],),
        ),
      ),
    );
  }
}
