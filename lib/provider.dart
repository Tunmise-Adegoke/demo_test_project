import 'dart:convert';
import 'package:demo_test_project/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MusicProvider extends ChangeNotifier {
  bool isLoading = false;
  late String error;
  MusicModel model = MusicModel();

  void changeLoadingStatus(bool newValue) {
    isLoading = newValue;
    notifyListeners();
  }

  Future<void> fetchMusic() async {
    try {
      changeLoadingStatus(true);
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      if (response.statusCode == 200) {
        final List<dynamic> resData = jsonDecode(response.body);

        model = MusicModel.fromJson(resData);
      } else {
        error = 'Error fetching data';
      }
    } catch (e) {
      error = 'Error fetching data: $e';
    } finally {
      changeLoadingStatus(false);
    }
  }
}
