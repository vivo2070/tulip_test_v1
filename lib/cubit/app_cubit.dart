import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_state.dart';

class AppCubit extends Cubit<AppState>
{
  AppCubit() : super(appinitialState());

  static AppCubit get(context) => BlocProvider.of(context);




  // bool theDark=true;

  // void changeTheme({bool? fromShared}) {
  //   if (fromShared != null)
  //     theDark = fromShared;
  //   else {
  //     theDark = !theDark;
  //     casheHelper().setDarkMode('isDark', theDark).then((value) {
  //       emit(AppCubitModeState());
  //     });
  //   }
  // }

}