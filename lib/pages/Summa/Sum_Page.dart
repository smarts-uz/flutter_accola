import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SumPage extends StatefulWidget {
  @override
  _SumPageState createState() => _SumPageState();
}

class _SumPageState extends State<SumPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF5954D3).withOpacity(0.8),
        title: Text(
          "Склад ..",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(size.width * 0.1),
                      child: Text(
                        "05.03.2021",
                        style: TextStyle(
                          color: Color(0xff6D69CF),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: size.height * 0.2,
                    margin: EdgeInsets.only(
                        top: size.width * 0.1,
                        left: size.width * 0.05,
                        right: size.width * 0.05),
                    padding: EdgeInsets.only(
                      top: size.width * 0.1
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width * 0.04),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.29),
                        ),
                      ],
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Итого\n',
                            style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Color(0xff6D69CF),
                              fontWeight: FontWeight.bold,
                              fontSize: 50
                            ),
                          ),
                          TextSpan(
                            text: "10 000 000 UZS",
                            style: TextStyle(
                              color: Color(0xff6D69CF),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
