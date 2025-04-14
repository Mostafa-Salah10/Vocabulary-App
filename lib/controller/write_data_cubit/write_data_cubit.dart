import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:vocabulary_app/controller/write_data_cubit/wrtie_data_cubit_state.dart';
import 'package:vocabulary_app/core/constants/app_colors.dart';
import 'package:vocabulary_app/core/constants/app_string.dart';
import 'package:vocabulary_app/core/constants/hive_constants.dart';
import 'package:vocabulary_app/model/word_model.dart';

class WriteDataCubit extends Cubit<WriteDataCubitState> {
  WriteDataCubit() : super(WriteDataCubitInitiallyState());

  static WriteDataCubit get(context) =>
      BlocProvider.of<WriteDataCubit>(context);
  final Box _box = Hive.box(HiveConstants.boxWords);
  final GlobalKey<FormState> formKey = GlobalKey();

  String word = "";
  bool isArabic = true;
  int colorCode = AppColors.color1.toARGB32();

  void changeColorCode(int colorCode) {
    this.colorCode = colorCode;
    emit(WriteDataCubitInitiallyState());
  }

  void toggleLang() {
    isArabic = !isArabic;
    emit(WriteDataCubitInitiallyState());
  }

  void addWord() {
    emit(WriteDataCubitLoadingState());
    try {
      List<WordModel> words = [];
      words = _getWordsFromDB();
      WordModel newWord = WordModel(
        indexAtDatabase: words.length,
        word: word,
        isArabic: isArabic,
        colorCode: colorCode,
      );
      words.add(newWord);
      _addListToDB(words);
      emit(WriteDataCubitSuccessState());
    } catch (e) {
      emit(WriteDataCubitFailureState(errMsg: AppString.errorMsgAdd));
    }
  }

  void deleteWord({required int index}) {
    emit(WriteDataCubitLoadingState());
    try {
      List<WordModel> words = [];
      words = _getWordsFromDB();
      words.removeAt(index);
      _changeIndexWordInDB(index: index, words: words);
      _addListToDB(words);
      emit(WriteDataCubitSuccessState());
    } catch (e) {
      emit(WriteDataCubitFailureState(errMsg: AppString.errorMsgDelete));
    }
  }

  void addSimilarWord({required int wordIndex}) {
    emit(WriteDataCubitLoadingState());

    try {
      List<WordModel> words = _getWordsFromDB();
      words[wordIndex] = words[wordIndex].addSimilarWord(
        similarWord: word,
        isArabicSimilarWord: isArabic,
      );

      _addListToDB(words);
      emit(WriteDataCubitSuccessState());
    } catch (e) {
      emit(WriteDataCubitFailureState(errMsg: AppString.errorMsgAdd));
    }
  }

  void addExample({required int wordIndex}) {
    emit(WriteDataCubitLoadingState());

    try {
      List<WordModel> words = _getWordsFromDB();
      words[wordIndex] = words[wordIndex].addExample(
        example: word,
        isArabicExample: isArabic,
      );

      _addListToDB(words);
      emit(WriteDataCubitSuccessState());
    } catch (e) {
      emit(WriteDataCubitFailureState(errMsg: AppString.errorMsgAdd));
    }
  }

  void deleteExample({
    required int wordIndex,
    required int exampleIndex,
    required bool isArabic,
  }) {
    emit(WriteDataCubitLoadingState());

    try {
      List<WordModel> words = _getWordsFromDB();
      words[wordIndex] = words[wordIndex].deleteExample(
        exampleIndex: exampleIndex,
        isArabicExample: isArabic,
      );

      _addListToDB(words);
      emit(WriteDataCubitSuccessState());
    } catch (e) {
      emit(WriteDataCubitFailureState(errMsg: AppString.errorMsgDelete));
    }
  }

  void deleteSimilarWord({
    required int wordIndex,
    required int similarWordIndex,
    required bool isArabic,
  }) {
    emit(WriteDataCubitLoadingState());

    try {
      List<WordModel> words = _getWordsFromDB();
      words[wordIndex] = words[wordIndex].deleteExample(
        exampleIndex: similarWordIndex,
        isArabicExample: isArabic,
      );

      _addListToDB(words);
      emit(WriteDataCubitSuccessState());
    } catch (e) {
      emit(WriteDataCubitFailureState(errMsg: AppString.errorMsgDelete));
    }
  }

  List<WordModel> _getWordsFromDB() {
    return List.from(
      _box.get(HiveConstants.wordsList, defaultValue: []),
    ).cast<WordModel>();
  }

  void _changeIndexWordInDB({
    required int index,
    required List<WordModel> words,
  }) {
    for (int i = index; i < words.length; i++) {
      words[i] = words[i].decrementtIndexWhenDeleteWordModel();
    }
  }

  void _addListToDB(List<WordModel> words) {
    _box.put(HiveConstants.wordsList, words);
  }
}
