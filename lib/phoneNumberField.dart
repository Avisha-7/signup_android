import 'package:flutter/material.dart';
import './models/user.dart';

class phoneNumberField extends StatelessWidget {
  final _user = User();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.local_phone,
              color: Colors.blue,
            ),

            labelText: 'Phone Number'),
        validator: (String value){
          if(value.isEmpty){
            return 'Phone Number is Required';
          }
          if(!RegExp(r"^(?:[+0]9)?[0-9]{10}$").hasMatch(value)){
            return 'Please enter a valid phone number';
          }
          return null;
        },
        onSaved: (String value) {
          _user.phoneNumber = value;
        },
      ),
    );;
  }
}
