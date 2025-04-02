part of '../core.dart';

class _ChooseFileButton extends StatelessWidget {
  const _ChooseFileButton({required this.bloc});

  final ViewPdfBloc bloc;

  @override
  Widget build(BuildContext context) {
    return AnimButton(
        child: Icon(FontAwesomeIcons.filePdf),
        onTap: () => bloc.add(ChoosePdfFileEvent()));
  }
}
