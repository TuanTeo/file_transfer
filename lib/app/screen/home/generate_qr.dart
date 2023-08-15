/*
 * QR.Flutter
 * Copyright (c) 2019 the QR.Flutter authors.
 * See LICENSE for distribution and usage details.
 */

import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// This is the screen that you'll see when the app starts
class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _qrContentTextController = TextEditingController();

  String message =
  // ignore: lines_longer_than_80_chars
      'Ứng dụng Scan QR. Develop by TuanTeo Hahaha';

  @override
  Widget build(BuildContext context) {


    final FutureBuilder<ui.Image> qrFutureBuilder = FutureBuilder<ui.Image>(
      future: _loadOverlayImage(),
      builder: (BuildContext ctx, AsyncSnapshot<ui.Image> snapshot) {
        const double size = 280.0;
        if (!snapshot.hasData) {
          return const SizedBox(width: size, height: size);
        }
        return CustomPaint(
          size: const Size.square(size),
          painter: QrPainter(
            data: message,
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
            embeddedImage: snapshot.data,
            embeddedImageStyle: const QrEmbeddedImageStyle(
              size: Size.square(60),
            ),
          ),
        );
      },
    );

    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 280,
                  child: qrFutureBuilder,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40)
                  .copyWith(bottom: 100),
              child: Container(
                color: Color(0x5114ABFC),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Content", style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    ),
                    TextField(
                        controller: _qrContentTextController,
                        decoration: const InputDecoration(hintText: 'Enter url, link...'),
                    ),
                    const SizedBox(height: 20,),
                    MaterialButton(
                        onPressed: _generateQRCode,
                        color: Color(0xA8E2F5FF),
                        child: Text("Generate"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<ui.Image> _loadOverlayImage() async {
    final Completer<ui.Image> completer = Completer<ui.Image>();
    final ByteData byteData =
        await rootBundle.load('assets/images/ic_launcher.png');
    ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
    return completer.future;
  }

  void _generateQRCode() {
    setState(() {
      message = _qrContentTextController.text;
    });
  }
}