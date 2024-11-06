import '../models/wine.dart';

final List<Wine> mockWines = [
  Wine(
    name: 'Cabernet Sauvignon 2018',
    type: 'Red',
    grape: 'Cabernet Sauvignon',
    country: 'France',
    region: 'Bordeaux',
    price: '\$25',
    image: 'assets/images/wine_bottle_2.jpg',
    isAvailable: true,
    criticsScore: 90,
  ),
  Wine(
    name: 'Merlot 2019',
    type: 'Red',
    grape: 'Merlot',
    country: 'Spain',
    region: 'Rioja',
    price: '\$20',
    image: 'assets/images/wine_bottle_2.jpg',
    isAvailable: true,
    criticsScore: 88,
  ),
  Wine(
    name: 'Chardonnay 2020',
    type: 'White',
    grape: 'Chardonnay',
    country: 'Moldova',
    region: 'Codru',
    price: '\$15',
    image: 'assets/images/wine_bottle_3.jpg',
    isAvailable: true,
    criticsScore: 85,
  ),

];
