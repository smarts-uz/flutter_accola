import 'package:accoola/application/bloc/login_bloc.dart';
import 'package:accoola/pages/home_page.dart';
import 'package:accoola/service/models/loginrequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../contsant.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _login = new TextEditingController();
  final TextEditingController _password = new TextEditingController();

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
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (_, state) {
          _loginProcess(state, context);
          return state is LoginLoading ||
                  state is LoginLoaded ||
                  state is Loginned
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : LoginForm(
                  size: size,
                );
        },
      ),
    );
  }

  _loginProcess(LoginState state, var context) async {
    if (state is LoginLoaded) {


      await Future.delayed(const Duration(milliseconds: 500), () {})
          .then((value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      });
    } else if (state is LoginFailed) {
      print('STATE ==== LoginFailed');
      // _showToast(context);
    }
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: const Text('Kirishda xatolik!'),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
    @required this.size,
  }) : super(key: key);
  final Size size;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _login = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
            child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: widget.size.height * 0.2),
          width: widget.size.width,
          child: Image(
            image: AssetImage('assets/images/logo.png'),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: widget.size.width * 0.05,
              right: widget.size.width * 0.05,
              top: widget.size.height * 0.06),
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
              left: widget.size.width * 0.05,
              right: widget.size.width * 0.05,
              top: widget.size.height * 0.02),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
            ),
            controller: _password,
          ),
        ),
        BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                if (_login.text.isNotEmpty && _password.text.isNotEmpty) {
                  LOGIN = _login.text;
                  PASSWORD = _password.text;
                  print('DATA PRINTER LOGIN PAGE =${LOGIN}+ ${PASSWORD}');
                  print('DATA PRINTER LOGIN PAGE =${_login.text}+ ${_password.text}');
                  context.bloc<LoginBloc>().add(LoginPressed(
                      request: LoginRequest(
                          auth: AuthReq(
                              login: _login.text, password: _password.text))));
                } else {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Text('Maydonlarni to`ldiring!'),
                      duration: Duration(milliseconds: 500),
                    ),
                  );
                }
              },
              child: Container(
                margin: EdgeInsets.only(
                    left: widget.size.width * 0.05,
                    right: widget.size.width * 0.05,
                    top: widget.size.height * 0.07),
                width: widget.size.width,
                height: widget.size.height * 0.08,
                decoration: BoxDecoration(
                    color: Color(0xFF85bb65),
                    borderRadius:
                        BorderRadius.circular(widget.size.width * 0.02)),
                child: Center(
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: widget.size.width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    )));
  }
}
