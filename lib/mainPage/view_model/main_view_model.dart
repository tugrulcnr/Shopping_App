import 'package:flutter/material.dart';
import 'package:storeapp/mainPage/model/main_model.dart';
import 'package:storeapp/mainPage/service/main_service.dart';
import 'package:storeapp/mainPage/view/main_view.dart';


abstract class MainViewModel extends State<MainView> {

  late final MainService mainService;
  late List<MainModel>? mainModel = [];
  late bool isLoaded = true;

  @override
  void initState() {
    super.initState();
    mainService = MainService();
    fetchData();
  }

  Future<void> fetchData() async {
    changeLoadingValue();
    mainModel = await mainService.getData() ?? [];
    changeLoadingValue();
    setState(() {});
  }

  void changeLoadingValue() {
    isLoaded = !isLoaded;
  }


  
}