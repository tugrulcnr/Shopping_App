import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/cartPage/view_model/cart_view_model.dart';

class CartView extends StatefulWidget {
  CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: ListView.builder(
          itemCount: value.mainModelList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: value.mainModelList[index].image != null
                    ? Stack(alignment: Alignment.topRight, children: [
                        InkWell(
                            onTap: () {
                              value.removeMainModel(index);
                            },
                            child: Icon(Icons.delete)),
                        Row(
                          children: [
                            SizedBox(
                                height: 100,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.network(
                                      value.mainModelList[index].image ?? ""),
                                )),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: Text(
                                      value.mainModelList[index].title
                                          .toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  child: Text(value.mainModelList[index].price
                                      .toString()),
                                ),
                                
                              ],
                            ),
                          ],
                        ),
                      ])
                    : CircularProgressIndicator(),
              ),
            );
          },
        ),
      );
    });
  }
}
