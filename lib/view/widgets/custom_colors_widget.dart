import 'package:flutter/material.dart';
import 'package:vocabulary_app/core/constants/app_colors.dart';
import 'package:vocabulary_app/view/widgets/custom_colors_item_widget.dart';

class CustomColorsWidget extends StatelessWidget {
  CustomColorsWidget({super.key, required this.activeColor});

  final int activeColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: _colorCodes.length,
        separatorBuilder: (context, index) => const SizedBox(width: 7),
        itemBuilder:
            (context, index) => CustomColorsItemWidget(
              colorCode: _colorCodes[index],
              activeColor: activeColor,
            ),
      ),
    );
  }

  final List<int> _colorCodes = [
    AppColors.color1.toARGB32(),
    AppColors.color2.toARGB32(),
    AppColors.color3.toARGB32(),
    AppColors.color4.toARGB32(),
    AppColors.color5.toARGB32(),
    AppColors.color6.toARGB32(),
    AppColors.color7.toARGB32(),
    AppColors.color8.toARGB32(),
    AppColors.color9.toARGB32(),
  ];
}
