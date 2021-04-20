import 'package:accoola/contsant.dart';
import 'package:flutter/material.dart';

class StoragePage extends StatefulWidget {
  @override
  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor.withOpacity(0.8),
        title: Text(
          'Склад',
          style: TextStyle(fontSize: size.width * 0.065),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: size.width,
                height: size.height * 0.2,
                margin: EdgeInsets.only(
                    left: size.width * 0.05, right: size.width * 0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * 0.04),
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
                  child: Text(
                    "Товары на складе",
                    style: TextStyle(
                        fontSize: size.width * 0.07,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/sum',
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
                    borderRadius: BorderRadius.circular(size.width * 0.04),
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
                    child: Text(
                      "Сырье и материалы",
                      style: TextStyle(
                          fontSize: size.width * 0.07,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
