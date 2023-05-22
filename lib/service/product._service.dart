import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product {
  static const baseUrl = "http://localhost:3000/api/";

  static addproduct(Map pdata) async {
    print(pdata);
    var url = Uri.parse("${baseUrl}posts");

    final res = await http.post(url, body: pdata);
    try {
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Failed to get response");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
