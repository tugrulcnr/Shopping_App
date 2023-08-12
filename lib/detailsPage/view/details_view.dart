import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/cartPage/view_model/cart_view_model.dart';
import 'package:storeapp/commen/basket_icon.dart';
import 'package:storeapp/commen/card_widget.dart';
import 'package:storeapp/commen/card_widget_details.dart';
import 'package:storeapp/mainPage/model/main_model.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key, this.mainModel});

  final MainModel? mainModel;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          actions: const [
            BasketIcon(),
          ],
        ),
        body: (MainModel != null)
            ? Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: MediaQuery.of(context).size.height * 0.35,
                    left: 0,
                    right: 0,
                    child: CardWidget(
                      mainModel: widget.mainModel,
                      height: MediaQuery.of(context).size.height / 2.7,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.height * 0.35,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: CardWidgetForDetails(
                        mainModel: widget.mainModel ?? null,
                        onTap: () {
                          value.addMainModel(widget.mainModel);
                        },
                      )),
                ],
              )
            : CircularProgressIndicator(),
      );
    });
  }
}
