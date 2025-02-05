import 'package:flutter/material.dart';
import 'package:guia_moteis_go/core/theme/colors/colors_extension.dart';
import 'package:guia_moteis_go/src/features/home/widgets/carousel/carousel_item.dart';
import 'package:guia_moteis_go/src/features/home/widgets/carousel/model/carousel_item_model.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    required this.items,
    this.onItemPressed,
    required this.controller,
    this.height = 164,
    super.key,
  });

  final List<CarouselItemModel> items;
  final void Function(int)? onItemPressed;
  final PageController controller;
  final double height;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

    controller.addListener(() {
      final page = controller.page;
      if (page != null) {
        currentIndex.value = page.round();
      }
    });

    return Column(
      children: [
        SizedBox(
          height: height,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            controller: controller,
            itemCount: items.length,
            onPageChanged: (index) => currentIndex.value = index,
            itemBuilder: (context, index) {
              return FractionallySizedBox(
                widthFactor: 1 / controller.viewportFraction,
                child: SizedBox(
                  child: Stack(
                    children: [
                      CarouselItem(
                        item: items[index],
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => onItemPressed?.call(index),
                          borderRadius: BorderRadius.circular(10),
                          splashColor: Colors.grey.withOpacity(0.2),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        ValueListenableBuilder<int>(
          valueListenable: currentIndex,
          builder: (context, value, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < items.length; i++)
                  GestureDetector(
                    onTap: () {
                      if (i != currentIndex.value) {
                        controller.animateToPage(
                          i,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      height: i == value ? 12 : 8,
                      width: i == value ? 12 : 8,
                      decoration: BoxDecoration(
                        color: i == value
                            ? context.greyColor
                            : context.lightGreyColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
