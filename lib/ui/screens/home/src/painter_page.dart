part of '../core.dart';

class _PainterPage extends StatelessWidget {
  const _PainterPage({required this.bloc});

  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanStart: (details) =>
                bloc.add(OnPanStartEvent(details: details)),
            onPanUpdate: (details) =>
                bloc.add(OnPanUpdateEvent(details: details)),
            onPanEnd: (details) => bloc.add(OnPanEndEvent(details: details)),
            child: BlocBuilder<HomeBloc, HomeState>(
              bloc: bloc,
              buildWhen: (previous, current) => current is ListPainState,
              builder: (context, state) {
                if (state is ListPainState && state.listOffsets.isNotEmpty) {
                  return CustomPaint(
                    painter: OffsetsPaint(listOffsets: state.listOffsets),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          Positioned(
            bottom: 12.h,
            left: 12.w,
            child: SizedBox(
              width: 60.w,
              height: 40.w,
              child: _ActionButton(
                onTap: () => bloc.add(ChangeKeyboardEvent(index: 1)),
                icon: FontAwesomeIcons.keyboard,
                foreground: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 12.h,
            left: 84.w,
            child: SizedBox(
              width: 60.w,
              height: 40.w,
              child: _MyButton(
                  onTap: (value) => bloc.add(EnterCalculationsEvent(value)),
                  value: '+',
                  foreground: Colors.green),
            ),
          ),
          Positioned(
            bottom: 12.h,
            left: 156.w,
            child: SizedBox(
              width: 60.w,
              height: 40.w,
              child: _MyButton(
                  onTap: (value) => bloc.add(EnterCalculationsEvent(value)),
                  value: '—',
                  foreground: Colors.green),
            ),
          ),
          Positioned(
            bottom: 12.h,
            left: 228.w,
            child: SizedBox(
              width: 60.w,
              height: 40.w,
              child: _MyButton(
                  onTap: (value) => bloc.add(EnterCalculationsEvent(value)),
                  value: '×',
                  foreground: Colors.green),
            ),
          ),
          Positioned(
            bottom: 12.h,
            left: 300.w,
            child: SizedBox(
              width: 60.w,
              height: 40.w,
              child: _MyButton(
                  onTap: (value) => bloc.add(EnterCalculationsEvent(value)),
                  value: '÷',
                  foreground: Colors.green),
            ),
          ),
          Positioned(
            bottom: 64.h,
            left: 12.w,
            child: SizedBox(
              width: 60.w,
              height: 40.w,
              child: _MyButton(
                foreground: Colors.amber,
                onTap: (value) => bloc.add(EnterCalculationsEvent(value)),
                value: 'AC',
              ),
            ),
          ),
          Positioned(
            bottom: 116.h,
            left: 12.w,
            child: SizedBox(
              width: 60.w,
              height: 40.w,
              child: _MyButton(
                onTap: (value) => bloc.add(EnterCalculationsEvent(value)),
                value: 'C',
                foreground: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OffsetsPaint extends CustomPainter {
  final List<List<Offset>> listOffsets;

  const OffsetsPaint({required this.listOffsets});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..isAntiAlias = true
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke;
    final path = Path();
    for (final offsets in listOffsets) {
      path.moveTo(offsets.first.dx, offsets.first.dy);
      for (int i = 1; i < offsets.length; i++) {
        path.lineTo(offsets[i].dx, offsets[i].dy);
      }
      canvas.drawPath(path, paint);
    }
    path.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
