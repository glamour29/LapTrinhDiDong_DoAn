part of '../core.dart';

class _RectPainter extends StatelessWidget {
  const _RectPainter({required this.bloc});

  final ScannerBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScannerBloc, ScannerState>(
        bloc: bloc,
        buildWhen: (previous, current) => current is ListRectState,
        builder: (context, state) {
          if (state is ListRectState) {
            return CustomPaint(
              painter: _RectPain(listRect: state.listRect),
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
      ..color = Colors.green
      ..strokeWidth = 2.0;
    for (final rect in listRect) {
      canvas.drawLine(rect.topLeft,rect.topRight, paint);
      canvas.drawLine(rect.topRight,rect.bottomRight, paint);
      canvas.drawLine(rect.bottomRight,rect.bottomLeft, paint);
      canvas.drawLine(rect.bottomLeft,rect.topLeft, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
