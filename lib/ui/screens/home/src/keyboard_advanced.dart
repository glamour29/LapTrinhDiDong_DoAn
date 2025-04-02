part of '../core.dart';

class _KeyBoardAdvanced extends StatelessWidget {
  final void Function(String value) onTap;
  final VoidCallback onChangeKeyBoard;
  final VoidCallback onPainter;
  final VoidCallback changeLanguage;
  final VoidCallback changeTheme;
  final VoidCallback openGmail;
  final VoidCallback share;
  final VoidCallback openCamera;
  final void Function(bool) onChanged;

  const _KeyBoardAdvanced(
      {required this.onTap,
      required this.onChangeKeyBoard,
      required this.onChanged,
      required this.changeLanguage,
      required this.changeTheme,
      required this.openGmail,
      required this.share,
      required this.openCamera, required this.onPainter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.w),
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
        _MyButton(
          onTap: onTap,
          value: 'C',
          foreground: Colors.red,
        ),
        _MyButton(
          foreground: Colors.amber,
          onTap: onTap,
          value: 'AC',
        ),
        _ActionButton(
          onTap: onPainter,
          icon: FontAwesomeIcons.paintbrush,
          foreground: Colors.white,
        ),
        _ActionButton(
          onTap: onChangeKeyBoard,
          icon: FontAwesomeIcons.keyboard,
          foreground: Colors.blue,
        ),
        _ActionButton(
            onTap: changeTheme,
            icon: FontAwesomeIcons.palette,
            foreground: Colors.white),
        _MyButton(
          onTap: onTap,
          value: 'sin',
        ),
        _MyButton(
          onTap: onTap,
          value: 'cos',
        ),
        _MyButton(
          onTap: onTap,
          value: 'tan',
        ),
        _MyButton(
          onTap: onTap,
          value: 'cot',
        ),
        _ActionButton(
            onTap: openGmail,
            icon: FontAwesomeIcons.triangleExclamation,
            foreground: Colors.yellow),
        _MyButton(
          onTap: onTap,
          value: '^',
          fontSize: 28.sp,
        ),
        _MyButton(
          onTap: onTap,
          value: '!',
        ),
        _MyButton(
          onTap: onTap,
          value: 'log',
        ),
        _MyButton(
          onTap: onTap,
          value: 'e',
          fontSize: 28.sp,
        ),
        _ActionButton(
            onTap: share,
            icon: FontAwesomeIcons.share,
            foreground: Colors.white),
        _ActionButton(
          onTap: onChangeKeyBoard,
          icon: FontAwesomeIcons.keyboard,
          foreground: Colors.white,
        ),
        _MyButton(
          onTap: onTap,
          value: '√',
        ),
        _MyButton(
          onTap: onTap,
          value: 'π',
          fontSize: 28.sp,
        ),
        _RadianButton(onChanged: onChanged),
        _ActionButton(
          onTap: openCamera,
          icon: FontAwesomeIcons.cameraRetro,
          foreground: Colors.white,
        ),
      ];
    }
    return [
      _MyButton(
        onTap: onTap,
        value: 'C',
        foreground: Colors.red,
      ),
      _MyButton(
        foreground: Colors.amber,
        onTap: onTap,
        value: 'AC',
      ),
      _ActionButton(
        onTap: onPainter,
        icon: FontAwesomeIcons.paintbrush,
        foreground: Colors.white,
      ),
      _ActionButton(
          onTap: changeLanguage,
          icon: FontAwesomeIcons.language,
          foreground: Colors.white),
      _MyButton(
        onTap: onTap,
        value: 'sin',
      ),
      _MyButton(
        onTap: onTap,
        value: 'cos',
      ),
      _MyButton(
        onTap: onTap,
        value: 'tan',
      ),
      _ActionButton(
          onTap: changeTheme,
          icon: FontAwesomeIcons.palette,
          foreground: Colors.white),
      _MyButton(
        onTap: onTap,
        value: 'cot',
      ),
      _MyButton(
        onTap: onTap,
        value: '^',
        fontSize: 28.sp,
      ),
      _MyButton(
        onTap: onTap,
        value: '!',
      ),
      _ActionButton(
          onTap: share, icon: FontAwesomeIcons.share, foreground: Colors.white),
      _MyButton(
        onTap: onTap,
        value: 'log',
      ),
      _MyButton(
        onTap: onTap,
        value: 'e',
        fontSize: 28.sp,
      ),
      _MyButton(
        onTap: onTap,
        value: '√',
      ),
      _ActionButton(
          onTap: openGmail,
          icon: FontAwesomeIcons.triangleExclamation,
          foreground: Colors.yellow),
      _ActionButton(
        onTap: onChangeKeyBoard,
        icon: FontAwesomeIcons.keyboard,
        foreground: Colors.white,
      ),
      _MyButton(
        onTap: onTap,
        value: 'π',
        fontSize: 28.sp,
      ),
      _RadianButton(onChanged: onChanged),
      _ActionButton(
        onTap: openCamera,
        icon: FontAwesomeIcons.cameraRetro,
        foreground: Colors.white,
      ),
    ];
  }
}
