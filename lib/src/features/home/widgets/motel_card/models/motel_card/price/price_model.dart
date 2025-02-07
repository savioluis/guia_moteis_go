// ignore_for_file: public_member_api_docs, sort_constructors_first

class MotelPriceModel {
  final String duration;
  final double price;
  final double totalPrice;
  final bool hasCortesy;
  final double? discount;

  MotelPriceModel({
    required this.duration,
    required this.price,
    required this.totalPrice,
    required this.hasCortesy,
    this.discount,
  });
}
