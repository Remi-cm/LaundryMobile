import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String emptyValidatorText;
  final TextEditingController controller;
  final Function onSavedFunc;
  final TextInputType keyboardType;
  final IconData icon;
  final Function validator;
  final Function onChangedFunc;

  const CustomTextField({
    Key key,
    this.hintText,
    @required this.emptyValidatorText,
    @required this.controller,
    this.onSavedFunc,
    this.keyboardType,
    this.icon,
    this.validator,
    this.onChangedFunc
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(                                              
      keyboardType: this.keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: this.hintText,
        filled: true,
        fillColor: Color.fromRGBO(255, 255, 255, 0.8), 
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        )
      ),
      validator: this.validator,
      controller: controller,
      onChanged: this.onChangedFunc,
      onSaved: this.onSavedFunc,
    );
  }
}