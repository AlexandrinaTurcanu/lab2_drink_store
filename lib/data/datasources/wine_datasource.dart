import '../entities/wine_entity.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class WineDataSource {
  Future<List<WineEntity>> fetchWines() async {
    try {
      final String response = await rootBundle.loadString('assets/data/v3.json');
      final data = json.decode(response);

      return (data['carousel'] as List).map((e) => WineEntity.fromJson(e)).toList();
    } catch (e) {
      print("Error loading JSON data: $e");
      return [];
    }
  }
}
