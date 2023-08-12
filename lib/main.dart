import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/cartPage/view_model/cart_view_model.dart';
import 'package:storeapp/mainPage/view/main_view.dart';
import 'package:storeapp/mainPage/view_model/main_view_model.dart';

void main() {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MainViewModel()),
      ChangeNotifierProvider(create: (_) => CartViewModel()),
    ],
    child: MyApp()));
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
