import 'package:flutter/material.dart';
import 'package:qr_app/ui_style/style.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPage extends StatefulWidget {
  final String data;

  const QrPage({Key key, this.data}) : super(key: key);

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.primaryColor,
      body: Center(
        child: QrImage(data:this.widget.data,backgroundColor: Colors.white,size: 270,),
      ),
    );
  }
}