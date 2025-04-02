part of '../core.dart';

class BarcodeScreen extends StatefulWidget {
  const BarcodeScreen({super.key});

  @override
  State<BarcodeScreen> createState() => _BarcodeScreenState();
}

class _BarcodeScreenState extends State<BarcodeScreen> {
  final _bloc = getIt<BarcodeBloc>();
  final _controller = TextEditingController();

  @override
  void initState() {
    _bloc.add(InitialEvent());
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text(S.current.barcode),
          ),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: S.current.text,
                            style: context.textTheme.bodyMedium),
                        TextSpan(
                            text: ' *',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: Colors.red,
                            )),
                      ])),
                    ),
                    SizedBox(height: 8.h),
                    _Input(controller: _controller, bloc: _bloc),
                    Align(
                      alignment: Alignment.topLeft,
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: S.current.barcode_type,
                            style: context.textTheme.bodyMedium),
                        TextSpan(
                            text: ' *',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: Colors.red,
                            )),
                      ])),
                    ),
                    SizedBox(height: 8.h),
                    _Type(bloc: _bloc),
                    SizedBox(height: 24.h),
                    _Result(bloc: _bloc),
                  ],
                ),
              ),
              _Loading(bloc: _bloc),
            ],
          ),
        ));
  }
}
