import 'package:json_annotation/json_annotation.dart';

part 'item_dto.g.dart';

@JsonSerializable()
class ItemDTO {
  final String nome;

  ItemDTO({required this.nome});

  factory ItemDTO.fromJson(Map<String, dynamic> json) => _$ItemDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ItemDTOToJson(this);
}
