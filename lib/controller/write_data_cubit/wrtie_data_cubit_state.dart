abstract class WriteDataCubitState {}

class WriteDataCubitInitiallyState extends WriteDataCubitState {}

class WriteDataCubitLoadingState extends WriteDataCubitState {}

class WriteDataCubitSuccessState extends WriteDataCubitState {}

class WriteDataCubitFailureState extends WriteDataCubitState {
  final String errMsg;
  WriteDataCubitFailureState({required this.errMsg});
}
