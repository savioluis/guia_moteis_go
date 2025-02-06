import 'package:json_annotation/json_annotation.dart';
import 'item_dto.dart';
import 'category_item_dto.dart';
import 'period_dto.dart';

part 'suite_dto.g.dart';

@JsonSerializable()
class SuiteDTO {
  final String nome;
  final int qtd;
  final bool exibirQtdDisponiveis;
  final List<String> fotos;
  final List<ItemDTO> itens;
  final List<CategoryItemDTO> categoriaItens;
  final List<PeriodDTO> periodos;

  SuiteDTO({
    required this.nome,
    required this.qtd,
    required this.exibirQtdDisponiveis,
    required this.fotos,
    required this.itens,
    required this.categoriaItens,
    required this.periodos,
  });

  factory SuiteDTO.fromJson(Map<String, dynamic> json) => _$SuiteDTOFromJson(json);
  Map<String, dynamic> toJson() => _$SuiteDTOToJson(this);
}
