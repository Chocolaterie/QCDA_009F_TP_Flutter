import 'package:flutter/material.dart';
import 'package:tp_flutter_qcda_009f/tweet.dart';

class MessageCard extends StatelessWidget {

  Tweet tweet;

  MessageCard(this.tweet);

  Widget makeIconButton(String imgPath){
    return IconButton(onPressed: () {}, icon: Image.asset(imgPath, width: 22,));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
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
                        Text(tweet.author, style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("56s", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),),
                      ],
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        tweet.message)
                  ],),
                ),
              )
            ],),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
