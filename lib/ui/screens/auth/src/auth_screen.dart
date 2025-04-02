part of '../core.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _bloc = getIt<AuthBloc>();

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg.jpg'),
                    fit: BoxFit.cover)),
            padding: EdgeInsets.all(24),
            child: Stack(
              children: [
                Positioned(
                    top: 28,
                    left: 0,
                    child: AnimButton(
                        child: Icon(Icons.close),
                        onTap: () =>
                            _bloc.add(LoginEvent(oAuth: OAuth.anonymous)))),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoadLottieJson(
                        asset: 'login',
                        width: 160,
                        height: 160,
                      ),
                      SizedBox(height: 16),
                      Text(S.current.login_title,
                          style: context.textTheme.titleSmall),
                      SizedBox(height: 16),
                      Text(S.current.login_content,
                          style: context.textTheme.bodySmall),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimButton(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/search.png",
                              width: 28,
                              height: 28,
                            ),
                            SizedBox(width: 14),
                            Text(
                              S.current.login_with_google,
                              style: context.textTheme.titleSmall,
                            )
                          ],
                        ),
                      ),
                      onTap: () => _bloc.add(LoginEvent(oAuth: OAuth.google))),
                )
              ],
            ),
          ),
        ));
  }
}
