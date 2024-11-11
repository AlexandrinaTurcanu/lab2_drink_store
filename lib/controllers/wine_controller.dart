import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/wine.dart';

class WineController extends GetxController {
  var wines = <Wine>[].obs;
  var filteredWines = <Wine>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    isLoading(true);
    try {
      final String response = await rootBundle.loadString('assets/data/v3.json');
      final data = json.decode(response);
      wines.value = (data['carousel'] as List).map((e) => Wine.fromJson(e)).toList();
      filteredWines.value = wines;
    } catch (e) {
      print("Error loading JSON data: $e");
    } finally {
      isLoading(false);
    }
  }

  void filterWines(String query) {
    if (query.isEmpty) {
      filteredWines.value = wines;
    } else {
      filteredWines.value = wines
          .where((wine) => wine.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
