import '../datasources/wine_datasource.dart';
import '../../domain/models/wine.dart';
import 'wine_repository.dart';


class WineRepositoryImpl implements WineRepository {
  final WineDataSource dataSource;

  WineRepositoryImpl(this.dataSource);

  @override
  Future<List<Wine>> getWines() async {
    final entities = await dataSource.fetchWines();
    return entities.map((e) => Wine(
      name: e.name,
      image: e.image,
      criticScore: e.criticScore,
      bottleSize: e.bottleSize,
      priceUsd: e.priceUsd,
      type: e.type,
      country: e.country,
      city: e.city,
    )).toList();
  }

  @override
  Future<List<Wine>> filterWines(String query) async {
    final wines = await getWines();
    return wines.where((wine) => wine.name.toLowerCase().contains(query.toLowerCase())).toList();
  }
}
