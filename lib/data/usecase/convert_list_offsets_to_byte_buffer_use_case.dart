import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:calc_pro/ui/screens/home/core.dart';

class ConvertListOffsetsToBytesUseCase {
  Future<ByteBuffer> call(
      {required List<List<Offset>> listOffsets,
      double width = 500,
      double height = 500}) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final painter = OffsetsPaint(listOffsets: listOffsets);
    painter.paint(canvas, Size(width, height));
    final picture = recorder.endRecording();
    final image = await picture.toImage(width.ceil(), height.ceil());
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer;
  }
}
