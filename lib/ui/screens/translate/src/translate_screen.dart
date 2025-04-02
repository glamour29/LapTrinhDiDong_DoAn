part of '../core.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  final _bloc = getIt<TranslateBloc>();

  @override
  void initState() {
    _bloc.add(InitialEvent(context: context));
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
          body: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                _Image(bloc: _bloc),
                _RectSelectedPainter(bloc: _bloc),
                _RectPainter(bloc: _bloc),
                _RectArea(bloc: _bloc),
                Positioned(top: 44.h, right: 12.w, child: _Type(bloc: _bloc)),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: _Language(bloc: _bloc)),
                Positioned(top: 100.h, left: 0, child: _Result(bloc: _bloc)),
                _Loading(bloc: _bloc),
                Positioned(top: 44.h, left: 12.w, child: BackButton()),
              ]),
        ));
  }
}
