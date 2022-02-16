import 'package:flutter/material.dart';
// import 'package:qrscan/qrscan.dart' as scanner;
import 'package:test1/State/get/get1.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:test1/State/get/get2.dart';
// import 'package:test1/State/get/get3.dart';
import 'package:test1/State/page/name.dart';
import 'package:test1/State/page/name1.dart';
import 'package:test1/State/page/name2.dart';
import 'package:test1/utility/my_constant.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class AddPage1 extends StatefulWidget {
  const AddPage1({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage1> {
  List todolistitems = [];
  String qrcode = 'Hi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Myconstat.black,
          onPressed: startscan,
          child: Icon(
            Icons.qr_code_scanner_sharp,
            color: Myconstat.primary1,
          ),
        ),
        body: Get1());
  }

  Future<void> startscan() async {
    try {
      final qrcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrcode = qrcode;
        print(qrcode);
        if (qrcode.contains("smarthome/lasdlkasck/1/looff")) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => codename()));
        }
        if (qrcode.contains("smarthome/lasdlkasck/2/looff")) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => codename2()));
        }
        if (qrcode.contains("smarthome/lasdlkasck/3/looff")) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => codename3()));
        }
      });
    } on PlatformException {
      qrcode = 'Failed to get platform version.';
    }
  }
}
