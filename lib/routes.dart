import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/register.dart';
import 'pages/intro.dart';
import 'pages/login.dart';
import 'pages/splash.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => SplashScreen());

      case '/intro':
        return MaterialPageRoute(builder: (context) => IntroSlides());
     
      case '/login':
        return MaterialPageRoute(builder: (context) => Login());
      
      case '/register':
      return MaterialPageRoute(builder: (context) => Register());

      case '/home':
      return MaterialPageRoute(builder: (context) => Home());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                'There is nothing here check somewhere else',
              ),
            ),
          ),
        );
    }
  }
}
