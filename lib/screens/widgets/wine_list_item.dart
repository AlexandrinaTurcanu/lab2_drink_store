import 'package:flutter/material.dart';
import '../../models/wine.dart';
import 'favourite_button.dart';

class WineListItem extends StatelessWidget {
  final Wine wine;

  WineListItem({required this.wine});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                ),
                child: Image.asset(
                  wine.image,
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: wine.isAvailable ? Colors.lightGreen[100] : Colors.redAccent,
                        ),
                        child: Text(
                          wine.isAvailable ? 'Available' : 'Unavailable',
                          style: TextStyle(
                            color: wine.isAvailable ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        wine.name,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4.0),
                      Row(
                        children: [
                          Icon(Icons.local_drink, size: 16),
                          SizedBox(width: 4),
                          Text('${wine.type} (${wine.grape})'),
                        ],
                      ),
                      SizedBox(height: 4.0),
                      Text('${wine.country}, ${wine.region}'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FavouriteButton(wine: wine),
                    SizedBox(height: 4),
                    Text('Critics Score: ${wine.criticsScore}/100'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Price: ${wine.price}'),
                    SizedBox(height: 4),
                    Text('Bottle: ${wine.volume}ml'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
