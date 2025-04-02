part of '../core.dart';

class _LanguageItem extends StatelessWidget {
  const _LanguageItem(
      {required this.language, required this.isSelected, required this.onTap});

  final Language language;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: CircleAvatar(
            backgroundColor: context.appColors.buttonBackgroundColor,
            radius: 12.r,
            child: CircleAvatar(
              radius: 10.r,
              backgroundColor: isSelected
                  ? context.appColors.radioSelectedColor
                  : context.appColors.scaffoldBackgroundColor,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              language.preference,
              style: context.textTheme.bodySmall,
            ),
            Row(
              children: [
                Image.asset(language.flag, width: 24.w, height: 24.w),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    language.country,
                    style: context.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ],
        ))
      ],
    );
  }
}
