import 'package:calc_pro/core/extensions/context_extension.dart';
import 'package:calc_pro/core/strings/generated/l10n.dart';
import 'package:calc_pro/ui/routers/app_router.dart';
import 'package:fire_auth_quick/fire_auth_quick.dart';
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(_login);
  }

  void _login(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      AppRouter.context.showLoading;
      await FireAuthQuick.loginWithProvider(oAuth: event.oAuth);
      AppRouter.pushNamedAndRemoveUntil(AppRouter.homeScreen);
    } catch (e) {
      debugPrint(e.toString());
      AppRouter.pop();
      AppRouter.showMessageError(S.current.error);
    }
  }
}
