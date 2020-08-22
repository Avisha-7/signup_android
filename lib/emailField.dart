import 'package:flutter/material.dart';
import './models/user.dart';

class emailField extends StatelessWidget {
  final _user = User();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: Colors.blue,
            ),
            labelText: 'E-mail'),
        validator: (String value){
          if(value.isEmpty){
            return 'Email Address is Required';
          }
          if(!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(value)){
            return 'Please enter a valid email address';
          }
          return null;
        },
        onSaved: (String value) {
          _user.email = value;
        },
      ),
    );;
  }
}
