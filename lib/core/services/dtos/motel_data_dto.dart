// coverage:ignore-file

import 'package:json_annotation/json_annotation.dart';
import 'motel_dto.dart';

part 'motel_data_dto.g.dart';

@JsonSerializable()
class MotelDataDTO {
  final int pagina;
  final int qtdPorPagina;
  final int totalSuites;
  final int totalMoteis;
  final double raio;
  final int maxPaginas;
  final List<MotelDTO> moteis;

  MotelDataDTO({
    required this.pagina,
    required this.qtdPorPagina,
    required this.totalSuites,
    required this.totalMoteis,
    required this.raio,
    required this.maxPaginas,
    required this.moteis,
  });

  factory MotelDataDTO.fromJson(Map<String, dynamic> json) => _$MotelDataDTOFromJson(json);
  Map<String, dynamic> toJson() => _$MotelDataDTOToJson(this);
}
