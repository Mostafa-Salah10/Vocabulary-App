import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:vocabulary_app/core/constants/app_string.dart';
import 'package:vocabulary_app/core/constants/hive_constants.dart';
import 'package:vocabulary_app/core/enums/read_data_enums.dart';
import 'package:vocabulary_app/model/word_model.dart';
part 'read_data_cubit_states.dart';

class ReadDataCubit extends Cubit<ReadDataCubitStates> {
  ReadDataCubit() : super(ReadDataCubitStatesInitially());

  //to access this class from any place
  static get(context) => BlocProvider.of<ReadDataCubit>(context);

  final Box _box = Hive.box(HiveConstants.boxWords);
  LanguageType languageType = LanguageType.allWords;
  SortedType sortedType = SortedType.descending;
  SortedBy sortedBy = SortedBy.time;
  void getWords() {
    emit(ReadDataCubitStatesLoading());
    try {
      List<WordModel> wordsList = [];
      wordsList =
          List.from(
            _box.get(HiveConstants.wordsList, defaultValue: []),
          ).cast<WordModel>();

      _filterWordsAccordingToLaguage(wordsList);
      _filterWordsAccordingToSort(wordsList);
      emit(ReadDataCubitStatesSuccess(words: wordsList));
    } catch (e) {
      emit(ReadDataCubitStatesFailure(errMsg: AppString.errorMsg));
    }
  }

  void _filterWordsAccordingToLaguage(List<WordModel> words) {
    if (languageType == LanguageType.allWords) {
      return;
    } else if (languageType == LanguageType.arabicOnly) {
      words.removeWhere((word) => word.isArabic == false);
    } else {
      words.removeWhere((word) => word.isArabic == true);
    }
  }

  void _filterWordsAccordingToSort(List<WordModel> words) {
    if (sortedBy == SortedBy.time) {
      if (sortedType == SortedType.ascending) {
        return;
      } else {
        _reverseListInPlace(words);
      }
    } else {
      if (sortedType == SortedType.ascending) {
        words.sort((a, b) => a.word.length.compareTo(b.word.length));
      } else {
        words.sort((a, b) => b.word.length.compareTo(a.word.length));
      }
    }
  }

  void _reverseListInPlace(List<WordModel> words) {
    int i = 0;
    int j = words.length - 1;
    while (i < j) {
      WordModel temp = words[i];
      words[i] = words[j];
      words[j] = temp;
      i++;
      j--;
    }
  }
}
