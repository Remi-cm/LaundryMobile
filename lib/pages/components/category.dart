import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String name;
  final Icon icon;
  final Color color;

  Category(this.name, this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    final wv = MediaQuery.of(context).size.width/100;
    final hv = MediaQuery.of(context).size.height/100;
    
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: wv*29,
        child: GestureDetector(onTap: (){},
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 12.0, bottom: 8.0),
                  decoration: BoxDecoration(color: color, borderRadius: BorderRadius.all(Radius.circular(5.0))), width: wv*100, height: 75.0,
                  child: Column(
                    children: <Widget>[
                      IconTheme(
                        data: IconThemeData(color: Colors.white),child: icon),
                        Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(name, style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
                )
                    ],
                  ),
                ),
                
              ],
              )
          ),
        ),
      ),
    );
  }
}
