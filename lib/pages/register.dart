import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:laundrymobile/providers/profile.dart';
import 'package:provider/provider.dart';
import 'package:laundrymobile/pages/components/form/password.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'components/form/button.dart';
import 'components/form/textField.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _registerFormKey = GlobalKey<FormState>();
  TextEditingController _usermailController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  String _userMail;
  String adminToken;
  bool isChecked = true;
  bool _buttonState = true;
  register (BuildContext context) async {
    
    final profile = Provider.of<UserProfileProvider>(context);
    if (_registerFormKey.currentState.validate()) {
      setState(() {
      _buttonState = false;
      });
      String adminToken = await getToken();
      
      Dio dio = new Dio();
      final storage = new FlutterSecureStorage();
      
        //String tok = await getToken();
        
      
      FormData formData = new FormData.fromMap({
        "phone": "0",
        "name": _usernameController.text,
        "email": _usermailController.text,
        "password": _passwordController.text,
        "sex": "Male",
        "address": "None",
        "gpsLat": 0.0,
        "gpsLng": 0.0,
        "avatarUrl": "https://firebasestorage.googleapis.com/v0/b/pressing-18e11.appspot.com/o/avatarPics%2Favatar_man.jpg?alt=media&token=3ee09a5b-7228-4c28-b3b9-ea214c499552",
        "country": "Cameroon",
        "town": "None",
        "is_client": 1,
      });

      try {
        /*dio.options.headers['content-Type'] = 'application/json';
        dio.options.headers["Authorization"] = "Bearer $adminToken";
        Response response = await dio.post("https://laundry-api.herokuapp.com/api/clients/", data: formData);*/
        final Map<String, dynamic> registerData = {
          "phone": "0",
          "name": _usernameController.text,
          "email": _usermailController.text,
          "password": _passwordController.text,
          "sex": "Male",
          "address": "None",
          "gpsLat": 0.0,
          "gpsLng": 0.0,
          "avatarUrl": "https://firebasestorage.googleapis.com/v0/b/pressing-18e11.appspot.com/o/avatarPics%2Favatar_man.jpg?alt=media&token=3ee09a5b-7228-4c28-b3b9-ea214c499552",
          "country": "Cameroon",
          "town": "None",
          "is_client": 1
        };
        
        var response = await http.post(
          'https://laundry-api.herokuapp.com/api/clients/',
          body: json.encode(registerData),
          headers: {HttpHeaders.authorizationHeader: "Bearer $adminToken", HttpHeaders.contentTypeHeader: "application/json"}
        );
        print(response.statusCode);
        print(response.headers);
        print(response.body);
        if(response.statusCode == 201){
          String token = await getNewToken(_usermailController.text, _passwordController.text);
            print("successss");
            print(response.body.toString());
            await storage.write(key: "token", value: token);
            dio.options.headers['content-Type'] = 'application/json';
            dio.options.headers["Authorization"] = "Bearer $token";
            Response user = await dio.get("http://laundry-api.herokuapp.com/api/auth/users/me");
            await storage.write(key: "name", value: user.data["name"]);
            await storage.write(key: "email", value: user.data["email"]);
            await storage.write(key: "id", value: user.data["id"].toString());
            profile.updateName(user.data["name"]);
            profile.updateEmail(user.data["email"]);
            profile.updateToken(user.data["token"]);
            profile.updateId(user.data["id"]);
            Navigator.pushNamed(context, '/home');
            /*var storage = FlutterSecureStorage();
            String token = response.data;
            storage.write(key: "token", value: token);
            
            print(token);*/
        }
    } on DioError catch(e) {
      print(e.response.statusCode);
      print(e.response.statusMessage);
      print(e.response.data);
      print(e.response.headers);
      print(e.request);
      print(e.message);
        if(e.response != null) {
          if(e.response.statusCode == 400){
            print("gdgdfgdfg");
            
            ///SharedPreferences prefs = await SharedPreferences.getInstance();
            String token = e.response.data["access"];
            print(token);
            //await prefs.setString('token', token);
          }
          else{
            print("gdgdf00");
            print(e.response.data);
            print(e.response.statusCode);
          }
            
        } else{
            print(e.request);
            print(e.message);
        }
    }
      print(_usermailController.text);
      print(_usernameController.text);
      print(_passwordController.text);
      print(adminToken);
      setState(() {
      _buttonState = true;
      });
    }
  }

  Future<String> getToken () async {
    Dio dio = new Dio();
    FormData formData = new FormData.fromMap({
      "email": "remidongmophp@gmail.com",
      "password": "root"
    });

    Response response = await dio.post("https://laundry-api.herokuapp.com/api/auth/jwt/create/", data: formData);

    String tok = response.data["access"];
    adminToken = tok;
    return tok;
  }

  Future<String> getNewToken (String email, String password) async {
    Dio dio = new Dio();
    FormData formData = new FormData.fromMap({
      "email": email,
      "password": password,
    });

    Response response = await dio.post("https://laundry-api.herokuapp.com/api/auth/jwt/create/", data: formData);

    return response.data["access"];
  }

  @override
  initState(){
    getToken();
    super.initState();
  }
  Widget build(BuildContext context) {
    final wv = MediaQuery.of(context).size.width/100;
    final hv = MediaQuery.of(context).size.height/100;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/pressing2.png'), fit: BoxFit.cover))),
          Container(decoration: BoxDecoration(color: Color(0xff000000).withOpacity(0.7)),),
          Container(
            child: ListView(children: <Widget>[
              SizedBox(height: hv*15),
              Hero(
                tag: "avatar",
                child: CircleAvatar(
                  child: Image.asset('assets/images/logopng.png'),
                  maxRadius: 60.0,
                  backgroundColor: Color(0xffe0f7fa),
                ),
              ),
              SizedBox(height: 30.0),
              Form(key: _registerFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      
                      CustomTextField(
                        hintText: 'Name',
                        icon: Icons.person,
                        controller: _usernameController,
                        onSavedFunc: (value) => _userMail = value,
                        emptyValidatorText: 'Enter Name',
                        keyboardType: TextInputType.text,
                        validator: (str) => str.isEmpty ? 'Name Field cannot be empty' : null,
                      ),
                      
                      SizedBox(height: 15.0),
                      CustomTextField(
                        hintText: 'Email',
                        icon: Icons.mail,
                        controller: _usermailController,
                        onSavedFunc: (value) => _userMail = value,
                        emptyValidatorText: 'Enter email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (str) => str.isEmpty ? 'Email Field cannot be empty' : null,
                      ),
                      
                      SizedBox(height: 15.0),
                      
                      CustomPasswordField(
                        hintText: 'Password',
                        keyboardType: TextInputType.text,
                        controller: _passwordController,
                        onSavedFunc: (value) => _userMail = value,
                        emptyValidatorText: 'Enter password',
                        validator: (str) => str.isEmpty ? 'Password Field cannot be empty' : null,
                      ),
                      SizedBox(height: 15.0),
                      
                      _buttonState ? 
                      CustomButton(color: Color(0xff2979ff), text: 'Sign In', textColor: Colors.white, onPressed: () async {register(context);},)
                      : CircularProgressIndicator(),
                      SizedBox(height: 20.0),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Text("Already have an account ?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.0)),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text(" Sign In", style: TextStyle(color: Color(0xff2979ff), fontWeight: FontWeight.w400, fontSize: 14.0),))
                      ],)
                    ],
                  ),
                ),)
            ],)
          ),
        ],
        
      ),
    );
  }
}