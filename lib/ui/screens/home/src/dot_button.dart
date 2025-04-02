part of '../core.dart';

class _DotButton extends StatelessWidget {
  const _DotButton({required this.fontSize, required this.onTap});

  final double fontSize;
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LanguageCubit>().state;
    final isDotDecimalLocale =
        Constants.dotDecimalLocales.any((e) => e.contains(locale));
    return _MyButton(
      onTap: onTap,
      value: isDotDecimalLocale ? '.' : ',',
      fontSize: fontSize,
    );
  }
}
