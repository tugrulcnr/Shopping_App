// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:storeapp/mainPage/model/main_model.dart';
import 'package:storeapp/mainPage/service/main_service.dart';

class MainViewModel extends ChangeNotifier {
  final MainService mainService = MainService();
  List<MainModel>? mainModel = [];

  bool isLoaded = true;
  List<String> catagoryNames = [];

  MainViewModel() {
    fetchData().whenComplete(() => addNameToList(mainModel));
  }

   int selectedIndex = 0;

   
  void onItemTapped(int index) {
     selectedIndex = index;
     notifyListeners();
    
  }


  Future<void> fetchData() async {
    changeLoadingValue();
    mainModel = await mainService.getData() ?? [];
    changeLoadingValue();
    notifyListeners();
  }

  void changeLoadingValue() {
    isLoaded = !isLoaded;
    notifyListeners();
  }

  void addNameToList(List<MainModel>? mainModel) {
    if (mainModel != null) {
      for (int i = 0; i < (mainModel.length); i++) {
        if (!catagoryNames.contains(mainModel[i].category)) {
          catagoryNames.add(mainModel[i].category.toString());
        }
      }
    }
  }
}
