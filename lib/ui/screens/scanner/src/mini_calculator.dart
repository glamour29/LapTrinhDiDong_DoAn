part of '../core.dart';

class _MiniCalculator extends StatelessWidget {
  const _MiniCalculator({required this.bloc});

  final ScannerBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScannerBloc, ScannerState>(
      bloc: bloc,
      buildWhen: (previous, current) => current is ShowCalculatorState,
      builder: (context, state) {
        if (state is ShowCalculatorState && state.input.isNotEmpty) {
          return Container(
            width: context.width,
            height: context.height,
            color: Colors.black87,
            child: Stack(
              children: [
                Transform.scale(
                    scale: 0.7, child: HomeScreen(input: state.input)),
                Positioned(
                  top: 44.h,
                  right: 12.w,
                  child: IconButton(
                      onPressed: () => bloc.add(DismissCalculatorEvent()),
                      icon: Icon(FontAwesomeIcons.xmark)),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
