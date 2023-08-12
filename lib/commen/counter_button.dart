import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  const CounterButton({super.key});

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int _counter = 0;
  double _iconSize = 20;
  Color _iconColor = Colors.amber.shade900;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: _decrementCounter,
                child: Icon(
                  Icons.remove,
                  color: _iconColor,
                )),
            const VerticalDivider(),
            Text(
              '$_counter',
              style: TextStyle(fontSize: _iconSize),
            ),
            VerticalDivider(),
            InkWell(
                onTap: _incrementCounter,
                child: Icon(
                  Icons.add,
                  color: _iconColor,
                )),
          ],
        ),
      ),
    );
  }
}
