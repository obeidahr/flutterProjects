import 'dart:convert';
import 'package:example_mvvm/utils/constants.dart';
import 'package:http/http.dart' as http;

class Api {
  static Api instance = Api();

  //getProducts
  Future<List<dynamic>?> getProducts() async {
    try {
      final response = await http.get(Uri.parse(apiLink));

      if (response.statusCode == Success) {
        
        final body = jsonDecode(response.body);
        return body;
      }
    } catch (e) {
      print(e);
    }
  }
}
