import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:guia_moteis_go/core/theme/colors/colors_extension.dart';
import 'package:guia_moteis_go/src/features/home/widgets/motel_card/models/motel_card/category/motel_category_model.dart';
import 'package:guia_moteis_go/src/features/home/widgets/motel_card/models/motel_card/motel_card_body_model.dart';
import 'package:guia_moteis_go/src/features/home/widgets/motel_card/models/motel_card/motel_card_model.dart';
import 'package:guia_moteis_go/src/features/home/widgets/motel_card/models/motel_card/motel_card_header_model.dart';
import 'package:guia_moteis_go/src/features/home/widgets/motel_card/models/motel_card/price/price_model.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class MotelCardListView extends StatelessWidget {
  const MotelCardListView({required this.motels, super.key});

  final List<MotelCardModel> motels;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardHeader(header: motels[0].header),
        const SizedBox(height: 24),
        SizedBox(
          height: 688,
          child: InfiniteList(
            scrollDirection: Axis.horizontal,
            itemCount: motels.length,
            onFetchData: () {},
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            physics: const PageScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: index == 0
                    ? const EdgeInsets.only(left: 12)
                    : const EdgeInsets.symmetric(horizontal: 12),
                width: MediaQuery.sizeOf(context).width - 48,
                child: CardBody(
                  body: motels[index].body,
                  categories: motels[index].categories,
                  prices: motels[index].prices,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CardHeader extends StatelessWidget {
  const CardHeader({
    super.key,
    required this.header,
  });

  final MotelCardHeaderModel header;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.secondaryColor,
          ),
          padding: const EdgeInsets.all(8),
          child: CachedNetworkImage(
            imageUrl: header.logo,
            width: 32,
            height: 32,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                header.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                '${header.distance} - ${header.location}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
        ),
        GestureDetector(
          child: const Icon(
            Icons.favorite,
          ),
        ),
      ],
    );
  }
}

class CardBody extends StatelessWidget {
  const CardBody({
    super.key,
    required this.body,
    required this.categories,
    required this.prices,
  });

  final MotelCardBodyModel body;
  final List<MotelCategoryModel> categories;
  final List<MotelPriceModel> prices;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: context.secondaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: body.photoUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  body.suiteName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '🛎️ só mais ${body.remainingAmout} pelo app',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: context.primaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        CategoryContent(categories: categories),
        const SizedBox(height: 8),
        PriceContent(prices: prices),
      ],
    );
  }
}

class CategoryContent extends StatelessWidget {
  const CategoryContent({
    super.key,
    required this.categories,
  });

  final List<MotelCategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            categories.length > 3 ? 3 : categories.length,
            (index) => index,
          ).map(
            (index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: context.lightGreyColor.withOpacity(0.1),
                ),
                margin: const EdgeInsets.only(right: 18),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: categories[index].image,
                    width: 56,
                    height: 56,
                  ),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'ver \ntodos',
                textAlign: TextAlign.end,
                style: TextStyle(color: context.greyColor),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: context.greyColor,
                size: 18,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class PriceContent extends StatelessWidget {
  const PriceContent({
    super.key,
    required this.prices,
  });

  final List<MotelPriceModel> prices;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: prices
          .map(
            (priceModel) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: context.secondaryColor,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              margin: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  priceModel.discount != null
                      ? ContentWithDiscount(
                          duration: priceModel.duration,
                          price: priceModel.price,
                          totalPrice: priceModel.totalPrice,
                          discount: priceModel.discount!,
                        )
                      : ContentWithNoDiscount(
                          duration: priceModel.duration,
                          price: priceModel.price,
                        ),
                  const Icon(Icons.keyboard_arrow_right_rounded),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class ContentWithNoDiscount extends StatelessWidget {
  const ContentWithNoDiscount({
    super.key,
    required this.duration,
    required this.price,
  });

  final String duration;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$duration horas',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          'R\$ ${price.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}

class ContentWithDiscount extends StatelessWidget {
  const ContentWithDiscount({
    super.key,
    required this.duration,
    required this.price,
    required this.totalPrice,
    required this.discount,
  });

  final String duration;
  final double price;
  final double totalPrice;
  final double discount;

  @override
  Widget build(BuildContext context) {
    final discountPercentage = ((price - totalPrice) / price) * 100;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              duration,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: context.greenColor, width: 0.5),
              ),
              child: Text(
                '${discountPercentage.toStringAsFixed(0)}%',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: context.greenColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'R\$ ${price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: context.lightGreyColor,
                decoration: TextDecoration.lineThrough,
                decorationColor: context.lightGreyColor,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'R\$ ${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
