import 'package:accoola/pages/home/home_page.dart';
import 'package:accoola/service/models/auth/login_request.dart';
import 'package:accoola/service/models/auth/login_response.dart';
import 'package:accoola/service/service/users/cubit/users_cubit.dart';
import 'package:accoola/service/service/users/users_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _login = new TextEditingController();
  final TextEditingController _password = new TextEditingController();

  final UsersRepository usersRepository = UsersRepository();
  UsersCubit usersCubit;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _login.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: size.height * 0.2),
              width: size.width,
              child: Image(
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  top: size.height * 0.06),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Login',
                ),
                controller: _login,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  top: size.height * 0.07),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
                controller: _password,
              ),
            ),
            GestureDetector(
              onTap: (){
              },
              child: Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                    top: size.height * 0.07),
                width: size.width,
                height: size.height * 0.08,
                decoration: BoxDecoration(
                    color: Color(0xFF85bb65),
                    borderRadius: BorderRadius.circular(size.width * 0.02)),
                child: Center(
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.06,
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
