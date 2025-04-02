part of '../core.dart';

class _RollBackButton extends StatelessWidget {
  const _RollBackButton({required this.bloc});

  final ScannerBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScannerBloc, ScannerState>(
        bloc: bloc,
        buildWhen: (previous, current) => current is ListRectSelectedState,
        builder: (context, state) {
          if (state is ListRectSelectedState && state.listRect.isNotEmpty) {
            return Positioned(
                top: 44.h,
                right: 12.w,
                child: IconButton(
                    onPressed: () => bloc.add(RollBackEvent()),
                    icon: Icon(FontAwesomeIcons.clockRotateLeft)));
          }
          return const SizedBox.shrink();
        });
  }
}
