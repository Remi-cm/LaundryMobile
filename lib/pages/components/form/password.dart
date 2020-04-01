import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final String hintText;
  final String emptyValidatorText;
  final TextEditingController controller;
  final Function onSavedFunc;
  final TextInputType keyboardType;
  final Function validator;

  const CustomPasswordField({
    Key key,
    this.hintText,
    @required this.emptyValidatorText,
    @required this.controller,
    this.onSavedFunc,
    this.keyboardType,
    this.validator
  });

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {

  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(                   
      obscureText: passwordVisible,                           
      keyboardType: this.widget.keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        hintText: this.widget.hintText,
        filled: true,
        fillColor: Color.fromRGBO(255, 255, 255, 0.8), 
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
               passwordVisible
               ? Icons.visibility
               : Icons.visibility_off,
               color: Theme.of(context).primaryColorDark,
               ),
            onPressed: () {
               // Update the state i.e. toogle the state of passwordVisible variable
               setState(() {
                   passwordVisible = !passwordVisible;
               });
             },
            ),
      ),
      validator: this.widget.validator,
      controller: widget.controller,
      onSaved: this.widget.onSavedFunc,
    );
  }
}