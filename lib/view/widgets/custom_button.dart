import 'package:flutter/material.dart';
import 'package:vocabulary_app/core/constants/app_colors.dart';
import 'package:vocabulary_app/core/constants/app_string.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.colorCode, this.onPressed});
  final int colorCode;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      height: 30,
      minWidth: 80,
      color: AppColors.white,
      child: Text(
        AppString.done,
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.copyWith(color: Color(colorCode)),
      ),
    );
  }
}
