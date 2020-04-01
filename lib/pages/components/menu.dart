import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'category.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Category('Add Laundry', Icon(MdiIcons.plusBox, size: 30.0), Colors.blueGrey),
              Category('All laundries', Icon(MdiIcons.washingMachine, size: 30.0), Color(0xff2979ff)),
              Category('All orders', Icon(MdiIcons.cart, size: 30.0), Color(0xff2979ff)),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Category('Pricings', Icon(MdiIcons.cashMultiple, size: 30.0), Color(0xff2979ff)),
              Category('Policy', Icon(MdiIcons.clipboard, size: 30.0), Color(0xff2979ff)),
              Category('Settings', Icon(MdiIcons.settingsBox, size: 30.0), Color(0xff2979ff)),
            ],
          )
        ],
      ),
    );
  }
}