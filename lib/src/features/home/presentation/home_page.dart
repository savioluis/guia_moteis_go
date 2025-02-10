import 'dart:math';

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
import 'package:guia_moteis_go/src/features/home/widgets/drawer/custom_drawer.dart';
import 'package:guia_moteis_go/src/features/home/widgets/drawer/drawer_item.dart';
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
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: context.primaryColor,
            toolbarHeight: 80,
            titleSpacing: 0,
            centerTitle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            leading: Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: context.secondaryColor,
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: context.secondaryColor,
                ),
              )
            ],
            title: Padding(
              padding: const EdgeInsets.only(top: 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'minha localização',
                    style: TextStyle(color: context.secondaryColor),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: context.secondaryColor,
                  )
                ],
              ),
            )),
        drawer: const CustomDrawer(
          title: 'go fidelidade',
          subtitle:
              'acumule selinhos e troque por reservas grátis. vale em todos os motéis e horários!',
          items: [
            DrawerItem(
              text: 'login',
              icon: Icon(Icons.account_circle),
            ),
            DrawerItem(
              text: 'ajuda',
              icon: Icon(Icons.help),
            ),
            DrawerItem(
              text: 'configurações',
              icon: Icon(Icons.settings),
            ),
            DrawerItem(
              text: 'comunicar um problema',
              icon: Icon(Icons.bug_report),
            ),
            DrawerItem(
              text: 'tem um motel? faça parte',
              icon: Icon(Icons.campaign),
            ),
          ],
        ),
        body: BlocConsumer<HomeController, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            final controller = context.read<HomeController>();
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeFailureState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.message,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async => controller.fetchInitialData(),
                      child: const Text('Tentar Novamente'),
                    )
                  ],
                ),
              );
            } else if (state is HomeSuccessState) {
              final motelsCarouselData =
                  CarouselItemModel.exampleCarousel(amount: 4);
              final motelsCardListData =
                  MotelCardModel.fromMotelsResponseDTO(state.motelsResponse);

              return RefreshIndicator(
                onRefresh: () async => controller.fetchInitialData(),
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: CarouselWidget(
                                items: motelsCarouselData,
                                onItemPressed: (itemIndex) {},
                                controller: controller.carouselController,
                              ),
                            ),
                            const SizedBox(height: 24),
                            MotelCardListView(
                              motels: motelsCardListData,
                              headerPadding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              bodyPadding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
