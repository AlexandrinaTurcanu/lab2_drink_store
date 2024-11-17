import 'package:get/get.dart';
import '../../domain/usecases/get_wines.dart';
import '../../domain/usecases/filter_wines.dart';
import '../../domain/models/wine.dart';

class WineController extends GetxController {
  final GetWines getWinesUseCase;
  final FilterWines filterWinesUseCase;

  WineController({
    required this.getWinesUseCase,
    required this.filterWinesUseCase,
  });

  var wines = <Wine>[].obs;
  var filteredWines = <Wine>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchWines();
  }

  Future<void> fetchWines() async {
    isLoading(true);
    wines.value = await getWinesUseCase();
    filteredWines.value = wines;
    isLoading(false);
  }

  void filterWines(String query) async {
    filteredWines.value = await filterWinesUseCase(query);
  }
}
