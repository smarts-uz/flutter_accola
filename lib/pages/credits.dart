import 'dart:convert';

import 'package:accoola/contsant.dart';
import 'package:accoola/pages/sum_page125.dart';
import 'package:accoola/pages/sum_page126.dart';
import 'package:accoola/repositories/111/repository.dart';
import 'package:accoola/service/models/resp124.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreditsPage extends StatefulWidget {
  @override
  _CreditsPageState createState() => _CreditsPageState();
}

class _CreditsPageState extends State<CreditsPage> {
  final _repository = Repository111();

  @override
  Widget build(BuildContext context) {
    String dateNow = DateFormat('dd.MM.yyyy').format(DateTime.now());

    Resp124 resp113 = Resp124();
    Resp124 resp114 = Resp124();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor.withOpacity(0.8),
        title: Text(
          'Займы Кредиты',
          style: TextStyle(fontSize: size.width * 0.065),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FutureBuilder(
                  future: _repository.getResult(
                      login: LOGIN,
                      code: '124',
                      password: PASSWORD,
                      date: dateNow,
                      dateK: '09.03.2020',
                      dateN: '09.03.2020'),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                              Theme.of(context).accentColor),
                        ),
                      );
                    }
                    resp113 = Resp124.fromJson(jsonDecode(snapshot.data));

                    if (resp113.data != null) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SumPage125()),
                          );
                        },
                        child: Container(
                          width: size.width,
                          height: size.height * 0.2,
                          margin: EdgeInsets.only(
                              left: size.width * 0.05,
                              right: size.width * 0.05),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(size.width * 0.04),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 5,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(height: 15.0),
                                Text(
                                  "Займы Полученные",
                                  style: TextStyle(
                                      fontSize: size.width * 0.07,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 15.0),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SumPage125()),
                          );
                        },
                        child: Container(
                          width: size.width,
                          height: size.height * 0.2,
                          margin: EdgeInsets.only(
                              left: size.width * 0.05,
                              right: size.width * 0.05),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(size.width * 0.04),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 5,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "Займы Полученные",
                              style: TextStyle(
                                  fontSize: size.width * 0.07,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    }
                  }),
              SizedBox(
                height: 20.0,
              ),
              FutureBuilder(
                  future: _repository.getResult(
                      login: LOGIN,
                      code: '125',
                      password: PASSWORD,
                      date: '09.05.2020',
                      dateK: '31.03.2021',
                      dateN: '01.11.2020'),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                              Theme.of(context).accentColor),
                        ),
                      );
                    }
                    resp114 = Resp124.fromJson(jsonDecode(snapshot.data));
                    if (resp114.data != null) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SumPage126()),
                          );
                        },
                        child: Container(
                          width: size.width,
                          height: size.height * 0.2,
                          margin: EdgeInsets.only(
                              left: size.width * 0.05,
                              right: size.width * 0.05),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(size.width * 0.04),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 5,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(height: 15.0),
                                Text(
                                  "Займы Выданные",
                                  style: TextStyle(
                                      fontSize: size.width * 0.07,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 15.0),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SumPage126()),
                          );
                        },
                        child: Container(
                          width: size.width,
                          height: size.height * 0.2,
                          margin: EdgeInsets.only(
                              left: size.width * 0.05,
                              right: size.width * 0.05),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(size.width * 0.04),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 5,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  "Сырье и материалы",
                                  style: TextStyle(
                                      fontSize: size.width * 0.07,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
