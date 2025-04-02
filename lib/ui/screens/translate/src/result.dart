part of '../core.dart';

class _Result extends StatelessWidget {
  const _Result({required this.bloc});

  final TranslateBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslateBloc, TranslateState>(
        bloc: bloc,
        buildWhen: (previous, current) => current is ResultState,
        builder: (context, state) {
          if (state is ResultState && state.result.isNotEmpty) {
            return AnimButton(
              onTap: () => bloc.add(CopyEvent(text: state.result)),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 12.w),
                width: context.width - 48.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: Colors.black54,
                ),
                child: Text(
                  state.result,
                  style: context.textTheme.bodyMedium,
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        });
  }
}
