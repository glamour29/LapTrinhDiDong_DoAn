part of '../core.dart';

class _ShowResult extends StatelessWidget {
  final HomeBloc bloc;

  const _ShowResult({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        bloc: bloc,
        buildWhen: (previous, current) => current is ResultState,
        builder: (context, state) {
          if (state is ResultState) {
            return Container(
                padding: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 20.h),
                alignment: Alignment.centerRight,
                child: Text(
                  state.result,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: Colors.green),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ));
          }
          return const SizedBox();
        });
  }
}
