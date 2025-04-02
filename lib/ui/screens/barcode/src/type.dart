part of '../core.dart';

class _Type extends StatelessWidget {
  const _Type({required this.bloc});

  final BarcodeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BarcodeBloc, BarcodeState>(
        bloc: bloc,
        buildWhen: (previous, current) => current is BarcodeTypeState,
        builder: (context, state) {
          if (state is BarcodeTypeState) {
            List<BarcodeType> barcodes = [
              BarcodeType.Code128,
              BarcodeType.Code93,
              BarcodeType.Code39,
              BarcodeType.GS128,
              BarcodeType.Itf,
              BarcodeType.CodeITF14,
              BarcodeType.CodeITF16,
              BarcodeType.CodeEAN13,
              BarcodeType.CodeEAN8,
              BarcodeType.CodeEAN5,
              BarcodeType.CodeEAN2,
              BarcodeType.CodeISBN,
              BarcodeType.CodeUPCA,
              BarcodeType.CodeUPCE,
              BarcodeType.Telepen,
              BarcodeType.Codabar,
              BarcodeType.Rm4scc,
              BarcodeType.Postnet,
            ];
            return DropdownButton2(
              isExpanded: true,
              dropdownStyleData: DropdownStyleData(
                  maxHeight: context.height * 0.3,
                  decoration: BoxDecoration(color: Colors.black38)),
              items: barcodes
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                  .toList(),
              value: state.type,
              onChanged: (type) =>
                  bloc.add(OnChangeBarcodeTypeEvent(type: type!)),
            );
          }
          return const SizedBox.shrink();
        });
  }
}
