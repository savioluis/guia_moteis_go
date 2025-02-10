// coverage:ignore-file

import 'package:json_annotation/json_annotation.dart';
import 'motel_data_dto.dart';

part 'motel_response_dto.g.dart';

@JsonSerializable()
class MotelResponseDTO {
  final bool sucesso;
  final MotelDataDTO data;
  final List<dynamic> mensagem;

  MotelResponseDTO({
    required this.sucesso,
    required this.data,
    required this.mensagem,
  });

  factory MotelResponseDTO.fromJson(Map<String, dynamic> json) => _$MotelResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$MotelResponseDTOToJson(this);
}
