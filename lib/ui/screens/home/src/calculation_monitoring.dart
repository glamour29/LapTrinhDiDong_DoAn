part of '../core.dart';

class _CalculationMonitoring extends StatelessWidget {
  const _CalculationMonitoring({required this.bloc});

  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.appColors.background.withValues(alpha: 0.6),
      ),
      child: Column(
        children: [
          _ShowInputBasic(bloc: bloc),
          _ShowResult(bloc: bloc),
        ],
      ),
    );
  }
}
