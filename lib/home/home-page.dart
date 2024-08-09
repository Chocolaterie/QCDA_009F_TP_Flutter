import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_flutter_qcda_009f/home/component/card.dart';
import 'package:tp_flutter_qcda_009f/home/component/footer.dart';
import 'package:tp_flutter_qcda_009f/home/component/header.dart';
import 'package:tp_flutter_qcda_009f/home/message-view-model.dart';

class MyHomePage extends StatelessWidget {

  void onClickCallApi(BuildContext context) {
    // récupérer le viewmodel proprement en stateless
    MessageViewModel messageViewModel = context.read<MessageViewModel>();

    // appeler le view model
    messageViewModel.callApi(context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MessageViewModel(),
        builder: (context, child) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: const Text("Home Page"),
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
                                child: const Padding(
                                  padding: EdgeInsets.all(15),
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
              ));
        });
  }
}
