import 'package:flutter/material.dart';

class ColorCard extends StatefulWidget {
  ColorCard({super.key});

  @override
  State<ColorCard> createState() => _ColorCardState();
}

class _ColorCardState extends State<ColorCard> {
  int selectedContainerIndex = -1;

  List<Color> color = [
    Colors.pink.shade300,
    Colors.green.shade300,
    Colors.orange.shade900,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (Color element in color)
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedContainerIndex = element.value;
                });
                
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: selectedContainerIndex == element.value ?  Colors.blueAccent : Colors.transparent),
                  color: element,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
