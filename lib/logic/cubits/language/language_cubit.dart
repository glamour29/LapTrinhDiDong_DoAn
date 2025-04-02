import 'package:calc_pro/core/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LanguageCubit extends Cubit<String> {
  LanguageCubit() : super('en') {
    reload();
  }

  ///Kiểm tra và cập nhật ngôn ngữ đã lựa chọn
  Future<void> reload() async {
    final spf = await SharedPreferences.getInstance();
    final languageCode = spf.getString(Constants.languageCode) ;
    if(languageCode == null) return;
    emit(languageCode);
  }

  ///Thay đổi ngôn ngữ
  Future<void> changeLanguage({required String languageCode}) async {
    final spf = await SharedPreferences.getInstance();
    spf.setString(Constants.languageCode, languageCode);
    emit(languageCode);
  }
}
