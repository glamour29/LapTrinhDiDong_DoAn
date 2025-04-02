part of '../core.dart';


class _ChooseFileButton extends StatelessWidget {
  const _ChooseFileButton({required this.bloc});

  final ViewDocxBloc bloc;

  @override
  Widget build(BuildContext context) {
    return AnimButton(
        child: Icon(FontAwesomeIcons.fileWord),
        onTap: () => bloc.add(ChoosePdfFileEvent()));
  }
}
