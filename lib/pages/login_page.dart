import 'package:accoola/application/bloc/login_bloc.dart';
import 'package:accoola/service/models/loginrequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (_, state) {
          return LoginForm(
            size: size,
          );
        },
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
                        context.bloc<LoginBloc>().add(LoginPressed(
                            request: LoginRequest(
                                auth: AuthReq(
                                  login: _login.text,
                                  password: _password.text,
                                ))));
                        _loginProcess(state);
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

  _loginProcess(LoginState state) {
    if (state is LoginLoaded) {
      Navigator.of(context).pushNamed('/home');
    } else if (state is LoginFailed) {
      print('STATE ==== LoginFailed');
    }
  }
}
