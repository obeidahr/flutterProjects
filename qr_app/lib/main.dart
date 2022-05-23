import 'package:flutter/material.dart';
import 'package:qr_app/qr_page.dart';
import 'package:qr_app/ui_style/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      data = value;
                    });
                  },
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Enter the Data",
                      filled: true,
                      fillColor: AppStyle.textInputColor,
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 22,
          ),
          RawMaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>QrPage(data:data)));
            },
            fillColor: AppStyle.accentColor,
            padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
            shape: StadiumBorder(),
            child: Text("Generate QR Code"),
          )
        ],
      ),
    );
  }
}
