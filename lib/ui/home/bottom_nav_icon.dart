import 'package:flutter/material.dart';

class BottomNavIcon extends StatelessWidget {
  String IconName;
  bool isSelected;
  BottomNavIcon({required this.IconName, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return isSelected?
    Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24)
      ),
      child: ImageIcon(AssetImage("assets/images/$IconName.png"),
        color: Theme.of(context).primaryColor,
      ),

    ): Container(
      padding: const EdgeInsets.all(4),
      child: ImageIcon(AssetImage("assets/images/$IconName.png"),
        color: Colors.white,
      ),
    );

  }
}
