import 'package:flutter/material.dart';

class Subcategory {
  final String label;
  final String imagePath;
  final int bottleCount;

  Subcategory({required this.label, required this.imagePath, required this.bottleCount});
}

class FilterSection extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onFilterChanged;

  FilterSection({required this.selectedCategory, required this.onFilterChanged});

  final Map<String, List<Subcategory>> subcategoriesByCategory = {
    'Type': [
      Subcategory(label: "Red Wine", imagePath: 'assets/images/red_wine.jpg', bottleCount: 24),
      Subcategory(label: "White Wine", imagePath: 'assets/images/white_wine.jpg', bottleCount: 15),
      Subcategory(label: "Rosé Wine", imagePath: 'assets/images/rose_wine.jpg', bottleCount: 18),
      Subcategory(label: "Sparkling Wine", imagePath: 'assets/images/sparkling_wine.jpg', bottleCount: 12),
    ],
    'Style': [
      Subcategory(label: "Dry Wine", imagePath: 'assets/images/dry_wine.jpg', bottleCount: 10),
      Subcategory(label: "Sweet Wine", imagePath: 'assets/images/sweet_wine.jpg', bottleCount: 22),
      Subcategory(label: "Semi-Sweet Wine", imagePath: 'assets/images/semi_sweet_wine.jpg', bottleCount: 20),
    ],
    'Countries': [
      Subcategory(label: "France", imagePath: 'assets/images/france_flag.jpg', bottleCount: 30),
      Subcategory(label: "Spain", imagePath: 'assets/images/spain_flag.jpg', bottleCount: 25),
      Subcategory(label: "Moldova", imagePath: 'assets/images/moldova_flag.jpg', bottleCount: 17),
      Subcategory(label: "Georgia", imagePath: 'assets/images/georgia_flag.jpg', bottleCount: 11),
    ],
    'Grape': [
      Subcategory(label: "Cabernet Sauvignon", imagePath: 'assets/images/cabernet_sauvignon.jpg', bottleCount: 16),
      Subcategory(label: "Merlot", imagePath: 'assets/images/merlot.jpg', bottleCount: 12),
      Subcategory(label: "Chardonnay", imagePath: 'assets/images/chardonnay.jpg', bottleCount: 13),
      Subcategory(label: "Pinot Noir", imagePath: 'assets/images/pinot_noir.jpg', bottleCount: 18),
    ],
  };

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenWidth - 40) / 4;

    final subcategories = subcategoriesByCategory[selectedCategory] ?? [];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...subcategoriesByCategory.keys.map((category) {
                  bool isSelected = selectedCategory == category;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        onFilterChanged(category);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.pink[100] : Colors.white,
                          border: Border.all(
                            color: isSelected ? Colors.pink : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            category,
                            style: TextStyle(
                              color: isSelected ? Colors.pink : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: subcategories.length,
              itemBuilder: (context, index) {
                final subcategory = subcategories[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      onFilterChanged(subcategory.label);
                    },
                    child: SubcategoryItem(subcategory: subcategory),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SubcategoryItem extends StatelessWidget {
  final Subcategory subcategory;

  SubcategoryItem({required this.subcategory});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 120,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
            image: DecorationImage(
              image: AssetImage(subcategory.imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                subcategory.label,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Positioned(
          right: 4,
          top: 4,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '${subcategory.bottleCount}',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
