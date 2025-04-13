import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_app/controller/write_data_cubit/write_data_cubit.dart';
import 'package:vocabulary_app/controller/write_data_cubit/wrtie_data_cubit_state.dart';
import 'package:vocabulary_app/view/widgets/custom_colors_widget.dart';

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final writeCubit = WriteDataCubit.get(context);
    return BlocBuilder<WriteDataCubit, WriteDataCubitState>(
      builder: (context, state) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          contentPadding: EdgeInsets.all(0),
          content: AnimatedContainer(
            padding: EdgeInsets.symmetric(vertical: 15),
            duration: Duration(milliseconds: 900),
            color: Color(writeCubit.colorCode),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [CustomColorsWidget(activeColor: writeCubit.colorCode)],
            ),
          ),
        );
      },
    );
  }
}
