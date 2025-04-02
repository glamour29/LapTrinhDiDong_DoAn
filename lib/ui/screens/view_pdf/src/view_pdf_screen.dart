part of '../core.dart';

class ViewPdfScreen extends StatefulWidget {
  const ViewPdfScreen({super.key});

  @override
  State<ViewPdfScreen> createState() => _ViewPdfScreenState();
}

class _ViewPdfScreenState extends State<ViewPdfScreen> {
  final _bloc = getIt<ViewPdfBloc>();

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
          appBar: AppBar(
            title: Text(S.current.view_pdf),
            actions: [
              _ChooseFileButton(bloc: _bloc),
              SizedBox(width: 8.w),
            ],
          ),
          body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: _Pdf(bloc: _bloc)),
        ));
  }
}
