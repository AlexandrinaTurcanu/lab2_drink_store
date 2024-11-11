import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/wine_controller.dart';
import 'widgets/custom_search_bar.dart';
import 'widgets/filter_section.dart';
import 'widgets/wine_list_item.dart';
import 'widgets/location_widget.dart';
import 'widgets/notification_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final WineController wineController = Get.put(WineController());
  String selectedCategory = 'Type';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterWines);
  }

  void _filterWines() {
    wineController.filterWines(_searchController.text);
  }

  void _onFilterChanged(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: LocationWidget(
                      mainLocation: 'Donnerville Drive',
                      subLocation: '4 Donnerville Hall, Donnerville Drive',
                    ),
                  ),
                  SizedBox(width: 16),
                  NotificationButton(notificationCount: 3),
                ],
              ),
            ),
            SizedBox(height: 16),
            CustomSearchBar(controller: _searchController),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Shop wines by',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            FilterSection(
              selectedCategory: selectedCategory,
              onFilterChanged: _onFilterChanged,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Wine', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      print('View all pressed');
                    },
                    child: Text('View all'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                if (wineController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                if (wineController.filteredWines.isEmpty) {
                  return Center(child: Text('No wines found.'));
                }

                return ListView.builder(
                  itemCount: wineController.filteredWines.length,
                  itemBuilder: (context, index) {
                    return WineListItem(wine: wineController.filteredWines[index]);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
