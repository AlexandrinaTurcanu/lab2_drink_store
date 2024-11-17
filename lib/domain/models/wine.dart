class Wine {
  final String name;
  final String image;
  final int criticScore;
  final String bottleSize;
  final int priceUsd;
  final String type;
  final String country;
  final String city;
  bool isFavourite;

  Wine({
    required this.name,
    required this.image,
    required this.criticScore,
    required this.bottleSize,
    required this.priceUsd,
    required this.type,
    required this.country,
    required this.city,
    this.isFavourite = false,
  });

  factory Wine.fromJson(Map<String, dynamic> json) {
    return Wine(
      name: json['name'],
      image: json['image'],
      criticScore: json['critic_score'],
      bottleSize: json['bottle_size'],
      priceUsd: json['price_usd'],
      type: json['type'],
      country: json['from']['country'],
      city: json['from']['city'],
    );
  }

  Wine copyWith({bool? isFavourite}) {
    return Wine(
      name: name,
      image: image,
      criticScore: criticScore,
      bottleSize: bottleSize,
      priceUsd: priceUsd,
      type: type,
      country: country,
      city: city,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}
