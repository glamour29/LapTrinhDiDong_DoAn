part of '../core.dart';

class _ShowInputBasic extends StatelessWidget {
  final HomeBloc bloc;

  const _ShowInputBasic({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(right: 16.w, left: 16.w),
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onPanEnd: (_) {},
          child: AutoSizeTextField(
            onTap: () => bloc.add(const CursorMoveEvent()),
            textDirection: TextDirection.ltr,
            controller: bloc.textEditingController,
            minLines: 4,
            maxLines: null,
            cursorHeight: 24.sp,
            minFontSize: 24.sp,
            stepGranularity: 1.sp,
            autofocus: true,
            textAlign: TextAlign.end,
            cursorColor: Colors.blue,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 20.sp, wordSpacing: -4.sp, color: Colors.white),
            showCursor: true,
            readOnly: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ),
    );
  }
}
