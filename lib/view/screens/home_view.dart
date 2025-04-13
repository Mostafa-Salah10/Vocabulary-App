import 'package:flutter/material.dart';
import 'package:vocabulary_app/core/constants/app_colors.dart';
import 'package:vocabulary_app/core/constants/app_string.dart';
import 'package:vocabulary_app/view/widgets/custom_dialog_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _getFloatingButton(context),
      appBar: AppBar(
        title: Text(
          AppString.home,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Container(),
    );
  }

  FloatingActionButton _getFloatingButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.white,
      shape: CircleBorder(),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => CustomDialogWidget(),
        );
      },
      child: Icon(Icons.add, color: AppColors.black),
    );
  }
}
