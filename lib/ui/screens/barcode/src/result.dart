part of '../core.dart';

class _Result extends StatelessWidget {
  const _Result({required this.bloc});

  final BarcodeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BarcodeBloc, BarcodeState>(
        bloc: bloc,
        buildWhen: (previous, current) => current is ResultState,
        builder: (context, state) {
          if (state is ResultState && state.data.isNotEmpty) {
            final barcodeKey = GlobalKey();
            return Column(
              children: [
                RepaintBoundary(
                  key: barcodeKey,
                  child: BarcodeWidget(
                    color: Colors.white,
                    backgroundColor: Colors.black38,
                    width: context.width * 0.7,
                    barcode: Barcode.fromType(state.barcodeType),
                    data: state.data,
                    drawText: false,
                    errorBuilder: (context, error) {
                      final msg = switch (state.barcodeType) {
                        BarcodeType.Code93 => S.current.error_code93,
                        BarcodeType.Code128 => S.current.error_code128,
                        BarcodeType.Code39 => S.current.error_code_39,
                        BarcodeType.GS128 => S.current.error_gs_128,
                        BarcodeType.Itf => S.current.error_itf,
                        BarcodeType.CodeITF14 => S.current.error_code_itf_14,
                        BarcodeType.CodeITF16 => S.current.error_code_itf_16,
                        BarcodeType.CodeEAN13 => S.current.error_code_ean_13,
                        BarcodeType.CodeEAN8 => S.current.error_code_ean_8,
                        BarcodeType.CodeEAN5 => S.current.error_code_ean_5,
                        BarcodeType.CodeEAN2 => S.current.error_code_ean_2,
                        BarcodeType.CodeISBN => S.current.error_code_isbn,
                        BarcodeType.CodeUPCA => S.current.error_code_upca,
                        BarcodeType.CodeUPCE => S.current.error_code_upce,
                        BarcodeType.Telepen => S.current.error_telepen,
                        BarcodeType.Codabar => S.current.error_codabar,
                        BarcodeType.Rm4scc => S.current.error_rm4scc,
                        BarcodeType.Postnet => S.current.error_postnet,
                        _ => "Invalid barcode type.",
                      };

                      return Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.w, horizontal: 16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: Colors.red.withValues(alpha: 0.4),
                          ),
                          child: Text(
                            msg,
                            style: context.textTheme.labelSmall,
                          ));
                    },
                  ),
                ),
                SizedBox(height: 32.h),
                GradientElevatedButton(
                  onPressed: () => bloc.add(GenerateEvent(key: barcodeKey)),
                  style: GradientElevatedButton.styleFrom(
                      backgroundGradient: const LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                        Color(0xFFFFF300),
                        Color(0xFFFFD202),
                        Color(0xFFFE8A02),
                      ])),
                  child: Text(
                    S.current.generate,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        });
  }
}
