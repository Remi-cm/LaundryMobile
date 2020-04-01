import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:laundrymobile/pages/components/form/password.dart';
import 'package:laundrymobile/providers/profile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'components/form/button.dart';
import 'components/form/textField.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  final _loginFormKey = GlobalKey<FormState>();
  TextEditingController _usermailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  String _userMail = "fgdfgdfg";
  String _userPassword;
  bool isChecked = true;
  bool _buttonState = true;
  String token1 = "token";
  
  initState(){

   super.initState();
  }
  login (BuildContext context) async {
    final profile = Provider.of<UserProfileProvider>(context);
    if (_loginFormKey.currentState.validate()) {
      setState(() {
      _buttonState = false;
    });
      final storage = new FlutterSecureStorage();
      Dio dio = new Dio();
      FormData formData = new FormData.fromMap({
        "email": _usermailController.text,
        "password": _passwordController.text,
      });
    try {
    Response response = await dio.post("http://laundry-api.herokuapp.com/api/auth/jwt/create", data: formData);

    if(response.statusCode == 200){
        print("gdgdfgdfg");
        print(response.data.toString());
        String token = response.data["access"].toString();
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
    if(e.response != null) {
      if(e.response.statusCode == 400){
        print("gdgdfgdfg");
        //print(e.response.data.toString());
        setState(() {
          token1 = e.response.data.toString();
        });
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
    //print(response.data.toString());

    }
    setState(() {
      _buttonState = true;
    });
    //Navigator.pushNamed(context, '/intro');
  }

  @override
  Widget build(BuildContext context) {
    final wv = MediaQuery.of(context).size.width/100;
    final hv = MediaQuery.of(context).size.height/100;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/pressing2.png'), fit: BoxFit.cover))),
          Container(decoration: BoxDecoration(color: Color(0xff000000).withOpacity(0.7)),),
          Container(
            child: ListView(
              children: <Widget>[
              SizedBox(height: hv*15),
              Column(

                children: <Widget>[
                  Hero(
                    tag: "avatar",
                    child: CircleAvatar(
                      child: Image.asset('assets/images/logopng.png'),
                      maxRadius: 60.0,
                      backgroundColor: Color(0xffe0f7fa),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Form(key: _loginFormKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          
                          CustomTextField(
                            hintText: 'Email',
                            icon: Icons.mail,
                            controller: _usermailController,
                            onSavedFunc: (value) => _userMail = value,
                            emptyValidatorText: 'Enter email',
                            keyboardType: TextInputType.emailAddress,
                            validator: (str) => str.isEmpty ? 'Email Field cannot be empty' : null,
                            onChangedFunc:  (str) {
                              this._userMail = str;
                            },
                          ),
                          
                          SizedBox(height: 15.0),
                          
                          CustomPasswordField(
                            hintText: 'Password',
                            keyboardType: TextInputType.text,
                            controller: _passwordController,
                            onSavedFunc: (value) => _userPassword = value,
                            emptyValidatorText: 'Enter password',
                            validator: (str) => str.isEmpty ? 'Password Field cannot be empty' : null,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value;
                                    });
                                  },
                                ),
                                Text("Remember me", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.0))
                              ],),
                              Text("Forgot Password?", style: TextStyle(color: Color(0xff2979ff), fontWeight: FontWeight.w500, fontSize: 14.0),)
                            ],
                          ),
                          _buttonState ? CustomButton(color: Color(0xff2979ff), text: 'Sign In', textColor: Colors.white, 
                          onPressed: () async {login(context);},
                          ): CircularProgressIndicator(),
                          SizedBox(height: 20.0),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                            Text("Not registered ?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.0)),
                            InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, '/register');
                              },
                              child: Text(" Create an account", style: TextStyle(color: Color(0xff2979ff), fontWeight: FontWeight.w400, fontSize: 14.0),))
                          ],)
                        ],
                      ),
                    ),)
                ],
              ),
              
            ],)
          ),
        ],
        
      ),
    );
  }
}