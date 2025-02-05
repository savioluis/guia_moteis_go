// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CarouselItemModel {
  final String name;
  final String location;
  final double discountPercentage;
  final double startPrice;
  
  CarouselItemModel({
    required this.name,
    required this.location,
    required this.discountPercentage,
    required this.startPrice,
  });

  CarouselItemModel copyWith({
    String? name,
    String? location,
    double? discountPercentage,
    double? startPrice,
  }) {
    return CarouselItemModel(
      name: name ?? this.name,
      location: location ?? this.location,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      startPrice: startPrice ?? this.startPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'location': location,
      'discountPercentage': discountPercentage,
      'startPrice': startPrice,
    };
  }

  factory CarouselItemModel.fromMap(Map<String, dynamic> map) {
    return CarouselItemModel(
      name: map['name'] as String,
      location: map['location'] as String,
      discountPercentage: map['discountPercentage'] as double,
      startPrice: map['startPrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarouselItemModel.fromJson(String source) =>
      CarouselItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CarouselItemModel(name: $name, location: $location, discountPercentage: $discountPercentage, startPrice: $startPrice)';
  }

  @override
  bool operator ==(covariant CarouselItemModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.location == location &&
        other.discountPercentage == discountPercentage &&
        other.startPrice == startPrice;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        location.hashCode ^
        discountPercentage.hashCode ^
        startPrice.hashCode;
  }
}
