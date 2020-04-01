import 'package:flutter/material.dart';

class Clothe extends StatelessWidget {
  
  final String title;
  final int price;
  final String seller;
  final String image;
  Clothe(this.title, this.price, this.seller, this.image);

  @override
  Widget build(BuildContext context) {

    final wv = MediaQuery.of(context).size.width/100;
    final hv = MediaQuery.of(context).size.width/100;
 ;
    return SizedBox(height: hv*50, width: wv*35,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 5,
        child: Stack(
          children: <Widget>[
            Image.asset(image, fit: BoxFit.cover,),
            Align(
              alignment: Alignment.bottomCenter,
              child: GridTile(
            footer: Container(color: Colors.white.withOpacity(0.95),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 3.0,),
                  Container( child: Padding(
                  padding: const EdgeInsets.only(left:2.0, right: 2.0, top: 2.0, bottom: 2.0),
                  child: Text(title, style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 12.0), textAlign: TextAlign.center,),
                )),
                Container( child: Padding(
                  padding: const EdgeInsets.only(left:2.0, right: 2.0),
                  child: Text("$price FCFA", style: TextStyle(color: Color(0xff2979ff), fontWeight: FontWeight.w900, fontSize: 12.0), textAlign: TextAlign.center),
                )),
                SizedBox(height: 3.0,)
                ],
              ),
            ),

            child: Image.asset(image, fit: BoxFit.fill,)
            )
            )],
        ),
      ),
    );
  }
}