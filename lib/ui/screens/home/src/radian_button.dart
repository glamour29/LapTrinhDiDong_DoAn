part of '../core.dart';

class _RadianButton extends StatefulWidget {
  const _RadianButton({required this.onChanged});

  final void Function(bool) onChanged;

  @override
  State<_RadianButton> createState() => _RadianButtonState();
}

class _RadianButtonState extends State<_RadianButton> {
  bool _isRadian = false;

  onTap(_) {
    setState(() => _isRadian = !_isRadian);
    widget.onChanged(_isRadian);
  }

  @override
  Widget build(BuildContext context) {
    return _MyButton(
      onTap: onTap,
      value: _isRadian ? 'RAD' : 'DEG',
      foreground: _isRadian ? Colors.cyanAccent : Colors.indigoAccent,
    );
  }
}
