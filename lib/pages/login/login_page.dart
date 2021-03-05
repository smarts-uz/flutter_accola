import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: size.height*0.2),
              width: size.width,
              child: Image(
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: size.width*0.05,right: size.width*0.05, top: size.height*0.06),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    hintText: 'Login',
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: size.width*0.05,right: size.width*0.05, top: size.height*0.07),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: size.width*0.05, right: size.width*0.05,top: size.height*0.07),
              width: size.width,
              height: size.height*0.08,
              decoration: BoxDecoration(
                color: Color(0xFF85bb65),
                borderRadius: BorderRadius.circular(size.width*0.02)
              ),
              child: GestureDetector(
                onTap: (){

                },
                child: Center(
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width*0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
