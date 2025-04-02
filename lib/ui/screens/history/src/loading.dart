part of '../core.dart';

class _Loading extends StatelessWidget {
  const _Loading({required this.bloc});

  final HistoryBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      bloc: bloc,
      buildWhen: (previous, current) =>
          current is LoadingState || current is LoadedState,
      builder: (context, state) {
        final isLoading = state is LoadingState;
        return _CircularProgress(isLoading: isLoading);
      },
    );
  }
}

class _CircularProgress extends StatefulWidget {
  const _CircularProgress({required this.isLoading});

  final bool isLoading;

  @override
  State<_CircularProgress> createState() => _CircularProgressState();
}

class _CircularProgressState extends State<_CircularProgress> {
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = widget.isLoading;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _CircularProgress oldWidget) {
    if (widget.isLoading != _isLoading) {
      setState(() => _isLoading = widget.isLoading);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: Colors.transparent,
      width: double.infinity,
      height: _isLoading ? 50.h : 0.h,
      curve: Curves.fastLinearToSlowEaseIn,
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.only(bottom: 10.h,top: 14.w),
      child: Center(
        child: AspectRatio(
            aspectRatio: 1, child: CircularProgressIndicator.adaptive()),
      ),
    );
  }
}
