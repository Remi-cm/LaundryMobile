import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Carosel extends StatelessWidget {
  MediaQueryData queryData;
  
  @override
  Widget build(BuildContext context) {
    //final wv = MediaQuery.of(context).size.width/100;
    final hv = MediaQuery.of(context).size.height/100;

    return Container(
      child: SizedBox(
        width: double.infinity,
        height: hv*25,
        child: Carousel(
          overlayShadowSize: 0.2,
          overlayShadowColors: Colors.redAccent,
          dotSize: 4.0,
          
          dotBgColor: Colors.redAccent.withOpacity(0.0),
          animationDuration: Duration(milliseconds: 1000),
          images: [
            Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/img-commercial-service-1.jpg'), fit: BoxFit.fill))),
            Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/laundry.jpg'), fit: BoxFit.fill))),
            Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/banner3.jpg'), fit: BoxFit.cover))),
            Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/pressing5.jpg'), fit: BoxFit.cover))),
          ],
        ),
      ),
    );
  }
}