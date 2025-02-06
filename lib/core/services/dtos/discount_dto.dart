import 'package:json_annotation/json_annotation.dart';

part 'discount_dto.g.dart';

@JsonSerializable()
class DiscountDTO {
  final double desconto;

  DiscountDTO({required this.desconto});

  factory DiscountDTO.fromJson(Map<String, dynamic> json) => _$DiscountDTOFromJson(json);
  Map<String, dynamic> toJson() => _$DiscountDTOToJson(this);
}
