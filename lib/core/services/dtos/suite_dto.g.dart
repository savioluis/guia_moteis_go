// coverage:ignore-file

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suite_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuiteDTO _$SuiteDTOFromJson(Map<String, dynamic> json) => SuiteDTO(
      nome: json['nome'] as String,
      qtd: (json['qtd'] as num).toInt(),
      exibirQtdDisponiveis: json['exibirQtdDisponiveis'] as bool,
      fotos: (json['fotos'] as List<dynamic>).map((e) => e as String).toList(),
      itens: (json['itens'] as List<dynamic>)
          .map((e) => ItemDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoriaItens: (json['categoriaItens'] as List<dynamic>)
          .map((e) => CategoryItemDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      periodos: (json['periodos'] as List<dynamic>)
          .map((e) => PeriodDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SuiteDTOToJson(SuiteDTO instance) => <String, dynamic>{
      'nome': instance.nome,
      'qtd': instance.qtd,
      'exibirQtdDisponiveis': instance.exibirQtdDisponiveis,
      'fotos': instance.fotos,
      'itens': instance.itens,
      'categoriaItens': instance.categoriaItens,
      'periodos': instance.periodos,
    };
