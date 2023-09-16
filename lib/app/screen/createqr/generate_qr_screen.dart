import 'package:flutter/material.dart';
import '../view/qrview/qr_view.dart';

class GenerateQrScreen extends StatefulWidget {

  const GenerateQrScreen({Key? key}) : super(key: key);

  @override
  State<GenerateQrScreen> createState() => _GenerateQrScreenState();
}

class _GenerateQrScreenState extends State<GenerateQrScreen> {

  /* properties */
  final _qrContentTextController = TextEditingController();

  String message = 'Ứng dụng Scan QR. Develop by TuanTeo Ứng dụng Scan QR. Develop by TuanTeo Ứng dụng Scan QR. Develop by TuanTeo';

  void _generateQRCode() {
    setState(() {
      message = _qrContentTextController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 280,
                  child: QrView(qrMessage: message),
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
                      decoration: const InputDecoration(hintText: 'Enter url, phone...'),
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
}