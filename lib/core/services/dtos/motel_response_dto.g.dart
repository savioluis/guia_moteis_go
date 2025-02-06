// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motel_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MotelResponseDTO _$MotelResponseDTOFromJson(Map<String, dynamic> json) =>
    MotelResponseDTO(
      sucesso: json['sucesso'] as bool,
      data: MotelDataDTO.fromJson(json['data'] as Map<String, dynamic>),
      mensagem: json['mensagem'] as List<dynamic>,
    );

Map<String, dynamic> _$MotelResponseDTOToJson(MotelResponseDTO instance) =>
    <String, dynamic>{
      'sucesso': instance.sucesso,
      'data': instance.data,
      'mensagem': instance.mensagem,
    };
