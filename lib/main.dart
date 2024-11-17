import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentation/screens/home_screen.dart';
import 'data/datasources/wine_datasource.dart';
import 'data/repositories/wine_repository_impl.dart';
import 'domain/usecases/get_wines.dart';
import 'domain/usecases/filter_wines.dart';
import 'presentation/controllers/wine_controller.dart';

void main() {
  final dataSource = WineDataSource();
  final repository = WineRepositoryImpl(dataSource);
  final getWinesUseCase = GetWines(repository);
  final filterWinesUseCase = FilterWines(repository);

  Get.put(WineController(
    getWinesUseCase: getWinesUseCase,
    filterWinesUseCase: filterWinesUseCase,
  ));

  runApp(MyApp(
    getWinesUseCase: getWinesUseCase,
    filterWinesUseCase: filterWinesUseCase,
  ));
}

class MyApp extends StatelessWidget {
  final GetWines getWinesUseCase;
  final FilterWines filterWinesUseCase;

  const MyApp({
    Key? key,
    required this.getWinesUseCase,
    required this.filterWinesUseCase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drink Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(
        getWinesUseCase: getWinesUseCase,
        filterWinesUseCase: filterWinesUseCase,
      ),
    );
  }
}
