import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mytodoc/googleLogin/googlescreen.dart';
import 'package:mytodoc/screen/Homepage.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/splashbg.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Center(child: Image.asset('assets/images/splashlogo.png')),
          )
        ],
      ),
    );
  }
}
