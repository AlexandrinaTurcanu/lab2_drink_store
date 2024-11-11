import 'package:flutter/material.dart';
import '../../models/wine.dart';

class FavouriteButton extends StatefulWidget {
  final Wine wine;

  const FavouriteButton({Key? key, required this.wine}) : super(key: key);

  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  late bool isFavourite;

  @override
  void initState() {
    super.initState();
    isFavourite = widget.wine.isFavourite;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          isFavourite = !isFavourite;
          widget.wine.isFavourite = isFavourite;
        });
      },
      style: TextButton.styleFrom(
        backgroundColor: isFavourite ? Colors.pink : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            color: isFavourite ? Colors.pink : Colors.grey,
            width: 1.5,
          ),
        ),
      ),
      child: Row(
        children: [
          IconTheme(
            data: IconThemeData(
              color: isFavourite ? Colors.white : Colors.grey,
            ),
            child: Icon(
              isFavourite ? Icons.favorite : Icons.favorite_outline,
            ),
          ),
          SizedBox(width: 8),
          Text(
            isFavourite ? 'Added' : 'Favourite',
            style: TextStyle(
              color: isFavourite ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
