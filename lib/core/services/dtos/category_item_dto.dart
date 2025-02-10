// coverage:ignore-file

import 'package:json_annotation/json_annotation.dart';

part 'category_item_dto.g.dart';

@JsonSerializable()
class CategoryItemDTO {
  final String nome;
  final String icone;

  CategoryItemDTO({
    required this.nome,
    required this.icone,
  });

  factory CategoryItemDTO.fromJson(Map<String, dynamic> json) => _$CategoryItemDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryItemDTOToJson(this);
}
