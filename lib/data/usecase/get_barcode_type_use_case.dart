import 'package:barcode_widget/barcode_widget.dart';
import 'package:calc_pro/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetBarcodeTypeUseCase {
  Future<BarcodeType> call() async {
    final spf = await SharedPreferences.getInstance();
    final index = spf.getInt(Constants.barcodeType);
    if (index == null) return BarcodeType.Code128;
    return BarcodeType.values[index];
  }
}
