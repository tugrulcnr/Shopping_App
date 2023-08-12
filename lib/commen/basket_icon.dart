import 'package:flutter/material.dart';
import 'package:storeapp/cartPage/view/cart_view.dart';

class BasketIcon extends StatefulWidget {
  const BasketIcon({super.key});

  @override
  State<BasketIcon> createState() => _BasketIconState();
}

class _BasketIconState extends State<BasketIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CartView()));
        },
        child: const Icon(
          Icons.shopping_basket_rounded,
          color: Colors.black,
        ),
      ),
    );
  }
}
