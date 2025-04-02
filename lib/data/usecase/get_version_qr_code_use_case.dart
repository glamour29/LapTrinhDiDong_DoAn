import 'package:calc_pro/core/constants/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetVersionQrCodeUseCase {
  Future<int> call() async {
    final spf = await SharedPreferences.getInstance();
    return spf.getInt(Constants.versionQrCode) ?? QrVersions.auto;
  }
}
