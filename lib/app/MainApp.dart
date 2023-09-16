import 'package:flutter/material.dart';

import 'screen/createqr/generate_qr_screen.dart';
import 'screen/home/generate_qr.dart';
import 'screen/scanner_qr/scanner_qr.dart';

class MainApp extends StatelessWidget {
  const MainApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const MainScreen(),
        '/generate_qr': (context) => const GenerateQrScreen(),
        '/scan_qr': (context) => const QRViewExample()
      },
    );
  }
}