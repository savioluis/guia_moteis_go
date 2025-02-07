import 'package:guia_moteis_go/core/services/dtos/motel_response_dto.dart';
import 'package:guia_moteis_go/src/features/home/widgets/motel_card/models/motel_card/category/motel_category_model.dart';
import 'package:guia_moteis_go/src/features/home/widgets/motel_card/models/motel_card/price/price_model.dart';

import 'motel_card_header_model.dart';
import 'motel_card_body_model.dart';

class MotelCardModel {
  final MotelCardHeaderModel header;
  final MotelCardBodyModel body;
  final List<MotelCategoryModel> categories;
  final List<MotelPriceModel> prices;

  MotelCardModel({
    required this.header,
    required this.body,
    required this.categories,
    required this.prices,
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
          categories: suite.categoriaItens
              .map((item) => MotelCategoryModel(image: item.icone))
              .toList(),
          prices: suite.periodos
              .map((periodo) => MotelPriceModel(
                    duration: periodo.tempoFormatado,
                    price: periodo.valor,
                    totalPrice: periodo.valorTotal,
                    hasCortesy: periodo.temCortesia,
                    discount: periodo.desconto?.desconto,
                  ))
              .toList(),
        );
      }).toList();
    }).toList();
  }
}
