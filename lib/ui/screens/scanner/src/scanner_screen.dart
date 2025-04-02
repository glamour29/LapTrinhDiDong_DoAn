part of '../core.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final _bloc = getIt<ScannerBloc>();

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
          body: GestureDetector(
            onTapDown: (details) => _bloc.add(TapEvent(details: details)),
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                _ImageScan(bloc: _bloc),
                _LoadingScan(bloc: _bloc),
                _RectPainter(bloc: _bloc),
                _RectSelectedPainter(bloc: _bloc),
                _RollBackButton(bloc: _bloc),
                Positioned(
                    bottom: 24.h, right: 12.w, child: _CalcButton(bloc: _bloc)),
                Positioned(
                    bottom: 0, left: 0, child: _MiniCalculator(bloc: _bloc)),
                Positioned(top: 44.h, left: 12.w, child: BackButton()),
              ],
            ),
          ),
        ));
  }
}
