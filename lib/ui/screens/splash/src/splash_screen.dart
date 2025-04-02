part of '../core.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _bloc = getIt<SplashBloc>();

  @override
  void initState() {
    _bloc.add(const InitialEvent());
    super.initState();
  }
  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          body: Center(
            child: Image.asset('assets/images/logo.png', width: 200.w),
          ),
        ));
  }
}
