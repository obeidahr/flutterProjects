import 'package:example_mvvm/core/models/product.dart';
import 'package:example_mvvm/core/services/api.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier{
  List<Product>productList = [];
  bool isLoading = false;
  Future<void>getAllProduct()async{
    final myList = await Api.instance.getProducts();
    productList = myList!.map((Object) => Product.fromJson(Object)).toList();
    isLoading = true;
    notifyListeners();
  }
  void searchItem(String data){
    if(data == ""){
      getAllProduct();
    }
    else{
      productList = productList.where((element) => element.title!.contains(data)).toList();
      notifyListeners();
    }
  }
}