import 'package:flutter/material.dart';
import 'package:storeapp/commen/card_widget.dart';
import 'package:storeapp/mainPage/view_model/main_view_model.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends MainViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        title: Text("Top Sales",style: TextStyle(color: Colors.black, fontSize: 22),),
        actions: const [Padding(
          padding:  EdgeInsets.only(right: 20),
          child: Icon(Icons.shopping_basket_rounded,color: Colors.black,),
        ),],
      ),
      body: isLoaded ? ListView.builder(
        itemCount: ((mainModel?.length ?? 10)~/2) ,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: CardWidget(mainModel: mainModel?[index*2])),
              Expanded(child: CardWidget(mainModel: mainModel?[index*2 +1]))
              ,
            ],
          ) ;
        },
      ): Center(child: CircularProgressIndicator())
    );
  }
}