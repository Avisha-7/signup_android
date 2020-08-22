import 'package:flutter/material.dart';
import 'package:ui_tut/Animation/FadeAnimation.dart';
import './models/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'emailField.dart';
import 'nameField.dart';
import 'phoneNumberField.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _user = User();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Text(
            'SIGN UP',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 25,
//              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPassword(){
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.blue,
          ),
        ),
        validator: (String value){
          if(value.isEmpty){
            return 'Password is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _user.password = value;
        },
      ),
    );
  }

  Widget _buildRememberSwitch() {
    return Padding(
      padding: EdgeInsets.only(right: 5, left: 120),
      child: SwitchListTile(
        title: Text('Remember Me',
            style: TextStyle(
            fontSize: MediaQuery.of(context).size.height /60,
        ),
      ),
      value: _user.remember,
      onChanged: (bool value) =>
      setState(() => _user.remember = value),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.2* (MediaQuery.of(context).size.height / 20),
          width: 4 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(top: 40, bottom: 30),
          child: RaisedButton(
            elevation: 6.0,
            color: Colors.blue[500],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: () {
              if(!_formKey.currentState.validate()){
                return;
              }
              _formKey.currentState.save();
              print(_user.name);
              print(_user.email);
              print(_user.phoneNumber);
              print(_user.remember);
            },
            child: Text(
              "Register",
             style: GoogleFonts.openSans(fontSize: 21, color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child:FadeAnimation(1, Container(
            height: MediaQuery.of(context).size.height * 0.687,
            width: MediaQuery.of(context).size.width * 0.82,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  nameField(),
                  emailField(),
                  phoneNumberField(),
                  _buildPassword(),
                  _buildSignUpButton(),
                  _buildRememberSwitch(),
                ],
              ),
            ),
          )),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Color gradientStart = Colors.blue[600];
    Color gradientEnd = Colors.lightBlueAccent[100];
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xfff2f3f7),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [gradientStart, gradientEnd],
                      begin: FractionalOffset(0.5, 0.0),
                      end: FractionalOffset(0.0, 0.5),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildLogo(),
                _buildContainer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}



