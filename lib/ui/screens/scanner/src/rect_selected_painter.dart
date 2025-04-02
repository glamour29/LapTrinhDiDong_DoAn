part of '../core.dart';

class _RectSelectedPainter extends StatelessWidget {
  const _RectSelectedPainter({required this.bloc});

  final ScannerBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScannerBloc, ScannerState>(
        bloc: bloc,
        buildWhen: (previous, current) => current is ListRectSelectedState,
        builder: (context, state) {
          if (state is ListRectSelectedState && state.listRect.isNotEmpty) {
            return CustomPaint(
              painter: _RectSelectedPain(listRect: state.listRect),
            );
          }
          return const SizedBox.shrink();
        });
  }
}

class _RectSelectedPain extends CustomPainter {
  const _RectSelectedPain({required this.listRect});

  final List<Rect> listRect;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.blue.withValues(alpha: 0.6);
    for (final rect in listRect) {
      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
