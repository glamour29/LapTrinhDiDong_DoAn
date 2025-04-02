part of '../core.dart';

class _LoadingScan extends StatelessWidget {
  const _LoadingScan({required this.bloc});

  final ScannerBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScannerBloc, ScannerState>(
        bloc: bloc,
        buildWhen: (previous, current) => current is LoadingState,
        builder: (context, state) {
          if (state is LoadingState && state.isLoading) {
            return Container(
                color: Colors.black38,
                alignment: Alignment.center,
                child: CircularProgressIndicator.adaptive());
          }
          return const SizedBox.shrink();
        });
  }
}
