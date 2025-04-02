part of '../core.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final _bloc = getIt<CameraBloc>();

  @override
  void initState() {
    _bloc.add(InitialEvent(context: context));
    super.initState();
  }

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
          body: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              _CameraView(bloc: _bloc),
              Positioned(
                  top: 44.h,
                  left: 12.w,
                  child: BackButton(
                    color: Colors.white,
                  )),
              Positioned(
                  top: 44.h, right: 52.w, child: _FlashButton(bloc: _bloc)),
              Positioned(
                  top: 44.h,
                  right: 12.w,
                  child: AnimButton(
                      onTap: () => _bloc.add(PickPhotoEvent()),
                      child: Icon(
                        FontAwesomeIcons.photoFilm,
                        color: Colors.white,
                      ))),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(32.r),
                      ),
                      child: Text(S.current.camera_message,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      width: double.infinity,
                      color: Colors.black38,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: AnimButton(
                        onTap: () => _bloc.add(CaptureEvent()),
                        child: CircleAvatar(
                          radius: 32.r,
                          backgroundColor: Colors.white30,
                          child: CircleAvatar(
                            radius: 24.r,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
