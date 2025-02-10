// coverage:ignore-file

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodDTO _$PeriodDTOFromJson(Map<String, dynamic> json) => PeriodDTO(
      tempoFormatado: json['tempoFormatado'] as String,
      tempo: json['tempo'] as String,
      valor: (json['valor'] as num).toDouble(),
      valorTotal: (json['valorTotal'] as num).toDouble(),
      temCortesia: json['temCortesia'] as bool,
      desconto: json['desconto'] == null
          ? null
          : DiscountDTO.fromJson(json['desconto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PeriodDTOToJson(PeriodDTO instance) => <String, dynamic>{
      'tempoFormatado': instance.tempoFormatado,
      'tempo': instance.tempo,
      'valor': instance.valor,
      'valorTotal': instance.valorTotal,
      'temCortesia': instance.temCortesia,
      'desconto': instance.desconto,
    };
