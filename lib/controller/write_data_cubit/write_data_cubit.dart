import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_app/controller/write_data_cubit/wrtie_data_cubit_state.dart';

class WriteDataCubit extends Cubit<WriteDataCubitState> {
  WriteDataCubit() : super(WriteDataCubitInitiallyState());

  static get(context) => BlocProvider.of<WriteDataCubit>(context);

  String word = "";
  bool isArabic = true;
  int colorCode = 0xFF00FF00;
}
