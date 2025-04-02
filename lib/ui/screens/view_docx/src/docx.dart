part of '../core.dart';

class _Docx extends StatelessWidget {
  const _Docx({required this.bloc});

  final ViewDocxBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewDocxBloc, ViewDocxState>(
      bloc: bloc,
      buildWhen: (previous, current) => current is FileState,
      builder: (context, state) {
        if (state is FileState) {
          return DocxView(
            filePath: state.path,
            fontSize: context.textTheme.bodySmall?.fontSize?.ceil() ?? 16,
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadLottieJson(
              asset: 'docx',
              width: 200.w,
              height: 200.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Text(
                S.current.view_docx_message,
                style: context.textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 200.h),
          ],
        );
      },
    );
  }
}
