import 'package:flutter/cupertino.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

class QrView extends StatefulWidget {

  final String qrMessage;

  const QrView ({ Key? key, required this.qrMessage }): super(key: key);

  @override
  State<QrView> createState() => _QrView();
}

class _QrView extends State<QrView> {

  Future<ui.Image> _loadOverlayImage() async {
    final Completer<ui.Image> completer = Completer<ui.Image>();
    final ByteData byteData =
    await rootBundle.load('assets/images/ic_launcher.png');
    ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
      future: _loadOverlayImage(),
      builder: (BuildContext ctx, AsyncSnapshot<ui.Image> snapshot) {
        const double size = 280.0;
        if (!snapshot.hasData) {
          return const SizedBox(width: size, height: size);
        }

        return CustomPaint(
          size: const Size.square(size),
          painter: QrPainter(
            data: widget.qrMessage,
            version: QrVersions.auto,
            eyeStyle: const QrEyeStyle(
              eyeShape: QrEyeShape.square,
              color: Color(0xff000000),
            ),
            dataModuleStyle: const QrDataModuleStyle(
              dataModuleShape: QrDataModuleShape.square,
              color: Color(0xff000000),
            ),
            // size: 320.0,
            // embeddedImage: snapshot.data,
            // embeddedImageStyle: const QrEmbeddedImageStyle(
            //   size: Size.square(60),
            // ),
          ),
        );
      },
    );
  }
}