part of '../core.dart';

class _Loading extends StatelessWidget {
  const _Loading({required this.bloc});

  final BarcodeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BarcodeBloc, BarcodeState>(
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
      },
    );
  }
}
