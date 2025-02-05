import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:guia_moteis_go/core/providers/http/i_http_client.dart';
import 'package:guia_moteis_go/core/theme/colors/colors_extension.dart';
import 'package:guia_moteis_go/src/features/home/widgets/carousel/carousel_item.dart';
import 'package:guia_moteis_go/src/features/home/widgets/carousel/carousel_widget.dart';
import 'package:guia_moteis_go/src/features/home/widgets/motel_card/motel_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _carouselController = PageController(viewportFraction: 1.25);

  @override
  Widget build(BuildContext context) {
    final httpClient = GetIt.instance<IHttpClient>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: () async {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselWidget(
                  items: [],
                  onItemPressed: (itemIndex) {},
                  controller: _carouselController,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final result = await httpClient.get('');
                    print(result);
                  },
                  child: Text('P R E S S'),
                ),
                const SizedBox(height: 48),
                MotelCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
