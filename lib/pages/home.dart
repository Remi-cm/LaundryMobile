import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:laundrymobile/pages/components/carousel.dart';
import 'package:laundrymobile/pages/components/horizontalList.dart';
import 'package:laundrymobile/providers/profile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'components/menu.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String token, name, email, id;
  getToken () async {
    final storage = new FlutterSecureStorage();
    String token0 = await storage.read(key: "token");
    String name0 = await storage.read(key: "name");
    String email0 = await storage.read(key: "email");
    String id0 = await storage.read(key: "id");
    setState(() {
      token = token0;
      name = name0;
      email = email0;
      id = id0;
    });
    print(name0);
  }
  @override
  initState() {
    getToken();
    super.initState();
  }

  Widget build(BuildContext context) {
    final profile = Provider.of<UserProfileProvider>(context);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Carosel(),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text("Menu", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
          ),
          SizedBox(height: 5.0),
          Menu(),
          SizedBox(height: 10.0),
          HorizontalList(),
         /* Center(
            child: Text("\n\n\n token: $token \n\n\n id: $id \n\n\n\n name: ${profile.getName} \n\n\n email: $email \n"),

          ),
          Text(profile.getName)*/
          SizedBox(height: 10.0),
        ],
      ),
      appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(top:8.0, bottom:8.0),
              child: Text("ECO Pressing SA"),
            ),
            backgroundColor: Color(0xff2979ff),
            actions: <Widget>[
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.notifications, size: 30.0),
              )
            ],
            actionsIconTheme: IconThemeData(color: Colors.white,size: 30.0),
          ),
          drawer: Drawer(
            child:  ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Color(0xff2979ff)),
                    accountName: Text(profile.getName, textAlign: TextAlign.center,),
                    accountEmail: Text(profile.getEmail),
                    currentAccountPicture: InkWell(
                      child: CircleAvatar(child: Container(decoration: BoxDecoration(shape: BoxShape.circle,image: DecorationImage(image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/pressing-18e11.appspot.com/o/avatarPics%2Favatar_man.jpg?alt=media&token=3ee09a5b-7228-4c28-b3b9-ea214c499552'), fit: BoxFit.cover),)))),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed("editProfile");
                      //FirebaseAuth.instance.signOut();
                    },
                    child: ListTile(
                      leading: Icon(MdiIcons.plusBox),
                      title: Text('New Laundry'),
                    ),),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed("editProfile");
                      //FirebaseAuth.instance.signOut();
                    },
                    child: ListTile(
                      leading: Icon(MdiIcons.tshirtV),
                      title: Text('All Laundries'),
                    ),),
                    InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed("editProfile");
                      //FirebaseAuth.instance.signOut();
                    },
                    child: ListTile(
                      leading: Icon(MdiIcons.cart),
                      title: Text('All orders'),
                    ),),
                    
                    
                    InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed("editProfile");
                      //FirebaseAuth.instance.signOut();
                    },
                    child: ListTile(
                      leading: Icon(MdiIcons.contactPhone),
                      title: Text('Contact service'),
                    ),),
                    InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed("editProfile");
                      //FirebaseAuth.instance.signOut();
                    },
                    child: ListTile(
                      leading: Icon(MdiIcons.accountEdit),
                      title: Text('Edit Profile'),
                    ),),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, "login");
                      //FirebaseAuth.instance.signOut();
                    },
                    child: ListTile(
                      leading: Icon(MdiIcons.logout),
                      title: Text('LogOut'),
                    ),)
                ],
              )
          ),
    );
  }
}