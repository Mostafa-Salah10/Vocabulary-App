import 'package:flutter/material.dart';
import 'package:vocabulary_app/controller/write_data_cubit/write_data_cubit.dart';
import 'package:vocabulary_app/core/constants/app_colors.dart';
import 'package:vocabulary_app/core/constants/app_string.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({
    super.key,
    required this.colorCode,
    required this.isSelected,
  });

  final int colorCode;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _getLangItem(AppString.ar, isSelected, context),
        SizedBox(width: 7),
        _getLangItem(AppString.en, !isSelected, context),
      ],
    );
  }

  InkWell _getLangItem(String lang, bool isSelected, context) {
    return InkWell(
      onTap: () {
        WriteDataCubit.get(context).toggleLang();
      },
      child: Container(
        alignment: Alignment.center,
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white : Color(colorCode),
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: AppColors.white),
        ),
        child: Text(
          lang,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: !isSelected ? AppColors.white : Color(colorCode),
          ),
        ),
      ),
    );
  }
}
