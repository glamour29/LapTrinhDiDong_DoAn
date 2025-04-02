import 'package:barcode_widget/barcode_widget.dart';
import 'package:calc_pro/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetBarcodeTypeUseCase {
  Future<void> call({required BarcodeType type}) async {
    final spf = await SharedPreferences.getInstance();
    await spf.setInt(Constants.barcodeType, type.index);
  }
}
