import 'package:flutter/material.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/filter_section.dart';
import '../widgets/wine_list_item.dart';
import '../widgets/location_widget.dart';
import '../widgets/notification_button.dart';

class HomeScreen extends StatefulWidget {
  final Function(String) filterWinesUseCase;
  final Future<List<dynamic>> Function() getWinesUseCase;

  const HomeScreen({
    Key? key,
    required this.filterWinesUseCase,
    required this.getWinesUseCase,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> wines = [];
  List<dynamic> filteredWines = [];
  bool isLoading = true;
  String selectedCategory = 'Type';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterWines);
    _loadWines();
  }

  Future<void> _loadWines() async {
    setState(() {
      isLoading = true;
    });
    try {
      wines = await widget.getWinesUseCase();
      filteredWines = wines;
    } catch (e) {
      print('Error loading wines: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _filterWines() {
    final query = _searchController.text;
    if (query.isEmpty) {
      setState(() {
        filteredWines = wines;
      });
    } else {
      setState(() {
        filteredWines = widget.filterWinesUseCase(query);
      });
    }
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
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : filteredWines.isEmpty
                  ? Center(child: Text('No wines found.'))
                  : ListView.builder(
                itemCount: filteredWines.length,
                itemBuilder: (context, index) {
                  return WineListItem(wine: filteredWines[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
