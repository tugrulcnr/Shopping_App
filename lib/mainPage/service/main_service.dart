import 'package:dio/dio.dart';
import 'package:storeapp/mainPage/model/main_model.dart';

class MainService {
  final _service = Dio();
  final _url = "https://fakestoreapi.com/products";

  Future<List<MainModel>?> getData() async {
    final response = await _service.get(_url);
    if (response.statusCode == 200) {
      final data = response.data;
      if (data is List) {
        return data.map((e) => MainModel.fromJson(e)).toList();
      }
    }
    return null;
  }
}
