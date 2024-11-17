class WineEntity {
  final String name;
  final String image;
  final int criticScore;
  final String bottleSize;
  final int priceUsd;
  final String type;
  final String country;
  final String city;

  WineEntity({
    required this.name,
    required this.image,
    required this.criticScore,
    required this.bottleSize,
    required this.priceUsd,
    required this.type,
    required this.country,
    required this.city,
  });

  factory WineEntity.fromJson(Map<String, dynamic> json) {
    return WineEntity(
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
}
