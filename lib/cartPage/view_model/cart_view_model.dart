import 'package:flutter/material.dart';
import 'package:storeapp/mainPage/model/main_model.dart';

class CartViewModel extends ChangeNotifier {
  List<MainModel> mainModelList = [];

  void addMainModel(MainModel? mainModel) {
    if (mainModel != null) {
      mainModelList.add(mainModel);
      notifyListeners();
    }
  }

  void removeMainModel(int index) {
      mainModelList.removeAt(index);
      notifyListeners();
  }
}
