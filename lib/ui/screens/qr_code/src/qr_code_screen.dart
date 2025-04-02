part of '../core.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? _controller;
  Barcode? _result;

  void _onQRViewCreated(QRViewController controller) {
    _controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() => _result = scanData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          body: Column(
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: QRView(
                        key: _qrKey,
                        onQRViewCreated: _onQRViewCreated,
                        overlay: QrScannerOverlayShape(
                          borderRadius: 4.r,
                          overlayColor: Colors.black.withValues(alpha: 0.7),
                          borderColor: Colors.green,
                          borderWidth: 8.0,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 144.h,
                        left: 0.w,
                        child: SizedBox(
                          width: context.width,
                          child: Column(
                            children: [
                              Text(
                                S.current.qr_scanner,
                                style: context.textTheme.titleSmall?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                S.current.qr_scanner_content,
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )),
                    if (_result != null)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 24.h),
                          child: AnimButton(
                            onTap: () {
                              AppRouter.showMessageSuccess(S.current.copied);
                              Clipboard.setData(
                                  ClipboardData(text: _result?.code ?? ''));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 24.w),
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.w, horizontal: 12.w),
                              width: context.width - 48.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  color: Colors.black54,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  )),
                              child: Text(
                                _result?.code ?? S.current.camera_message,
                                style: context.textTheme.bodyMedium,
                              ),
                            ),
                          ),
                        ),
                      ),
                    Positioned(top: 44.h, left: 12.w, child: BackButton()),
                  ],
                ),
              ),
              Container(
                color: Colors.black87,
                padding: EdgeInsets.symmetric(vertical: 44.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AnimButton(
                        child: Icon(FontAwesomeIcons.lightbulb),
                        onTap: () {
                          _controller?.toggleFlash();
                        }),
                    AnimButton(
                        child: Icon(
                          FontAwesomeIcons.arrowsRotate,
                        ),
                        onTap: () {
                          _controller?.flipCamera();
                        }),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
