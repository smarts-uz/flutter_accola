import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CardButton(imageUrl:'assets/icons/ic_casheloc.png',title: 'Счета',press:(){}),
                    CardButton(imageUrl:'assets/icons/ic_casheloc.png',title: 'Счета',press:(){}),
                    CardButton(imageUrl:'assets/icons/ic_casheloc.png',title: 'Счета',press:(){}),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: size.width*0.02, right:size.width*0.02 ),
                  child: Column(
                    children: <Widget>[
                      CardButton(imageUrl:'assets/icons/ic_casheloc.png',title: 'Счета',press:(){}),
                      CardButton(imageUrl:'assets/icons/ic_casheloc.png',title: 'Счета',press:(){}),
                      CardButton(imageUrl:'assets/icons/ic_casheloc.png',title: 'Счета',press:(){}),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    CardButton(imageUrl:'assets/icons/ic_casheloc.png',title: 'Счета',press:(){}),
                    CardButton(imageUrl:'assets/icons/ic_casheloc.png',title: 'Счета',press:(){}),
                    Container(
                      margin: EdgeInsets.only(top: size.width*0.04),
                      width: size.width / 3.5,
                      height: size.width / 3.5,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
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
        margin: EdgeInsets.only(top: size.width*0.04),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(imageUrl),
                width: size.width * 0.2,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: Color(0xFF616AB2)),
              ),
            ],
          ),
        ),
        width: size.width / 3.5,
        height: size.width / 3.5,
      ),
    );
  }
}
