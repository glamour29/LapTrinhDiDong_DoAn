part of '../core.dart';

class _ImageScan extends StatelessWidget {
  const _ImageScan({required this.bloc});

  final ScannerBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScannerBloc, ScannerState>(
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
