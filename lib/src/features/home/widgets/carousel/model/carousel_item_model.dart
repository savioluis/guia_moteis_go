import 'dart:convert';

class CarouselItemModel {
  final String name;
  final String location;
  final double discountPercentage;
  final double startPrice;
  final String imageUrl;

  CarouselItemModel({
    required this.name,
    required this.location,
    required this.discountPercentage,
    required this.startPrice,
    required this.imageUrl,
  });

  static List<CarouselItemModel> exampleCarousel({required int amount}) {
    return List.generate(
      amount,
      (index) => CarouselItemModel(
        name: 'Motel ${index++}',
        location: 'bairro ${index++} - cidade ${index++}',
        discountPercentage: (10.0 * index),
        startPrice: ((98.5 * index) + 5 * index),
        imageUrl:
            'https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/17418-Marselha-Sexy/fotos/ed3ff4dc-3049-42ab-8913-c45305f4a9ed-suites.jpg',
      ),
    );
  }

  CarouselItemModel copyWith({
    String? name,
    String? location,
    double? discountPercentage,
    double? startPrice,
    String? imageUrl,
  }) {
    return CarouselItemModel(
      name: name ?? this.name,
      location: location ?? this.location,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      startPrice: startPrice ?? this.startPrice,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'location': location,
      'discountPercentage': discountPercentage,
      'startPrice': startPrice,
      'imageUrl': imageUrl,
    };
  }

  factory CarouselItemModel.fromMap(Map<String, dynamic> map) {
    return CarouselItemModel(
      name: map['name'] as String,
      location: map['location'] as String,
      discountPercentage: map['discountPercentage'] as double,
      startPrice: map['startPrice'] as double,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarouselItemModel.fromJson(String source) =>
      CarouselItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CarouselItemModel(name: $name, location: $location, discountPercentage: $discountPercentage, startPrice: $startPrice, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant CarouselItemModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.location == location &&
        other.discountPercentage == discountPercentage &&
        other.startPrice == startPrice &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        location.hashCode ^
        discountPercentage.hashCode ^
        startPrice.hashCode ^
        imageUrl.hashCode;
  }
}
