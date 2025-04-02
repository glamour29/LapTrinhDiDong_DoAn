part of '../core.dart';

class _ActionButton extends StatelessWidget {
  const _ActionButton({this.onTap, this.foreground, required this.icon});

  final VoidCallback? onTap;
  final IconData icon;
  final Color? foreground;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      color: context.appColors.buttonBackgroundColor,
      borderRadius: BorderRadius.circular(36.0),
      child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(36.0),
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(36.0),
              ),
              child: FaIcon(
                icon,
                color: foreground,
              ))),
    );
  }
}
