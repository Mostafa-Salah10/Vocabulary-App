import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
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
}
