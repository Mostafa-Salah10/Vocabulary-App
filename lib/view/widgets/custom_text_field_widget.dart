import 'package:flutter/material.dart';
import 'package:vocabulary_app/core/constants/app_colors.dart';
import 'package:vocabulary_app/core/constants/app_string.dart';
import 'package:vocabulary_app/core/enums/char_enum.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.label,
    required this.formKey,
    this.onChanged,
    required this.isArabic,
  });
  final GlobalKey<FormState> formKey;
  final String label;
  final void Function(String)? onChanged;
  final bool isArabic;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        autofocus: true,
        maxLines: 3,
        minLines: 1,
        cursorColor: AppColors.white,
        style: TextStyle(color: AppColors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: Theme.of(context).textTheme.headlineSmall,
          errorBorder: _outlineBorder(AppColors.red),
          focusedErrorBorder: _outlineBorder(AppColors.red),
          focusedBorder: _outlineBorder(AppColors.white),
          enabledBorder: _outlineBorder(AppColors.white),
        ),
        onChanged: onChanged,
        validator: _validatTextField,
      ),
    );
  }

  String? _validatTextField(word) {
    if (word!.trim().isEmpty) {
      return AppString.validatorAddWord;
    }

    for (int i = 0; i < word.length; i++) {
      if (_checkCurrentLetter(word.codeUnits[i]) == CharEnum.notValidLetter) {
        return "${AppString.validatorAddWordErr}${i + 1}";
      } else if (_checkCurrentLetter(word.codeUnits[i]) ==
              CharEnum.arabicLetter &&
          isArabic == false) {
        return AppString.validatorAddWordErrEnglish;
      } else if (_checkCurrentLetter(word.codeUnits[i]) ==
              CharEnum.englishLetter &&
          isArabic == true) {
        return AppString.validatorAddWordErrArabic;
      }
    }

    return null;
  }

  OutlineInputBorder _outlineBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: color),
      borderRadius: BorderRadius.circular(10),
    );
  }

  CharEnum _checkCurrentLetter(int asciiCode) {
    if (asciiCode >= 65 && asciiCode <= 90 ||
        asciiCode >= 97 && asciiCode <= 122) {
      return CharEnum.englishLetter;
    } else if (asciiCode >= 1569 && asciiCode <= 1610) {
      return CharEnum.arabicLetter;
    } else {
      return CharEnum.notValidLetter;
    }
  }
}
