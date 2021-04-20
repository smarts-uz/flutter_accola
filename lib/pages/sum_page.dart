import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../contsant.dart';

class SumPage extends StatefulWidget {
  const SumPage({Key key}) : super(key: key);
  @override
  _SumPageState createState() => _SumPageState();
}

class _SumPageState extends State<SumPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor.withOpacity(0.8),
        title: Text(
          "Склад",
          style: TextStyle(fontSize: size.width * 0.065),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: size.height * 0.01),
              child: Text(
                "05.03.2021",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
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
                borderRadius: BorderRadius.circular(size.width * 0.04),
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
                color: Theme.of(context).accentColor,
              ),
            ),
            SizedBox(
              height: size.height,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return SubButton(
                    title: 'Any',
                    count: 123,
                    sum: 12312313123,
                  );
                },
                itemCount: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardSum extends StatelessWidget {
  final Color color;
  const CardSum({
    Key key,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                text: "10 000 000 UZS",
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
              fontSize: size.width * 0.06,
              color: kPrimaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            count,
            style: TextStyle(
              fontSize: size.width * 0.06,
              color: kPrimaryColor,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            sum,
            style: TextStyle(
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.bold,
                color: Color(0xffFD413B)),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
