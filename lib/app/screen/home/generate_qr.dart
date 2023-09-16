/*
 * QR.Flutter
 * Copyright (c) 2019 the QR.Flutter authors.
 * See LICENSE for distribution and usage details.
 */

import 'package:file_transfer/app/screen/view/qrview/qr_view.dart';
import 'package:flutter/material.dart';

/// This is the screen that you'll see when the app starts
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  void _showGenerateQrScreen() {
    Navigator.of(context).pushNamed('/generate_qr');
  }

  void _showScanQrScreen() {
    Navigator.of(context).pushNamed('/scan_qr');
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset : true,
          body: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: MaterialButton(
                    onPressed: _showGenerateQrScreen,
                    color: Color(0xA8E2F5FF),
                    child: Text("Generate"),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: MaterialButton(
                    onPressed: _showScanQrScreen,
                    color: Color(0xA8E2F5FF),
                    child: Text("Scan"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}