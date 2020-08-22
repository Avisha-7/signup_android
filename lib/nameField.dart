import 'package:flutter/material.dart';
import './models/user.dart';

class nameField extends StatelessWidget {
  final _user = User();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_circle,
              color: Colors.blue,
            ),
            labelText: 'Name'),
        validator: (String value){
          if(value.isEmpty){
            return 'Name is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _user.name = value;
        },
      ),
    );;
  }
}
