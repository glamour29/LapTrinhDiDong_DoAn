import 'package:flutter/cupertino.dart';
import 'package:in_app_update/in_app_update.dart';

class CheckAppUpdateUseCase {
  Future<void> call() async {
    try {
      final appUpdateInfo = await InAppUpdate.checkForUpdate();
      if (appUpdateInfo.flexibleUpdateAllowed) {
        await InAppUpdate.startFlexibleUpdate();
      } else if (appUpdateInfo.immediateUpdateAllowed) {
        await InAppUpdate.performImmediateUpdate();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
