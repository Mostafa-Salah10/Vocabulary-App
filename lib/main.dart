import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vocabulary_app/app/vocabulary_app.dart';
import 'package:vocabulary_app/controller/read_data_cubit/read_data_cubit.dart';
import 'package:vocabulary_app/controller/write_data_cubit/write_data_cubit.dart';
import 'package:vocabulary_app/core/constants/hive_constants.dart';
import 'package:vocabulary_app/model/word_type_adapter.dart';

void main() async {
  WidgetsFlutterBinding();
  await Hive.initFlutter();
  Hive.registerAdapter(WordTypeAdapter());
  await Hive.openBox(HiveConstants.boxWords);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WriteDataCubit()),
        BlocProvider(create: (context) => ReadDataCubit()),
      ],
      child: VocabularyApp(),
    ),
  );
}
