part of '../core.dart';

class _KeyBoardBasic extends StatelessWidget {
  final void Function(String value) onTap;
  final VoidCallback onChangeKeyBoard;

  const _KeyBoardBasic({required this.onTap, required this.onChangeKeyBoard});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Platform.isIOS ? 2.w : 8.w),
      child: GridView(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.isTablet ? 5 : 4,
            childAspectRatio: context.isTablet ? 5 / 4 : 6 / 4,
            crossAxisSpacing: 10.sp,
            mainAxisSpacing: 10.sp,
          ),
          padding: const EdgeInsets.all(10.0),
          shrinkWrap: true,
          children: listButton(context)),
    );
  }

  List<Widget> listButton(BuildContext context) {
    if (context.isTablet) {
      return [
        _MyButton(onTap: onTap, value: 'C', foreground: Colors.red),
        _MyButton(
          onTap: onTap,
          value: '( )',
        ),
        _MyButton(
          onTap: onTap,
          value: 'AC',
        ),
        _MyButton(onTap: onTap, value: '÷', foreground: Colors.green),
        _MyButton(onTap: onTap, value: '×', foreground: Colors.green),
        _MyButton(
          onTap: onTap,
          value: '6',
        ),
        _MyButton(
          onTap: onTap,
          value: '7',
        ),
        _MyButton(
          onTap: onTap,
          value: '8',
        ),
        _MyButton(
          onTap: onTap,
          value: '9',
        ),
        _MyButton(onTap: onTap, value: '+', foreground: Colors.green),
        _MyButton(
          onTap: onTap,
          value: '2',
        ),
        _MyButton(
          onTap: onTap,
          value: '3',
        ),
        _MyButton(
          onTap: onTap,
          value: '4',
        ),
        _MyButton(
          onTap: onTap,
          value: '5',
        ),
        _MyButton(onTap: onTap, value: '—', foreground: Colors.green),
        _MyButton(
          onTap: onTap,
          value: '+/-',
          fontSize: 20.sp,
        ),
        _MyButton(
          onTap: onTap,
          value: '1',
        ),
        _MyButton(
          onTap: onTap,
          value: '0',
        ),
        _DotButton(
          onTap: onTap,
          fontSize: 28.sp,
        ),
        _MyButton(
          background: Colors.green,
          onTap: onTap,
          fontSize: 28.sp,
          value: '=',
        )
      ];
    }
    return [
      _MyButton(onTap: onTap, value: 'C', foreground: Colors.red),
      _MyButton(
        foreground: Colors.amber,
        onTap: onTap,
        value: 'AC',
      ),
      _MyButton(
        onTap: onTap,
        value: '( )',
      ),
      _MyButton(
          onTap: onTap, value: '÷', fontSize: 28.sp, foreground: Colors.green),
      _MyButton(
        onTap: onTap,
        value: '7',
      ),
      _MyButton(
        onTap: onTap,
        value: '8',
      ),
      _MyButton(
        onTap: onTap,
        value: '9',
      ),
      _MyButton(
          onTap: onTap, value: '×', fontSize: 28.sp, foreground: Colors.green),
      _MyButton(
        onTap: onTap,
        value: '4',
      ),
      _MyButton(
        onTap: onTap,
        value: '5',
      ),
      _MyButton(
        onTap: onTap,
        value: '6',
      ),
      _MyButton(
        onTap: onTap,
        value: '—',
        foreground: Colors.green,
      ),
      _MyButton(
        onTap: onTap,
        value: '1',
      ),
      _MyButton(
        onTap: onTap,
        value: '2',
      ),
      _MyButton(
        onTap: onTap,
        value: '3',
      ),
      _MyButton(
          onTap: onTap, value: '+', fontSize: 28.sp, foreground: Colors.green),
      _ActionButton(
        onTap: onChangeKeyBoard,
        icon: FontAwesomeIcons.keyboard,
        foreground: Colors.white,
      ),
      _MyButton(
        onTap: onTap,
        value: '0',
      ),
      _DotButton(
        onTap: onTap,
        fontSize: 28.sp,
      ),
      _MyButton(
        background: Colors.green,
        onTap: onTap,
        value: '=',
        fontSize: 28.sp,
      )
    ];
  }
}
