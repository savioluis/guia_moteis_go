import 'package:json_annotation/json_annotation.dart';
import 'suite_dto.dart';

part 'motel_dto.g.dart';

@JsonSerializable()
class MotelDTO {
  final String fantasia;
  final String logo;
  final String bairro;
  final double distancia;
  final int qtdFavoritos;
  final List<SuiteDTO> suites;
  final int qtdAvaliacoes;
  final double media;

  MotelDTO({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.qtdFavoritos,
    required this.suites,
    required this.qtdAvaliacoes,
    required this.media,
  });

  factory MotelDTO.fromJson(Map<String, dynamic> json) => _$MotelDTOFromJson(json);
  Map<String, dynamic> toJson() => _$MotelDTOToJson(this);
}
