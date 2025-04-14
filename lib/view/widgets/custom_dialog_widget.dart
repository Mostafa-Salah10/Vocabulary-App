import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_app/controller/write_data_cubit/write_data_cubit.dart';
import 'package:vocabulary_app/controller/write_data_cubit/wrtie_data_cubit_state.dart';
import 'package:vocabulary_app/core/constants/app_colors.dart';
import 'package:vocabulary_app/core/constants/app_string.dart';
import 'package:vocabulary_app/core/functions/toast_alert.dart';
import 'package:vocabulary_app/view/widgets/custom_button.dart';
import 'package:vocabulary_app/view/widgets/custom_colors_widget.dart';
import 'package:vocabulary_app/view/widgets/custom_text_field_widget.dart';
import 'package:vocabulary_app/view/widgets/language_widget.dart';

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final writeCubit = WriteDataCubit.get(context);
    return BlocConsumer<WriteDataCubit, WriteDataCubitState>(
      listener: (context, state) {
        if (state is WriteDataCubitFailureState) {
          toastAlert(color: AppColors.red, msg: state.errMsg);
        }
      },
      builder: (context, state) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          contentPadding: EdgeInsets.all(0),
          content: AnimatedContainer(
            padding: EdgeInsets.symmetric(vertical: 15),
            duration: Duration(milliseconds: 900),
            color: Color(writeCubit.colorCode),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LanguageWidget(
                    colorCode: WriteDataCubit.get(context).colorCode,
                    isSelected: writeCubit.isArabic,
                  ),
                  SizedBox(height: 15),
                  CustomColorsWidget(activeColor: writeCubit.colorCode),
                  SizedBox(height: 25),
                  CustomTextFieldWidget(
                    label: AppString.addWord,
                    formKey: writeCubit.formKey,
                    onChanged: (word) => writeCubit.word = word,
                    isArabic: writeCubit.isArabic,
                  ),
                  SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomButton(
                      colorCode: writeCubit.colorCode,
                      onPressed: () {
                        if (writeCubit.formKey.currentState!.validate()) {
                          writeCubit.addWord();
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
