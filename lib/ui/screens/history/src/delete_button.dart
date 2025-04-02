part of '../core.dart';

class _DeleteButton extends StatelessWidget {
  const _DeleteButton({required this.bloc});

  final HistoryBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      bloc: bloc,
      buildWhen: (previous, current) => current is LoadedState,
      builder: (context, state) {
        if (state is LoadedState && state.data.isNotEmpty) {
          return IconButton(
              onPressed: () => bloc.add(DeleteAllEvent()),
              icon: Icon(
                Icons.delete_sweep_outlined,
                color: Colors.red,
              ));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
