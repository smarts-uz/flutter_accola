import 'package:accoola/contsant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MembersPage extends StatelessWidget {
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
                  height: size.height * 0.21,
                  width: size.height * 0.18,
                  decoration: BoxDecoration(
                    color: Color(0xffF9F8F8),
                    borderRadius: BorderRadius.circular(size.width * 0.06),
                    border: Border.all(color: Color(0xffB6B6B6), width: 3),
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
              ],
            ),
            Column(
              children: [
                Container(
                  height: size.height * 0.32,
                  width: size.width * 0.93,
                  padding: EdgeInsets.all(size.width * 0.04),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(size.width * 0.03),
                    border: Border.all(color: Color(0xffB6B6B6), width: 3),
                  ),
                  margin: EdgeInsets.only(top: size.height * 0.02),
                  child: Column(
                    children: <Widget>[
                      memberContainer(
                        membersNames: "Иванов иван иванович",
                        membersRanks: 'директор',
                      ),
                      memberContainer(
                        membersNames: "Сергеев сергей петрович",
                        membersRanks: 'Мастер производства',
                      ),
                      memberContainer(
                        membersNames: "Петров сергей иванович ",
                        membersRanks: 'Помощник мастера',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: size.height * 0.32,
                  width: size.width * 0.93,
                  padding: EdgeInsets.all(size.width * 0.04),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(size.width * 0.03),
                    border: Border.all(color: Color(0xffB6B6B6), width: 3),
                  ),
                  margin: EdgeInsets.only(top: size.height * 0.01),
                  child: Column(
                    children: <Widget>[
                      memberContainer(
                        membersNames: "Иванов иван иванович",
                        membersRanks: 'директор',
                      ),
                      memberContainer(
                        membersNames: "Сергеев сергей петрович",
                        membersRanks: 'Мастер производства',
                      ),
                      memberContainer(
                        membersNames: "Петров сергей иванович ",
                        membersRanks: 'Помощник мастера',
                      ),
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
  memberContainer({Key key, this.membersNames, this.membersRanks})
      : super(key: key);
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
            width: size.width * 0.13,
            height: size.height * 0.06,
            child: Image(
              image: AssetImage('assets/images/person.jpg'),
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
                  TextStyle(color: Colors.white, fontSize: size.width * 0.04),
            ),
          ),
          Container(
            height: size.height * 0.09,
            width: size.width * 0.3,
            child: Column(
              children: [
                Text(
                  "12.03.2021",
                  style: TextStyle(
                    fontSize: size.width * 0.022,
                    color: Color(0xffCACACA),
                  ),
                ),
                Container(
                  width: size.width * 0.28,
                  child: Text(widget.membersRanks,
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
