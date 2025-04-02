part of '../core.dart';

class _Language extends StatelessWidget {
  const _Language({required this.bloc});

  final TranslateBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslateBloc, TranslateState>(
      bloc: bloc,
      buildWhen: (previous, current) => current is LanguageState,
      builder: (context, state) {
        if (state is LanguageState) {
          return _LanguageButton(
            languageCode: state.languageCode,
            onSelected: (languageCode) =>
                bloc.add(SelectedLanguageEvent(languageCode: languageCode)),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _LanguageButton extends StatefulWidget {
  const _LanguageButton({required this.languageCode, required this.onSelected});

  final String languageCode;
  final void Function(String) onSelected;

  @override
  State<_LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<_LanguageButton> {
  final _controller = SuperTooltipController();
  late String _languageCode;

  @override
  void initState() {
    _languageCode = widget.languageCode;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _LanguageButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_languageCode != widget.languageCode) {
      setState(() => _languageCode = widget.languageCode);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final language =
        Language.languages.firstWhere((e) => e.code.contains(_languageCode));

    final content = SizedBox(
      height: context.height / 2,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.w),
        itemCount: Language.languages.length,
        itemBuilder: (BuildContext context, int index) {
          final item = Language.languages[index];
          return AnimButton(
              onTap: () {
                widget.onSelected.call(item.code);
                _controller.hideTooltip();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.w),
                  color: Colors.black38,
                  border: item.code == _languageCode
                      ? Border.all(
                          width: 2,
                          color: Colors.green,
                        )
                      : null,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(item.flag),
                    ),
                    SizedBox(width: 8.w),
                    Text(item.preference, style: context.textTheme.bodySmall),
                  ],
                ),
              ));
        },
      ),
    );
    return AnimButton(
        child: SuperTooltip(
          controller: _controller,
          elevation: 20,
          backgroundColor: Colors.white60,
          borderRadius: 4.w,
          popupDirection: TooltipDirection.up,
          arrowTipDistance: 32.w,
          arrowLength: 24.w,
          content: content,
          child: Container(
            height: 40.h,
            margin: EdgeInsets.only(bottom: 24.w),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.w),
                color: Colors.black54,
                border: Border.all(color: Colors.white, width: 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(language.flag),
                ),
                SizedBox(width: 4.w),
                Text(language.preference, style: context.textTheme.bodySmall),
                SizedBox(width: 4.w),
              ],
            ),
          ),
        ),
        onTap: () {
          _controller.showTooltip();
        });
  }
}
