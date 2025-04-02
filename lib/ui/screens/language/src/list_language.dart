part of '../core.dart';

class _ListLanguage extends StatelessWidget {
  const _ListLanguage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, String>(
      builder: (context, languageCode) {
        final language =
            Language.languages.firstWhere((e) => e.code.contains(languageCode));
        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 1.w,
                crossAxisSpacing: 1.w,
                childAspectRatio: 2.0),
            padding: EdgeInsets.all(16.w),
            itemCount: Language.languages.length,
            itemBuilder: (context, index) => _LanguageItem(
                  language: Language.languages[index],
                  isSelected: language.code == Language.languages[index].code,
                  onTap: () => context
                      .read<LanguageCubit>()
                      .changeLanguage(languageCode: Language.languages[index].code),
                ));
      },
    );
  }
}
