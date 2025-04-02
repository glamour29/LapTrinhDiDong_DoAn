import 'package:calc_pro/ui/routers/app_router.dart';
import 'package:fire_auth_quick/fire_auth_quick.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<InitialEvent>(_initEvent);
  }

  void _initEvent(InitialEvent event, Emitter<SplashState> emit) async {
    await Future.delayed(const Duration(seconds: 1));
    final route = FireAuthQuick.currentUser == null
        ? AppRouter.authScreen
        : AppRouter.homeScreen;
    AppRouter.pushReplacementNamed(route);
  }
}
