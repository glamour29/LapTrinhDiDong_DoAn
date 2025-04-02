part of '../core.dart';

class _MyButton extends StatelessWidget {
  final void Function(String value)? onTap;
  final double? fontSize;
  final String value;
  final Color? background;

  final Color? foreground;

  const _MyButton({
    required this.onTap,
    required this.value,
    this.fontSize,
    this.foreground,
    this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      color:  context.appColors.buttonBackgroundColor,
      borderRadius: BorderRadius.circular(36.0),
      child: InkWell(
          onTapDown: (_) => onTap?.call(value),
          borderRadius: BorderRadius.circular(36.0),
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(36.0),
              ),
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1.0,
                    fontSize: fontSize ?? 24.sp,
                    color: foreground ?? Colors.white),
              ))),
    );
  }
}
