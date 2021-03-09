import 'package:accoola/contsant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class membersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<String> memberName = [
      'Иванов иван иванович',
      'Сергеев сергей петрович',
      'Петров сергей иванович'
    ];
    List<String> membersRank = [
      'директор',
      'Мастер производства',
      'Помощник мастера'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Блок сотрудники',
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
                  height: size.height * 0.20,
                  width: size.height * 0.18,
                  decoration: BoxDecoration(
                    color: Color(0xffF9F8F8),
                    borderRadius: BorderRadius.circular(size.width * 0.06),
                    border: Border.all(color: Color(0xffB6B6B6), width: 3),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(20, 20),
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ],
                  ),
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
                                offset: Offset(10, 15),
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.2)),
                          ],
                        ),
                        child: FittedBox(
                          child: Image(
                            image: AssetImage('assets/images/give.png'),
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        "Штат сотрудников",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.03),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: size.width * 0.08, right: size.width * 0.08),
                  height: size.height * 0.20,
                  width: size.height * 0.18,
                  decoration: BoxDecoration(
                    color: Color(0xffF9F8F8),
                    borderRadius: BorderRadius.circular(size.width * 0.06),
                    border: Border.all(
                      color: Color(0xffB6B6B6),
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(20, 20),
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ],
                  ),
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
                                offset: Offset(10, 15),
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.2)),
                          ],
                        ),
                        child: FittedBox(
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(size.width * 0.09),
                            child: Image(
                              image: AssetImage('assets/images/click.png'),
                            ),
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        "Задолженность перед  сотрудниками",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.03),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: size.height*0.32,
                  width: size.width*0.93,
                  padding: EdgeInsets.all(size.width*0.04),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(size.width*0.03),
                    border: Border.all(
                        color: Color(0xffB6B6B6),
                        width: 3
                    ),
                  ),
                  margin: EdgeInsets.only(top: size.height* 0.04),
                  child: Column(
                    children: <Widget>[
                      memberContainer(membersNames: "Иванов иван иванович",membersRanks: 'директор',),
                      memberContainer(membersNames: "Сергеев сергей петрович",membersRanks: 'Мастер производства',),
                      memberContainer(membersNames: "Петров сергей иванович ",membersRanks: 'Помощник мастера',),

                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: size.height*0.32,
                  width: size.width*0.93,
                  padding: EdgeInsets.all(size.width*0.04),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(size.width*0.03),
                    border: Border.all(
                        color: Color(0xffB6B6B6),
                        width: 3
                    ),
                  ),
                  margin: EdgeInsets.only(top: size.height* 0.04),
                  child: Column(
                    children: <Widget>[
                      memberContainer(membersNames: "Иванов иван иванович",membersRanks: 'директор',),
                      memberContainer(membersNames: "Сергеев сергей петрович",membersRanks: 'Мастер производства',),
                      memberContainer(membersNames: "Петров сергей иванович ",membersRanks: 'Помощник мастера',),

                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class memberContainer extends StatefulWidget {
  memberContainer({Key  key ,  this.membersNames , this.membersRanks }): super(key: key);
  String membersNames;
  String membersRanks;
  @override
  _memberContainerState createState() => _memberContainerState();
}

class _memberContainerState extends State<memberContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width*0.13,
            height: size.height*0.06,
            child: ClipRRect(
              child: FittedBox(
                child: Image(
                    image: AssetImage('assets/images/person.jpg'),
                ),
                fit: BoxFit.fill,
              ),borderRadius: BorderRadius.circular(2222),
            ),
          ),
          Container(
              height: size.height* 0.058,
              width: size.width*0.34,
              margin: EdgeInsets.only(left: size.width*0.05),
              child: Text(
                  widget.membersNames,
                  textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white , fontSize: size.width* 0.04),
              ),
          ),
          Container(
            height: size.height*0.09,
            width: size.width*0.3,
            child: Column(
              children: [
                Text(
                  "12.03.2021",
                  style: TextStyle(
                    fontSize: size.width*0.022,
                    color: Color(0xffCACACA),
                  ),
                ),
                Container(
                  width: size.width* 0.28,
                  child: Text(
                      widget.membersRanks,
                      style: TextStyle(
                          fontSize: size.width*0.04,
                          color: Colors.white,
                      ),
                      textAlign: TextAlign.left
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
