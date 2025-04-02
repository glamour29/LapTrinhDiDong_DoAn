part of '../core.dart';

class _FlashButton extends StatelessWidget {
  const _FlashButton({required this.bloc});

  final CameraBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraBloc, CameraState>(
      bloc: bloc,
      buildWhen: (previous, current) => current is FlashState,
      builder: (context, state) {
        if (state is FlashState) {
          return AnimButton(
              onTap: () => bloc.add(ToggleFlashEvent()),
              child: Icon(
                FontAwesomeIcons.lightbulb,
                color: state.enable ? Colors.amber : Colors.white,
              ));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
