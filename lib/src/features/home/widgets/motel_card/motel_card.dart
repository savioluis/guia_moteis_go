import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:guia_moteis_go/core/theme/colors/colors_extension.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class MotelCard extends StatelessWidget {
  const MotelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.secondaryColor,
              ),
              padding: const EdgeInsets.all(8),
              child: CachedNetworkImage(
                imageUrl:
                    'https://www.publicdomainpictures.net/pictures/560000/nahled/banaan-grappige-cartoon-png-1703496319hhg.png',
                width: 32,
                height: 32,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'lux resort motel',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  '1, 1km - parque manibura - fortaleza',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                )
              ],
            ),
            GestureDetector(
              child: Icon(
                Icons.favorite,
              ),
            )
          ],
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 496,
          child: InfiniteList(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            onFetchData: () {},
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return IntrinsicWidth(
                child: CardBody(),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CardBody extends StatelessWidget {
  const CardBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
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
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 256,
                        maxWidth: 320,
                      ),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'suíte quintas',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '🛎️ só mais 1 pelo app',
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
                  3,
                  (index) => index,
                ).map(
                  (e) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: context.lightGreyColor.withOpacity(0.1),
                      ),
                      margin: const EdgeInsets.only(right: 18),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://cdn.guiademoteis.com.br/Images/itens-suites/arcondicionado-04-09-2018-12-13.png',
                          width: 64,
                          height: 64,
                        ),
                      ),
                    );
                  },
                ),
                Row(
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
      ),
    );
  }
}
