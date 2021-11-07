import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/models/posts.dart';
import '/config/constants.dart';
import '/models/user.dart';

class ProductService with ChangeNotifier {
  User localUser;

  ProductService(this.localUser);

  List<Posts> _items = [];

  List<Posts> get items {
    return [..._items];
  }

  Future<void> getPosts() async {
    final url = Uri.parse(Constants.BASE_URL);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        _items = json
            .decode(response.body)
            .map<Posts>((data) => Posts.fromJson(data))
            .toList();
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }
}
