import 'package:flutter/material.dart';
import 'package:storeapp/mainPage/model/main_model.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.mainModel,
    this.canClick = false, this.onTap, required this.width, required this.height
  });

  final MainModel? mainModel;
  final String haveNot = "Empty Value";
  final bool canClick;
  final Function()? onTap;
  final double width;
  final double height;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width,
          height: height,
          child: InkWell(
            onTap: canClick ? onTap : null,
            child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ImageWidget(mainModel: mainModel),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
          child: Text(
            (mainModel?.title.toString() ?? haveNot),
            maxLines: 1,
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0,bottom: 10),
          child: Text(
            ("\$${mainModel?.price.toString() ?? haveNot}") ,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.mainModel,
  });

  final MainModel? mainModel;

  @override
  Widget build(BuildContext context) {
    return Image.network(mainModel?.image ??
        "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg");
  }
}
