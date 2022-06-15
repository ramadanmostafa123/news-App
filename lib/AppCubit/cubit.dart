import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/AppCubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode() {
    isDark = !isDark;
    emit(ChangeAppModeState());
  }
}
