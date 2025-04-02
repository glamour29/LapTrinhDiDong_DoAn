part of '../core.dart';

class _RectArea extends StatelessWidget {
  const _RectArea({required this.bloc});

  final TranslateBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslateBloc, TranslateState>(
      bloc: bloc,
      buildWhen: (previous, current) => current is RectAreaState,
      builder: (context, state) {
        if (state is RectAreaState && state.isShow) {
          return GestureDetector(
            onPanStart: (details) =>
                bloc.add(OnPanStartEvent(details: details)),
            onPanUpdate: (details) =>
                bloc.add(OnPanUpdateEvent(details: details)),
            onPanEnd: (details) => bloc.add(OnPanEndEvent()),
            child: CustomPaint(
              painter: _RectAreaPainter(rectArea: state.rectArea),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _RectAreaPainter extends CustomPainter {
  final Rect rectArea;

  _RectAreaPainter({required this.rectArea});

  @override
  void paint(Canvas canvas, Size size) {
    final paintOverlay = Paint()..color = Colors.black.withValues(alpha: 0.5);
    final paintBorder = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final paintGreen = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    // 1️⃣ Vẽ nền đen nhạt xung quanh vùng quét
    Path overlayPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    Path scanPath = Path()..addRect(rectArea);
    Path finalPath =
        Path.combine(PathOperation.difference, overlayPath, scanPath);
    canvas.drawPath(finalPath, paintOverlay);

    // 2️⃣ Vẽ khung trắng cho vùng quét
    canvas.drawRect(rectArea, paintBorder);

    // 3️⃣ Vẽ các góc xanh lá
    double cornerLength = 20;
    final cornerOffsets = [
      // Trên trái
      [rectArea.topLeft, rectArea.topLeft.translate(cornerLength, 0)],
      [rectArea.topLeft, rectArea.topLeft.translate(0, cornerLength)],
      // Trên phải
      [rectArea.topRight, rectArea.topRight.translate(-cornerLength, 0)],
      [rectArea.topRight, rectArea.topRight.translate(0, cornerLength)],
      // Dưới trái
      [rectArea.bottomLeft, rectArea.bottomLeft.translate(cornerLength, 0)],
      [rectArea.bottomLeft, rectArea.bottomLeft.translate(0, -cornerLength)],
      // Dưới phải
      [rectArea.bottomRight, rectArea.bottomRight.translate(-cornerLength, 0)],
      [rectArea.bottomRight, rectArea.bottomRight.translate(0, -cornerLength)],
    ];

    for (var pair in cornerOffsets) {
      canvas.drawLine(pair[0], pair[1], paintGreen);
    }

    // 4️⃣ Vẽ đường giữa
    final midLineSize = 40.0;
    final midLines = [
      [
        rectArea.topCenter.translate(-midLineSize / 2, 0),
        rectArea.topCenter.translate(midLineSize / 2, 0)
      ],
      [
        rectArea.bottomCenter.translate(-midLineSize / 2, 0),
        rectArea.bottomCenter.translate(midLineSize / 2, 0)
      ],
      [
        rectArea.centerLeft.translate(0, -midLineSize / 2),
        rectArea.centerLeft.translate(0, midLineSize / 2)
      ],
      [
        rectArea.centerRight.translate(0, -midLineSize / 2),
        rectArea.centerRight.translate(0, midLineSize / 2)
      ],
    ];

    for (var pair in midLines) {
      canvas.drawLine(pair[0], pair[1], paintGreen);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
