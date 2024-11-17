import '../../data/repositories/wine_repository.dart';
import '../models/wine.dart';

class GetWines {
  final WineRepository repository;

  GetWines(this.repository);

  Future<List<Wine>> call() async {
    return await repository.getWines();
  }
}
