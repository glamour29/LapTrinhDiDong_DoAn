part of '../core.dart';

class _HistoryButton extends StatelessWidget {
  const _HistoryButton({required this.bloc});

  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AnimButton(
          onTap: () =>
              bloc.add(NavigateEvent(routeName: AppRouter.historyScreen)),
          child: Image.asset('assets/images/clock.png')),
    );
  }
}
