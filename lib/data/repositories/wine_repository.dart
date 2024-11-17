import '../../domain/models/wine.dart';

abstract class WineRepository {
  Future<List<Wine>> getWines();
  Future<List<Wine>> filterWines(String query);
}
