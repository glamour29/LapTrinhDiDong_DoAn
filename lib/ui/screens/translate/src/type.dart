part of '../core.dart';

class _Type extends StatelessWidget {
  const _Type({required this.bloc});

  final TranslateBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslateBloc, TranslateState>(
      bloc: bloc,
      buildWhen: (previous, current) => current is TypeState,
      builder: (context, state) {
        if (state is TypeState) {
          return ToggleSwitch(
            minWidth: 60.0,
            minHeight: 40.0,
            initialLabelIndex: state.type,
            cornerRadius: 20.0,
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.grey,
            inactiveFgColor: Colors.white,
            totalSwitches: 2,
            icons: [
              FontAwesomeIcons.rectangleXmark,
              FontAwesomeIcons.handMiddleFinger,
            ],
            iconSize: 24.0,
            activeBgColors: [
              [Colors.blue, Colors.indigoAccent],
              [Colors.yellow, Colors.orange]
            ],
            onToggle: (index) => bloc.add(SelectedTypeEvent(index: index!)),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
