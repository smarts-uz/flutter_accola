import 'dart:convert';

import 'package:accoola/contsant.dart';
import 'package:accoola/pages/sum_page111.dart';
import 'package:accoola/pages/sum_page112.dart';
import 'package:accoola/repositories/111/repository.dart';
import 'package:accoola/service/models/resp111.dart';
import 'package:accoola/service/models/resp112.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key key, this.code}) : super(key: key);

  @override
  _SummaryPageState createState() => _SummaryPageState();
  final String code;
}

class _SummaryPageState extends State<SummaryPage> {
  final _repository = Repository111();
  double summa1 = 0;
  double summa2 = 0;
  String dateNow = DateFormat('dd.MM.yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Resp111 resp111 = Resp111();
    Resp112 resp112 = Resp112();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor.withOpacity(0.8),
        title: Text(
          'Счета',
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
                    code: '111',
                    password: PASSWORD,
                    date: dateNow,
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
                  resp111 = Resp111.fromJson(jsonDecode(snapshot.data));
                  if (resp111.data.isNotEmpty) {
                    summa1 = 0;
                    for (var i = 0; i < resp111.data.length; i++) {
                      summa1 = summa1 +
                          (double.parse(resp111.data[0].datum
                              .replaceAll(new RegExp(r"\s+"), "")
                              .replaceAll(new RegExp(','), ".")));
                    }
                    return GestureDetector(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SumPage111()),
                        );
                      },
                      child: Container(
                        width: size.width,
                        height: size.height * 0.2,
                        margin: EdgeInsets.only(
                            top: size.width * 0.1,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Расчетный счет",
                                style: TextStyle(
                                    fontSize: size.width * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '$summa1 сум',
                                style: TextStyle(
                                    fontSize: size.width * 0.055,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SumPage112()),
                        );
                      },
                      child: Container(
                        width: size.width,
                        height: size.height * 0.2,
                        margin: EdgeInsets.only(
                            top: size.width * 0.1,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Расчетный счет",
                                style: TextStyle(
                                    fontSize: size.width * 0.07,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              FutureBuilder(
                future: _repository.getResult(
                    login: LOGIN,
                    code: '112',
                    password: PASSWORD,
                    date: dateNow,
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
                  resp112 = Resp112.fromJson(jsonDecode(snapshot.data));
                  if (resp112.data.isNotEmpty) {
                    summa2 = 0;
                    for (var i = 0; i < resp112.data.length; i++) {
                      summa2 = summa2 +
                          (double.parse(resp112.data[0].datum
                              .replaceAll(new RegExp(r"\s+"), "")
                              .replaceAll(new RegExp(','), ".")));
                    }
                    return GestureDetector(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SumPage112()),
                        );
                      },
                      child: Container(
                        width: size.width,
                        height: size.height * 0.2,
                        margin: EdgeInsets.only(
                            top: size.width * 0.1,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Товары на складе",
                                style: TextStyle(
                                    fontSize: size.width * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '$summa2 сум',
                                style: TextStyle(
                                    fontSize: size.width * 0.055,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SumPage112()),
                        );
                      },
                      child: Container(
                        width: size.width,
                        height: size.height * 0.2,
                        margin: EdgeInsets.only(
                            left: size.width * 0.05, right: size.width * 0.05),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Валютный счет",
                                style: TextStyle(
                                    fontSize: size.width * 0.07,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// resp111 = Resp111.fromJson(jsonDecode(snapshot.data));
// future: _repository.getResult(
// login: LOGIN,
// code: widget.code,
// password: PASSWORD,
// date: '09.05.2020',
// dateK: '31.03.2021',
// dateN: '01.11.2020'),

// if (!snapshot.hasData) {
// return Center(
// child: CircularProgressIndicator(
// valueColor:
// AlwaysStoppedAnimation(Theme.of(context).accentColor),
// ),
// );
// }
// resp111 = Resp111.fromJson(jsonDecode(snapshot.data));
