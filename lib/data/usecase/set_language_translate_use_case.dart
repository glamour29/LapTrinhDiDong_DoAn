import 'package:calc_pro/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetLanguageTranslateUseCase {
  Future<bool> call({required String languageCodeTranslate}) async {
    final spf = await SharedPreferences.getInstance();
    return await spf.setString(
        Constants.languageCodeTranslate, languageCodeTranslate);
  }
}
