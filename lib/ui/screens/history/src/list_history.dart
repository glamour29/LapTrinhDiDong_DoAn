part of '../core.dart';

class _ListHistory extends StatelessWidget {
  const _ListHistory({required this.bloc});

  final HistoryBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      bloc: bloc,
      buildWhen: (previous, current) => current is LoadedState,
      builder: (context, state) {
        if (state is LoadedState) {
          if (state.data.isEmpty) {
            return Column(
              children: [
                NotificationCustom(
                  asset: 'history',
                  title: S.current.history_empty_title,
                  message: S.current.history_empty_message,
                ),
              ],
            );
          }
          return ListView.separated(
              separatorBuilder: (_, __) => Divider(),
              itemCount: state.data.length,
              itemBuilder: (context, index) => _HistoryItem(
                    onDelete: (_) =>
                        bloc.add(DeleteEvent(id: state.data[index].id)),
                    onSelect: () =>
                        bloc.add(BackEvent(argument: state.data[index])),
                    history: state.data[index],
                  ));
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _HistoryItem extends StatelessWidget {
  const _HistoryItem(
      {required this.onDelete, required this.onSelect, required this.history});

  final History history;
  final void Function(DismissDirection) onDelete;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Dismissible(
        key: Key('${history.id}'),
        direction: DismissDirection.endToStart,
        onDismissed: onDelete,
        background: Container(
          color: Colors.red.withValues(alpha: 0.4),
          padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 24.w),
          alignment: AlignmentDirectional.centerEnd,
          child: Icon(Icons.delete_sweep_outlined),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 24.w),
          child: Text(
            history.value,
            maxLines: 1,
            style: context.textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
