import 'package:accoola/contsant.dart';
import 'package:accoola/pages/stroge_page.dart';
import 'package:accoola/pages/sum_page.dart';
import 'package:accoola/pages/sum_page117.dart';
import 'package:accoola/pages/sum_page121.dart';
import 'package:accoola/pages/summary_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'credits.dart';
import 'members_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Text(
              USERNAME,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: size.width * 0.08,
                  fontWeight: FontWeight.bold),
            ),
            top: size.height * 0.15,
            left: 0.0,
            right: 0.0,
          ),
          Positioned(
            top: 0.0,
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CardButton(
                        imageUrl: 'assets/icons/ic_casheloc.png',
                        title: 'Счета',
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SummaryPage(code: '111')),
                          );
                        }),
                    CardButton(
                        imageUrl: 'assets/icons/ic_debitor.png',
                        title: 'Кредиторы',
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SumPage119()),
                          );
                        }),
                    Container(
                      margin: EdgeInsets.only(top: size.width * 0.04),
                      width: size.width / 3.5,
                      height: size.width / 3.5,
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.02, right: size.width * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CardButton(
                          imageUrl: 'assets/icons/ic_osnovno.png',
                          title: 'Основные средства',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SumPage121()),
                            );
                          }),
                      CardButton(
                          imageUrl: 'assets/icons/ic_creditor.png',
                          title: 'Займы Кредиты',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreditsPage()),
                            );
                          }),
                      CardButton(
                          imageUrl: 'assets/icons/ic_debitor.png',
                          title: 'Дебиторы',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SumPage117()),
                            );
                          }),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CardButton(
                        imageUrl: 'assets/icons/ic_cotrudniki.png',
                        title: 'Сотрудники',
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MembersPage()),
                          );
                        }),
                    CardButton(
                        imageUrl: 'assets/icons/ic_sklad.png',
                        title: 'Склад',
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StoragePage()),
                          );
                        }),
                    Container(
                      margin: EdgeInsets.only(top: size.width * 0.04),
                      width: size.width / 3.5,
                      height: size.width / 3.5,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  const CardButton({
    Key key,
    this.imageUrl,
    this.title,
    this.press,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.only(top: size.width * 0.03),
        margin: EdgeInsets.only(top: size.width * 0.03),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.width * 0.05),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 10,
              color: Colors.black.withOpacity(0.07),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image(
                image: AssetImage(imageUrl),
                width: size.width * 0.2,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: size.width * 0.01),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: kPrimaryColor),
                ),
              ),
            ),
          ],
        ),
        width: size.width / 3.5,
        height: size.width / 3.5,
      ),
    );
  }
}
