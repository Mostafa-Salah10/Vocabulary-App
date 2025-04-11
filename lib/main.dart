import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vocabulary_app/app/vocabulary_app.dart';
import 'package:vocabulary_app/model/word_type_adapter.dart';

void main() async {
  WidgetsFlutterBinding();
  await Hive.initFlutter();
  Hive.registerAdapter(WordTypeAdapter());
  runApp(VocabularyApp());
}
