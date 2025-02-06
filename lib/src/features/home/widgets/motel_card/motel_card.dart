import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:guia_moteis_go/core/theme/colors/colors_extension.dart';
import 'package:guia_moteis_go/src/features/home/widgets/motel_card/models/motel_card_body_model.dart';
import 'package:guia_moteis_go/src/features/home/widgets/motel_card/models/motel_card_model.dart';
import 'package:guia_moteis_go/src/features/home/widgets/motel_card/models/motel_card_header_model.dart';
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
          height: 496,
          child: InfiniteList(
            scrollDirection: Axis.horizontal,
            itemCount: motels.length,
            onFetchData: () {},
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return SizedBox(
                width: MediaQuery.sizeOf(context).width - 48,
                child: CardBody(body: motels[index].body),
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
  });

  final MotelCardBodyModel body;

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
        Container(
          decoration: BoxDecoration(
            color: context.secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Row(
            children: [
              ...List.generate(
                body.categoriesImagesUrls.length > 3
                    ? 3
                    : body.categoriesImagesUrls.length,
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
                        imageUrl: body.categoriesImagesUrls[index],
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
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: context.secondaryColor,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2 horas',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    'R\$ 190,00',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.keyboard_arrow_right_rounded,
              )
            ],
          ),
        ),
      ],
    );
  }
}
