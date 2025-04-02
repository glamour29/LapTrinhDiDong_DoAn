part of '../core.dart';

class _RectPainter extends StatelessWidget {
  const _RectPainter({required this.bloc});

  final TranslateBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslateBloc, TranslateState>(
        bloc: bloc,
        buildWhen: (previous, current) => current is ListRectState,
        builder: (context, state) {
          if (state is ListRectState &&
              state.listRect.isNotEmpty &&
              state.isShow) {
            return GestureDetector(
              onPanStart: (details) =>
                  bloc.add(OnSwipeStartEvent(details: details)),
              onPanUpdate: (details) =>
                  bloc.add(OnSwipeUpdateEvent(details: details)),
              onPanEnd: (details) => bloc.add(OnSwipeEndEvent()),
              child: CustomPaint(
                painter: _RectPain(listRect: state.listRect),
              ),
            );
          }
          return const SizedBox.shrink();
        });
  }
}

class _RectPain extends CustomPainter {
  const _RectPain({required this.listRect});

  final List<Rect> listRect;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withValues(alpha: 0.3)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;

    for (final rect in listRect) {
      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
