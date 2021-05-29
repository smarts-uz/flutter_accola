import 'dart:convert';
import 'dart:ffi';

import 'package:accoola/repositories/111/repository.dart';
import 'package:accoola/service/models/resp116.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../contsant.dart';

class SumPage116 extends StatefulWidget {
  const SumPage116({Key key}) : super(key: key);

  @override
  _SumPageState createState() => _SumPageState();
}

class _SumPageState extends State<SumPage116> {
  Resp116 resp112 = Resp116();
  String dateNow = DateFormat('dd.MM.yyyy').format(DateTime.now());
  final _repository = Repository111();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double summa = 0;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: kPrimaryColor.withOpacity(0.8),
        title: Text(
          'Сырье и материалы',
          style: TextStyle(fontSize: size.width * 0.065),
        ),
        leading: BackButton(onPressed: () => Navigator.of(context).pop()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
                        doneStyle:
                            TextStyle(color: Colors.white, fontSize: 16)),
                    onChanged: (date) {
                  print('{RESSED}' + date.timeZoneOffset.inHours.toString());
                }, onConfirm: (date) {
                  setState(() {
                    dateNow = DateFormat('dd.MM.yyyy').format(date).toString();
                  });
                }, currentTime: DateTime.now(), locale: LocaleType.en);
              },
              child: Container(
                margin: EdgeInsets.only(top: size.height * 0.01),
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
            FutureBuilder(
              future: _repository.getResult(
                  login: LOGIN,
                  code: '116',
                  password: PASSWORD,
                  date: dateNow,
                  dateK: '31.03.2021',
                  dateN: '01.11.2020'),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation(Theme.of(context).accentColor),
                    ),
                  );
                }
                resp112 = Resp116.fromJson(jsonDecode(snapshot.data));

                if (resp112.data.isNotEmpty) {
                  summa = 0;

                  for (var i = 0; i < resp112.data.length; i++) {
                    summa = summa +
                        (double.parse(resp112.data[0].datum
                            .replaceAll(new RegExp(r"\s+"), "")
                            .replaceAll(new RegExp(','), ".")));
                  }
                  return Column(
                    children: [
                      Container(
                        width: size.width,
                        margin: EdgeInsets.only(
                            top: size.height * 0.02,
                            left: size.width * 0.05,
                            right: size.width * 0.05,
                            bottom: size.height * 0.02),
                        padding: EdgeInsets.only(
                            top: size.width * 0.1,
                            left: size.width * 0.055,
                            right: size.width * 0.055,
                            bottom: size.width * 0.06),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.04),
                          color: Theme.of(context).accentColor,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 3,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        child: CardSum(
                          summ: summa.toString(),
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      Container(
                        width: size.width,
                        height: size.height * 0.05,
                        margin: EdgeInsets.only(top: size.width * 0.03),
                        padding: EdgeInsets.all(size.width * 0.03),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 3,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: size.width * 0.05),
                              child: Text(
                                'Сырье',
                                style: TextStyle(
                                  fontSize: size.width * 0.025,
                                  color: kPrimaryColor,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Text(
                              'КоличествоОстаток',
                              style: TextStyle(
                                fontSize: size.width * 0.025,
                                color: kPrimaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: size.width * 0.05),
                              child: Text(
                                'СуммаОстаток',
                                style: TextStyle(
                                    fontSize: size.width * 0.02,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFD413B)),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return SubButton(
                            title: resp112.data[index].purple,
                            count: resp112.data[index].empty,
                            sum: resp112.data[index].datum,
                          );
                        },
                        itemCount: resp112.data.length,
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Container(
                        width: size.width,
                        margin: EdgeInsets.only(
                            top: size.height * 0.02,
                            left: size.width * 0.05,
                            right: size.width * 0.05,
                            bottom: size.height * 0.02),
                        padding: EdgeInsets.only(
                            top: size.width * 0.1,
                            left: size.width * 0.055,
                            right: size.width * 0.055,
                            bottom: size.width * 0.06),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.04),
                          color: Theme.of(context).accentColor,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 3,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        child: CardSum(
                          summ: '0.00',
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Center(child: Text('nothing here :(')),
                      ),
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class CardSum extends StatelessWidget {
  final Color color;
  final String summ;

  const CardSum({
    Key key,
    @required this.color,
    this.summ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('OBJECT' + summ.toString());

    return Row(
      children: <Widget>[
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Итого\n',
                style: Theme.of(context).textTheme.headline4.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.1),
              ),
              TextSpan(
                text: "$summ UZS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SubButton extends StatefulWidget {
  SubButton({Key key, this.title, this.count, this.sum}) : super(key: key);
  String title;
  String count;
  String sum;

  @override
  _SubButtonState createState() => _SubButtonState();
}

class _SubButtonState extends State<SubButton> {
  @override
  Widget build(BuildContext context) {
    String sum = widget.sum.toString();
    String count = widget.count.toString();
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.1,
      margin: EdgeInsets.only(
          top: size.width * 0.03,
          left: size.width * 0.05,
          right: size.width * 0.05),
      padding: EdgeInsets.all(size.width * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 0.04),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 3,
            color: Colors.grey,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: size.width * 0.025,
              color: kPrimaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            count,
            style: TextStyle(
              fontSize: size.width * 0.02,
              color: kPrimaryColor,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            sum,
            style: TextStyle(
                fontSize: size.width * 0.02,
                fontWeight: FontWeight.bold,
                color: Color(0xffFD413B)),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
