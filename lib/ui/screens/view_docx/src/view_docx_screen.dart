part of '../core.dart';

class ViewDocxScreen extends StatefulWidget {
  const ViewDocxScreen({super.key});

  @override
  State<ViewDocxScreen> createState() => _ViewDocxScreenState();
}

class _ViewDocxScreenState extends State<ViewDocxScreen> {
  final _bloc = getIt<ViewDocxBloc>();

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
            title: Text(S.current.view_docx),
            actions: [
              _ChooseFileButton(bloc: _bloc),
              SizedBox(width: 8.w),
            ],
          ),
          body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: _Docx(bloc: _bloc)),
        ));
  }
}
