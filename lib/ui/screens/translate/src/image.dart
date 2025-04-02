part of '../core.dart';

class _Image extends StatelessWidget {
  const _Image({required this.bloc});

  final TranslateBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslateBloc, TranslateState>(
        bloc: bloc,
        buildWhen: (previous, current) => current is ImageState,
        builder: (context, state) {
          if (state is ImageState) {
            return Positioned(
                top: 0,
                bottom: 0,
                child: Image.file(
                  File(state.path),
                  fit: BoxFit.cover,
                ));
          }
          return const SizedBox.shrink();
        });
  }
}
