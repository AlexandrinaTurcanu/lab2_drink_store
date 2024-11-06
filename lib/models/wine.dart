class Wine {
  final String name;
  final String type;
  final String grape;
  final String country;
  final String region;
  final String price;
  final String image;
  final bool isAvailable;
  final int criticsScore;
  final int volume;
  bool isFavourite;

  Wine({
    required this.name,
    required this.type,
    required this.grape,
    required this.country,
    required this.region,
    required this.price,
    required this.image,
    required this.isAvailable,
    required this.criticsScore,
    this.volume = 750,
    this.isFavourite = false,
  });

  Wine copyWith({bool? isFavourite}) {
    return Wine(
      name: name,
      type: type,
      grape: grape,
      country: country,
      region: region,
      price: price,
      image: image,
      isAvailable: isAvailable,
      criticsScore: criticsScore,
      volume: volume,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}
