import 'package:calc_pro/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetVersionQrCodeUseCase {
  Future<void> call({required int version}) async {
    final spf = await SharedPreferences.getInstance();
    await spf.setInt(Constants.versionQrCode, version);
  }
}
