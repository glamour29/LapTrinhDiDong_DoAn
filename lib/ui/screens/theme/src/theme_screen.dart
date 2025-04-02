part of '../core.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final id = context.watch<ThemeCubit>().state.id;
    return SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text(S.current.theme),
          ),
          body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 8 / 16),
            itemCount: theme.Theme.list.length,
            itemBuilder: (context, index) => InkWell(
              child: InkWell(
                onTap: () => context
                    .read<ThemeCubit>()
                    .changeTheme(id: theme.Theme.list[index].id),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      theme.Theme.list[index].asset,
                      fit: BoxFit.cover,
                    ),
                    if (id == theme.Theme.list[index].id)
                      Positioned.fill(
                        child: Container(
                          color: Colors.black.withValues(alpha: 0.4),
                          child: Center(
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 44.w,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
