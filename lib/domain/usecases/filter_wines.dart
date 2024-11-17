import '../../data/repositories/wine_repository.dart';
import '../models/wine.dart';

class FilterWines {
  final WineRepository repository;

  FilterWines(this.repository);

  Future<List<Wine>> call(String query) async {
    return await repository.filterWines(query);
  }
}
