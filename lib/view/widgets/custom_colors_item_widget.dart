import 'package:flutter/material.dart';
import 'package:vocabulary_app/controller/write_data_cubit/write_data_cubit.dart';
import 'package:vocabulary_app/core/constants/app_colors.dart';

class CustomColorsItemWidget extends StatelessWidget {
  const CustomColorsItemWidget({
    super.key,
    required this.colorCode,
    required this.activeColor,
  });

  final int colorCode;
  final int activeColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WriteDataCubit.get(context).changeColorCode(colorCode);
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          border:
              colorCode == activeColor
                  ? Border.all(width: 2.5, color: AppColors.white)
                  : null,
          color: Color(colorCode),
          shape: BoxShape.circle,
        ),
        child:
            colorCode == activeColor
                ? const Icon(Icons.done, color: Colors.white)
                : null,
      ),
    );
  }
}
