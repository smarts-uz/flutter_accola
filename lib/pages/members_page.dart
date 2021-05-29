import 'dart:convert';

import 'package:accoola/contsant.dart';
import 'package:accoola/repositories/111/repository.dart';
import 'package:accoola/service/models/resp122.dart';
import 'package:accoola/service/models/resp123.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:intl/intl.dart';

class MembersPage extends StatefulWidget {
  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  bool _isVisible = true;
  String title = 'Блок сотрудники';
  final _repository = Repository111();
  Resp122 resp122 = Resp122();
  Resp123 resp123 = Resp123();
  String dateNow = DateFormat('dd.MM.yyyy').format(DateTime.now());
  String dateS = DateFormat('dd.MM.yyyy').format(DateTime.now());
  String dateE = '01.10.2020';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: size.width * 0.065,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      top: size.width * 0.08, left: size.width * 0.08),
                  height: size.height * 0.21,
                  width: size.height * 0.18,
                  decoration: BoxDecoration(
                    color: Color(0xffF9F8F8),
                    borderRadius: BorderRadius.circular(size.width * 0.06),
                    border: Border.all(color: Color(0xffB6B6B6), width: 3),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isVisible = false;
                        title = 'Штат сотрудников';
                      });
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: size.width * 0.27,
                          height: size.height * 0.12,
                          margin: EdgeInsets.all(size.height * 0.02),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(size.width * 0.09),
                            color: Color(0xff5D5FEF),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 5,
                                  color: Colors.grey),
                              BoxShadow(
                                  offset: Offset(-1, 0),
                                  blurRadius: 5,
                                  color: Colors.grey),
                            ],
                          ),
                          child: CircleAvatar(
                            child: Image(
                              width: size.width * 0.2,
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/give.png'),
                            ),
                          ),
                        ),
                        Text(
                          "Штат сотрудников",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.028),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: size.width * 0.08, right: size.width * 0.08),
                  height: size.height * 0.21,
                  width: size.height * 0.18,
                  decoration: BoxDecoration(
                    color: Color(0xffF9F8F8),
                    borderRadius: BorderRadius.circular(size.width * 0.06),
                    border: Border.all(
                      color: Color(0xffB6B6B6),
                      width: 3,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isVisible = true;
                        title = "Задолженность перед  сотрудниками";
                      });
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: size.width * 0.27,
                          height: size.height * 0.12,
                          margin: EdgeInsets.all(size.height * 0.02),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(size.width * 0.09),
                            color: Color(0xff5D5FEF),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 5,
                                  color: Colors.grey),
                              BoxShadow(
                                  offset: Offset(-1, 0),
                                  blurRadius: 5,
                                  color: Colors.grey),
                            ],
                          ),
                          child: CircleAvatar(
                            child: Image(
                              width: size.width * 0.2,
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/click.png'),
                            ),
                          ),
                        ),
                        Text(
                          "Задолженность перед  сотрудниками",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.028),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Center(
                  child: FutureBuilder(
                    future: _repository.getResult(
                        login: LOGIN,
                        code: '122',
                        password: PASSWORD,
                        date: dateNow,
                        dateK: '31.03.2021',
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
                      resp122 = Resp122.fromJson(jsonDecode(snapshot.data));
                      if (resp122.data.isNotEmpty) {
                        var list = _sort(resp122);
                        return Visibility(
                          visible: (!_isVisible),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime: DateTime(2010, 3, 5),
                                      maxTime: DateTime(2023, 6, 7),
                                      theme: DatePickerTheme(
                                          headerColor: Colors.lightGreen,
                                          backgroundColor: Colors.blue,
                                          itemStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                          doneStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16)),
                                      onChanged: (date) {}, onConfirm: (date) {
                                    setState(() {
                                      dateNow = DateFormat('dd.MM.yyyy')
                                          .format(date)
                                          .toString();
                                    });
                                  },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.en);
                                },
                                child: Container(
                                  margin:
                                      EdgeInsets.only(top: size.height * 0.01),
                                  child: Text(
                                    dateNow,
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: size.width * 0.07,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Container(
                                height: size.height * 0.6,
                                width: size.width * 0.93,
                                padding: EdgeInsets.all(size.width * 0.04),
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.03),
                                  border: Border.all(
                                      color: Color(0xffB6B6B6), width: 3),
                                ),
                                margin:
                                    EdgeInsets.only(top: size.height * 0.01),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return memberContainer(
                                      membersDate: list[index].empty,
                                      membersNames: list[index].purple,
                                      membersRanks: list[index].datum,
                                    );
                                  },
                                  itemCount: list.length,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Visibility(
                          visible: (!_isVisible),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime: DateTime(2010, 3, 5),
                                      maxTime: DateTime(2023, 6, 7),
                                      theme: DatePickerTheme(
                                          headerColor: Colors.lightGreen,
                                          backgroundColor: Colors.blue,
                                          itemStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                          doneStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16)),
                                      onChanged: (date) {}, onConfirm: (date) {
                                    setState(() {
                                      dateNow = DateFormat('dd.MM.yyyy')
                                          .format(date)
                                          .toString();
                                    });
                                  },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.en);
                                },
                                child: Container(
                                  margin:
                                      EdgeInsets.only(top: size.height * 0.01),
                                  child: Text(
                                    dateNow,
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: size.width * 0.07,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Center(child: Text('nothing here :(')),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
                Center(
                  child: FutureBuilder(
                    future: _repository.getResult(
                        login: LOGIN,
                        code: '123',
                        password: PASSWORD,
                        date: dateNow,
                        dateK: dateE,
                        dateN: dateS),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                                Theme.of(context).accentColor),
                          ),
                        );
                      }
                      resp123 = Resp123.fromJson(jsonDecode(snapshot.data));
                      if (resp123.data.isNotEmpty) {
                        var list = _sort123(resp123);
                        return Visibility(
                          visible: (_isVisible),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  final List<DateTime> picked =
                                      await DateRagePicker.showDatePicker(
                                          context: context,
                                          initialFirstDate: new DateTime(2020),
                                          initialLastDate: (new DateTime.now())
                                              .add(new Duration(days: 7)),
                                          firstDate: new DateTime(2019),
                                          lastDate: new DateTime(2023));
                                  if (picked != null && picked.length == 2) {
                                    setState(() {
                                      onSearchDate(picked);
                                    });
                                  }
                                },
                                child: Container(
                                  margin:
                                      EdgeInsets.only(top: size.height * 0.01),
                                  child: Text(
                                    '$dateS - $dateE',
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: size.width * 0.07,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Container(
                                height: size.height * 0.6,
                                width: size.width * 0.93,
                                padding: EdgeInsets.all(size.width * 0.04),
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.03),
                                  border: Border.all(
                                      color: Color(0xffB6B6B6), width: 3),
                                ),
                                margin:
                                    EdgeInsets.only(top: size.height * 0.01),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return memberContainer(
                                      membersDate: list[index].empty,
                                      membersNames: list[index].datum,
                                      membersRanks: list[index].purple,
                                    );
                                  },
                                  itemCount: list.length,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Visibility(
                          visible: (_isVisible),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  final List<DateTime> picked =
                                      await DateRagePicker.showDatePicker(
                                          context: context,
                                          initialFirstDate: new DateTime(2020),
                                          initialLastDate: (new DateTime.now())
                                              .add(new Duration(days: 7)),
                                          firstDate: new DateTime(2019),
                                          lastDate: new DateTime(2023));
                                  if (picked != null && picked.length == 2) {
                                    setState(() {
                                      onSearchDate(picked);
                                    });
                                  }
                                },
                                child: Container(
                                  margin:
                                      EdgeInsets.only(top: size.height * 0.01),
                                  child: Text(
                                    '$dateS - $dateE',
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: size.width * 0.07,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Center(child: Text('nothing here :(')),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future onSearchDate(var query) async {
    print(query[0]);
    print(query[1]);
    String beginSt = query[0].toString().substring(8, 10) +
        "." +
        query[0].toString().substring(5, 7) +
        "." +
        query[0].toString().substring(0, 4);
    String endSt = query[1].toString().substring(8, 10) +
        "." +
        query[1].toString().substring(5, 7) +
        "." +
        query[1].toString().substring(0, 4);
    print('SSSSSSS' + beginSt);
    print('SSSSSSE' + endSt);
    dateS = beginSt;
    dateE = endSt;
  }
}

List _sort(Resp122 resp122) {
  var list = List<String>();
  var positions = List();
  for (int i = 0; i < resp122.data.length; i++) {
    list.add(resp122.data[i].purple);
  }
  list.sort();
  for (int i = 0; i < resp122.data.length; i++) {
    for (int j = 0; j < resp122.data.length; j++) {
      if (list[i] == resp122.data[j].purple) {
        positions.add(resp122.data[j]);
      }
    }
  }
  return positions;
}

List _sort123(Resp123 resp123) {
  var list = List<String>();
  var positions = List();
  for (int i = 0; i < resp123.data.length; i++) {
    list.add(resp123.data[i].datum);
  }
  list.sort();
  for (int i = 0; i < resp123.data.length; i++) {
    for (int j = 0; j < resp123.data.length; j++) {
      if (list[i] == resp123.data[j].datum) {
        positions.add(resp123.data[j]);
      }
    }
  }
  return positions;
}

class memberContainer extends StatefulWidget {
  memberContainer(
      {Key key, this.membersNames, this.membersRanks, this.membersDate})
      : super(key: key);
  String membersNames;
  String membersRanks;
  String membersDate;

  @override
  _memberContainerState createState() => _memberContainerState();
}

// ignore: camel_case_types
class _memberContainerState extends State<memberContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width * 0.13,
            height: size.height * 0.06,
            child: Image(
              image: AssetImage('assets/images/user.png'),
            ),
          ),
          Container(
            height: size.height * 0.058,
            width: size.width * 0.34,
            margin: EdgeInsets.only(left: size.width * 0.05),
            child: Text(
              widget.membersNames,
              textAlign: TextAlign.left,
              style:
                  TextStyle(color: Colors.white, fontSize: size.width * 0.03),
            ),
          ),
          Container(
            height: size.height * 0.09,
            width: size.width * 0.3,
            child: Column(
              children: [
                SizedBox(height: size.width * 0.03),
                Text(
                  widget.membersDate,
                  style: TextStyle(
                    fontSize: size.width * 0.03,
                    color: Color(0xffCACACA),
                  ),
                ),
                SizedBox(height: size.width * 0.01),
                Container(
                  width: size.width * 0.28,
                  child: Center(
                    child: Text(widget.membersRanks,
                        style: TextStyle(
                          fontSize: size.width * 0.035,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
