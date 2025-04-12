part of 'read_data_cubit.dart';

abstract class ReadDataCubitStates {}

class ReadDataCubitStatesInitially extends ReadDataCubitStates {}

///to get Data from local database
class ReadDataCubitStatesSuccess extends ReadDataCubitStates {
  final List<WordModel> words;

  ReadDataCubitStatesSuccess({required this.words});
}

class ReadDataCubitStatesLoading extends ReadDataCubitStates {}

class ReadDataCubitStatesFailure extends ReadDataCubitStates {
  final String errMsg;
  ReadDataCubitStatesFailure({required this.errMsg});
}
