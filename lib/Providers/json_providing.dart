import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/model_class.dart';

class JsonProvider extends ChangeNotifier {
  List dataList = [];
  List<Planet> userList = [];
  List<Planet> bookmarkedList = [];

  JsonProvider() {
    print('--------------------- data called ----------------');
    jsonParsing();
    loadBookmarkedPlanets();
    print('--------------------- Done ----------------');
  }

  Future<void> jsonParsing() async {
    String? json = await rootBundle.loadString('assets/json/data.json');
    dataList = jsonDecode(json);

    userList = dataList.map((e) => Planet.fromJson(e)).toList();
    notifyListeners();
  }

  Future<void> loadBookmarkedPlanets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? bookmarkedPlanets = prefs.getStringList('bookmarkedPlanets');

    if (bookmarkedPlanets != null) {
      bookmarkedList = userList
          .where((planet) => bookmarkedPlanets.contains(planet.name))
          .toList();
      notifyListeners();
    }
  }

  Future<void> saveBookmarkedPlanets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> bookmarkedPlanets =
    bookmarkedList.map((planet) => planet.name).toList();
    await prefs.setStringList('bookmarkedPlanets', bookmarkedPlanets);
  }

  void toggleBookmark(Planet planet) {
    if (bookmarkedList.contains(planet)) {
      bookmarkedList.remove(planet);
    } else {
      bookmarkedList.add(planet);
    }
    saveBookmarkedPlanets();
    notifyListeners();
  }
}
