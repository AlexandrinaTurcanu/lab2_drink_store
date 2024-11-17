import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab2_drink_store/main.dart';
import 'package:lab2_drink_store/data/datasources/wine_datasource.dart';
import 'package:lab2_drink_store/data/repositories/wine_repository_impl.dart';
import 'package:lab2_drink_store/domain/usecases/get_wines.dart';
import 'package:lab2_drink_store/domain/usecases/filter_wines.dart';

void main() {
  testWidgets('HomeScreen widget test', (WidgetTester tester) async {
    // Configure dependencies
    final dataSource = WineDataSource();
    final repository = WineRepositoryImpl(dataSource);
    final getWinesUseCase = GetWines(repository);
    final filterWinesUseCase = FilterWines(repository);

    // Build the app and pass the dependencies
    await tester.pumpWidget(
      MyApp(
        getWinesUseCase: getWinesUseCase,
        filterWinesUseCase: filterWinesUseCase,
      ),
    );

    // Verify initial elements on the screen
    expect(find.text('Shop wines by'), findsOneWidget);
    expect(find.text('Wine'), findsOneWidget);

    // Perform additional widget-specific tests if needed
  });
}
