import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:tp_flutter_qcda_009f/home/card.dart';
import 'package:tp_flutter_qcda_009f/home/footer.dart';
import 'package:tp_flutter_qcda_009f/home/header.dart';
import 'package:tp_flutter_qcda_009f/home/message-view-model.dart';
import 'package:tp_flutter_qcda_009f/tweet.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MessageViewModel? messageViewModel;

  @override
  void initState() {
    super.initState();
    messageViewModel = MessageViewModel();
  }

  void onClickCallApi(BuildContext context) {
    // appeler le view model
    messageViewModel!.callApi(context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => messageViewModel,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text("Home Page"),
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
                            onPressed: () {
                              onClickCallApi(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text("Rafraichir"),
                            ))),
                    Expanded(
                      child: Consumer<MessageViewModel>(
                          builder: (context, viewModel, child) {
                        return ListView.builder(
                            itemCount: viewModel.tweets.length,
                            itemBuilder: (BuildContext context, int index) {
                              // Retrouve le tweet dans la liste des tweets grace à l'index
                              var tweet = viewModel.tweets[index];
                              // Afficher et envoyer le tweet dans le composant/widget (le MessageCard)
                              return MessageCard(tweet);
                            });
                      }),
                    ),
                  ],
                ),
              )),
              FooterWidget()
            ],
          )),
    );
  }
}
