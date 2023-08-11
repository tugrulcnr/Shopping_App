import 'package:flutter/material.dart';
import 'package:storeapp/commen/card_widget.dart';
import 'package:storeapp/mainPage/model/main_model.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key, this.mainModel});

  final  MainModel? mainModel;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.black)
      ,),
      body: (MainModel != null) ? Stack(
        
        children: [
          Positioned(
            top: 0,
            bottom: MediaQuery.of(context).size.height * 0.35,
            left: 0,
            right: 0,
            child: Card(
              color: Colors.pink,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            bottom: 0,
            left: 0,
            right: 0,
            child: CardWidget(
              mainModel: widget.mainModel, height: MediaQuery.of(context).size.height / 3, width: MediaQuery.of(context).size.width,
            ),
          ),


      ],

      ) : CircularProgressIndicator(),
    );
  }
}