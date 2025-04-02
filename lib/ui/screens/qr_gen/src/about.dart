part of '../core.dart';

class _About extends StatefulWidget {
  const _About();

  @override
  State<_About> createState() => _AboutState();
}

class _AboutState extends State<_About> {
  final _controller = SuperTooltipController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SuperTooltip(
      controller: _controller,
        backgroundColor: Colors.white24,
        content: Text(S.current.qr_gen_message),
        child: AnimButton(
            child: Icon(
              FontAwesomeIcons.circleQuestion,
              size: 24.sp,
            ),
            onTap: () => _controller.showTooltip()));
  }
}
