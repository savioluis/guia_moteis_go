import 'package:flutter/material.dart';
import 'package:guia_moteis_go/core/theme/colors/colors_extension.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({required this.text, required this.icon, super.key});

  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      trailing: const Icon(Icons.keyboard_arrow_right_outlined),
      tileColor: context.secondaryColor,
      title: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w300),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
