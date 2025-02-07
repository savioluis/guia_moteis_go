import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:guia_moteis_go/core/providers/http/i_http_client.dart';
import 'package:guia_moteis_go/core/services/motel_service.dart';
import 'package:guia_moteis_go/core/theme/colors/colors_extension.dart';
import 'package:guia_moteis_go/src/features/home/presentation/home_controller.dart';
import 'package:guia_moteis_go/src/features/home/presentation/home_state.dart';
import 'package:guia_moteis_go/src/features/home/widgets/carousel/carousel_item.dart';
import 'package:guia_moteis_go/src/features/home/widgets/carousel/carousel_widget.dart';
import 'package:guia_moteis_go/src/features/home/widgets/carousel/model/carousel_item_model.dart';
import 'package:guia_moteis_go/src/features/home/widgets/motel_card/models/motel_card/motel_card_model.dart';
import 'package:guia_moteis_go/src/features/home/widgets/motel_card/motel_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeController(
        motelService: GetIt.instance<MotelService>(),
      )..fetchInitialData(),
      child: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final controller = context.read<HomeController>();
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeSuccessState) {
            final motelsCarouselData =
                CarouselItemModel.exampleCarousel(amount: 5);
            final motelsCardListData =
                MotelCardModel.fromMotelsResponseDTO(state.motelsResponse);

            return Scaffold(
              appBar: AppBar(
                title: const Text('Home Page'),
              ),
              drawer: const Drawer(),
              body: RefreshIndicator(
                onRefresh: () async {},
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselWidget(
                          items: motelsCarouselData,
                          onItemPressed: (itemIndex) {},
                          controller: controller.carouselController,
                        ),
                        const SizedBox(height: 24),
                        MotelCardListView(motels: motelsCardListData),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
