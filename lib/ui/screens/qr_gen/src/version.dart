part of '../core.dart';

class _Version extends StatelessWidget {
  const _Version({required this.bloc});

  final QrGenBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrGenBloc, QrGenState>(
        bloc: bloc,
        buildWhen: (previous, current) => current is ResultState,
        builder: (context, state) {
          if (state is ResultState) {
            return Slider(
                value: state.version.toDouble(),
                min: QrVersions.auto.toDouble(),
                max: QrVersions.max.toDouble(),
                inactiveColor: Colors.white54,
                label: state.version.toString(),
                activeColor: Colors.green.shade600,
                onChanged: (value) =>
                    bloc.add(ChangeVersionEvent(version: value)));
          }
          return const SizedBox.shrink();
        });
  }
}
