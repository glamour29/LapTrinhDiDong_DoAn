import 'package:calc_pro/core/constants/constants.dart';
import 'package:calc_pro/core/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<AppColors> {
  ThemeCubit() : super(AppColors.darkColors);

  Future<void> changeTheme({required int id}) async {
    final appColors = AppColors.list.firstWhere((e) => e.id == id);
    emit(appColors);
    final spf = await SharedPreferences.getInstance();
    spf.setInt(Constants.theme, appColors.id);
  }

  Future<void> getTheme() async {
    final spf = await SharedPreferences.getInstance();
    final id = spf.getInt(Constants.theme);
    if (id == null) return;
    final appColors = AppColors.list.firstWhere((e) => e.id == id);
    emit(appColors);
  }
}
