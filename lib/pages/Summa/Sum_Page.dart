import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
                    width: size.width,
                    height: size.height*0.05,
                    margin: EdgeInsets.only(top: size.width*0.03),
                    child: Text(
                      "05.03.2021",
                      style: TextStyle(
                        color: Color(0xff6D69CF),
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: size.height * 0.2,
                    margin: EdgeInsets.only(
                        top: size.width * 0.1,
                        left: size.width * 0.05,
                        right: size.width * 0.05,),
                    padding: EdgeInsets.only(
                      top: size.width * 0.1,
                      left: size.width * 0.055,
                      right: size.width * 0.055,
                      bottom: size.width * 0.06
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width * 0.04),
                      color: Color(0xff6D69CF),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.29),
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Итого\n',
                                style: Theme.of(context).textTheme.headline4.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40
                                ),
                              ),
                              TextSpan(
                                text: "10 000 000 UZS",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 37,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height,
                    width: size.width,
                    margin: EdgeInsets.only(top: size.width* 0.08),
                    child: ListView(
                      children: [
                        SubButton(titile: "Карандаши", count: 30, sum: 20000000,),
                        SubButton(titile: "Блокноты ", count: 15, sum: 40000000,),
                        SubButton(titile: "Календари", count: 15, sum: 40000000,),
                        SubButton(titile: "Календари", count: 15, sum: 40000000,),
                        SubButton(titile: "Календари", count: 15, sum: 40000000,),
                      ],
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

class SubButton extends StatefulWidget {
  SubButton({Key key, this.titile , this.count , this.sum}): super (key: key);
  String titile;
  int count;
  int sum;

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
      padding: EdgeInsets.all(size.width*0.03),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.titile,
            style: TextStyle(fontSize: size.width*0.06,  color: Color(0xff6D69CF)),
            textAlign: TextAlign.center,
          ),
          Text(
            count,
            style: TextStyle(fontSize: size.width*0.06, color: Color(0xff6D69CF)),
            textAlign: TextAlign.left,
          ),
          Text(
            sum,
            style: TextStyle(fontSize: size.width*0.06,fontWeight: FontWeight.bold ,color: Color(0xffFD413B)),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
