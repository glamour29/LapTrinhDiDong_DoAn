part of '../core.dart';

class _CameraView extends StatelessWidget {
  const _CameraView({required this.bloc});

  final CameraBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraBloc, CameraState>(
      bloc: bloc,
      buildWhen: (previous, current) => current is CameraLoadedState,
      builder: (context, state) {
        if (state is CameraLoadedState) {
          return Positioned(
              top: 0, bottom: 0, child: CameraPreview(state.controller));
        }
        return Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
