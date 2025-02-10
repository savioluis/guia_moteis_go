// coverage:ignore-file

import 'package:json_annotation/json_annotation.dart';
import 'discount_dto.dart';

part 'period_dto.g.dart';

@JsonSerializable()
class PeriodDTO {
  final String tempoFormatado;
  final String tempo;
  final double valor;
  final double valorTotal;
  final bool temCortesia;
  final DiscountDTO? desconto;

  PeriodDTO({
    required this.tempoFormatado,
    required this.tempo,
    required this.valor,
    required this.valorTotal,
    required this.temCortesia,
    this.desconto,
  });

  factory PeriodDTO.fromJson(Map<String, dynamic> json) => _$PeriodDTOFromJson(json);
  Map<String, dynamic> toJson() => _$PeriodDTOToJson(this);
}
