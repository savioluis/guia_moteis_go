// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motel_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MotelDataDTO _$MotelDataDTOFromJson(Map<String, dynamic> json) => MotelDataDTO(
      pagina: (json['pagina'] as num).toInt(),
      qtdPorPagina: (json['qtdPorPagina'] as num).toInt(),
      totalSuites: (json['totalSuites'] as num).toInt(),
      totalMoteis: (json['totalMoteis'] as num).toInt(),
      raio: (json['raio'] as num).toDouble(),
      maxPaginas: (json['maxPaginas'] as num).toInt(),
      moteis: (json['moteis'] as List<dynamic>)
          .map((e) => MotelDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MotelDataDTOToJson(MotelDataDTO instance) =>
    <String, dynamic>{
      'pagina': instance.pagina,
      'qtdPorPagina': instance.qtdPorPagina,
      'totalSuites': instance.totalSuites,
      'totalMoteis': instance.totalMoteis,
      'raio': instance.raio,
      'maxPaginas': instance.maxPaginas,
      'moteis': instance.moteis,
    };
