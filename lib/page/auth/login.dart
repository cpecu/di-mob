import 'package:flutter/material.dart';
import 'package:dimo/comp/input.dart';
import 'package:dimo/comp/button.dart';
import 'forms.dart';
import 'tab.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String active = "login";

  void setActive(String val) {
    setState(() {
      active = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  ClipRect(
                    child: Transform.scale(
                      scale: 1.5,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    child: Container(
                      constraints: BoxConstraints(minWidth: 200.0),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.18,
                      child: Text(
                        "Welcome back",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      color: Colors.deepPurpleAccent,
                    ),
                  )
                ],
              ),
              AuthTab(
                active: active,
                setActive: setActive,
              ),
              SizedBox(
                height: 40.0,
              ),
              AnimatedCrossFade(
                firstChild: LoginForm(),
                secondChild: RegisterForm(),
                crossFadeState: active == "register"
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 300),
              ),
              SizedBox(
                height: 20.0,
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "Terms & Conditions",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}