import 'package:flutter/material.dart';
import 'package:guia_moteis_go/core/theme/colors/colors_extension.dart';
import 'package:guia_moteis_go/src/features/home/widgets/drawer/drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    required this.title,
    required this.subtitle,
    required this.items,
    super.key,
  });

  final String title;
  final String subtitle;
  final List<DrawerItem> items;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[100],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.primaryColor,
              gradient: const LinearGradient(
                colors: [
                  Color(0xffFF4B38),
                  Color(0xffFF004A),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.check_box_rounded,
                          color: context.secondaryColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          title,
                          style: TextStyle(
                            color: context.secondaryColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_circle_right,
                      color: context.secondaryColor,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: context.secondaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: item,
            ),
          ),
        ],
      ),
    );
  }
}
