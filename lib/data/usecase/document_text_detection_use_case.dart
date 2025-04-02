import 'dart:typed_data';

import 'package:google_vision/google_vision.dart';

class DocumentTextDetectionUseCase {
  final GoogleVision _googleVision;

  const DocumentTextDetectionUseCase({required GoogleVision googleVision})
      : _googleVision = googleVision;

  Future<FullTextAnnotation?> call({required ByteBuffer byteBuffer}) async {
    final jsonImage = JsonImage(byteBuffer: byteBuffer);
    return await _googleVision.image.documentTextDetection(jsonImage);
  }
}
