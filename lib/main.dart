import 'package:flutter/material.dart';
import 'package:storeapp/mainPage/view/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ).copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          elevation: 0,
        ),
        
      ),
      home: MainView(),
    );
  }
}
