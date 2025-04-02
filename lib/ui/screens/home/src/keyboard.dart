part of '../core.dart';

class _Keyboard extends StatelessWidget {
  const _Keyboard({required this.bloc});

  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    final height = Platform.isIOS
        ? context.isTablet
        ? 230.w
        : 330.w
        : context.isTablet
        ? 224.w
        : 338.w;
    return Container(
      color: context.appColors.background,
      width: 375.w,
      height: height,
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: bloc.pageDownController,
        children: [
          _KeyBoardBasic(
              onChangeKeyBoard: () => bloc.add(ChangeKeyboardEvent(index: 1)),
              onTap: (value) => bloc.add(EnterCalculationsEvent(value))),
          _KeyBoardAdvanced(
              onPainter: () => bloc.add(ChangeKeyboardEvent(index: 2)),
              openCamera: () => bloc.add(OpenCameraEvent()),
              share: () => bloc.add(ShareEvent()),
              openGmail: () => bloc.add(OpenGmailEvent()),
              changeTheme: () =>
                  bloc.add(NavigateEvent(routeName: AppRouter.themeScreen)),
              changeLanguage: () =>
                  bloc.add(NavigateEvent(routeName: AppRouter.languageScreen)),
              onChanged: (isRadian) =>
                  bloc.add(ChangeRadianEvent(isRadian: isRadian)),
              onChangeKeyBoard: () => bloc.add(ChangeKeyboardEvent(index: 0)),
              onTap: (value) => bloc.add(EnterCalculationsEvent(value))),
          _PainterPage(bloc: bloc),
        ],
      ),
    );
  }
}
