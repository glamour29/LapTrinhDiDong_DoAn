import 'package:calc_pro/core/constants/constants.dart';
import 'package:calc_pro/logic/cubits/language/language_cubit.dart';
import 'package:calc_pro/ui/routers/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetLanguageTranslateUseCase {
  Future<String> call() async {
    final spf = await SharedPreferences.getInstance();
    return spf.getString(Constants.languageCodeTranslate) ??
        AppRouter.context.read<LanguageCubit>().state;
  }
}
