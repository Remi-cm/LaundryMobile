import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
    void initState() {
      super.initState();
      Timer(Duration(seconds: 3), 
      () {
        Navigator.pushNamed(context, '/intro');
      }
      );
    }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0xff2979ff)), ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(flex: 2, child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      child: Image.asset('assets/images/logopng.png'),),
                      Padding(padding: EdgeInsets.only(top: 10.0),),
                      Text("ECO Laundry",
                      style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
                      )
                  ],
                )
              )),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),
                    Padding(padding: EdgeInsets.only(top: 20.0),),
                    Text("The Number 1 laundry service \n Management platform", style: TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w500), textAlign: TextAlign.center, ),
                  ],
              ))
            ],)
        ]
      ),
      
    );
  }
}