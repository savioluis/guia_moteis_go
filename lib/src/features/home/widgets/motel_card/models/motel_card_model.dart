import 'package:guia_moteis_go/core/services/dtos/motel_response_dto.dart';

import 'motel_card_header_model.dart';
import 'motel_card_body_model.dart';

class MotelCardModel {
  final MotelCardHeaderModel header;
  final MotelCardBodyModel body;

  MotelCardModel({
    required this.header,
    required this.body,
  });

  static List<MotelCardModel> fromMotelsResponseDTO(MotelResponseDTO dto) {
    return dto.data.moteis.expand((motel) {
      return motel.suites.map((suite) {
        return MotelCardModel(
          header: MotelCardHeaderModel(
            name: motel.fantasia,
            distance: "${motel.distancia.toStringAsFixed(1)} km",
            location: motel.bairro,
            logo: motel.logo,
          ),
          body: MotelCardBodyModel(
            photoUrl: suite.fotos.isNotEmpty ? suite.fotos.first : "",
            suiteName: suite.nome,
            remainingAmout: suite.qtd,
            categoriesImagesUrls:
                suite.categoriaItens.map((item) => item.icone).toList(),
          ),
        );
      }).toList();
    }).toList();
  }
}
