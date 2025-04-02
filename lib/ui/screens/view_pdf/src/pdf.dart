part of '../core.dart';

class _Pdf extends StatelessWidget {
  const _Pdf({required this.bloc});

  final ViewPdfBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewPdfBloc, ViewPdfState>(
      bloc: bloc,
      buildWhen: (previous, current) => current is FileState,
      builder: (context, state) {
        if (state is FileState && state.path != null) {
          return _ViewPdf(path: state.path!);
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadLottieJson(
              asset: 'pdf',
              width: 200.w,
              height: 200.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Text(
                S.current.view_pdf_message,
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

class _ViewPdf extends StatefulWidget {
  const _ViewPdf({required this.path});

  final String path;

  @override
  State<_ViewPdf> createState() => _ViewPdfState();
}

class _ViewPdfState extends State<_ViewPdf> {
  late String _path;
  String? _index;

  @override
  void initState() {
    _path = widget.path;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _ViewPdf oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_path != widget.path) {
      setState(() => _path = widget.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        PDFView(
          filePath: _path,
          enableSwipe: true,
          swipeHorizontal: true,
          autoSpacing: true,
          pageFling: true,
          backgroundColor: Colors.white,
          onRender: (pages) {
            setState(() => _index = '1/$pages');
          },
          onPageChanged: (int? page, int? total) {
            setState(() => _index = '${(page ?? 0) + 1}/$total');
          },
        ),
        if (_index != null)
          Positioned(
              top: 32.w,
              right: 24.w,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(4.w),
                ),
                padding: EdgeInsets.symmetric(vertical: 6.w, horizontal: 12.w),
                child: Text(
                  _index!,
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: Colors.white),
                ),
              ))
      ],
    );
  }
}
