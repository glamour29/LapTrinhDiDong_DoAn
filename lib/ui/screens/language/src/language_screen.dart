part of '../core.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    context.watch<LanguageCubit>().state;
    return SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text(S.current.language),
          ),
          body: _ListLanguage(),
        ));
  }
}
