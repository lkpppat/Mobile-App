//home app bar
import 'package:flutter/material.dart';

class AppBar4 extends StatelessWidget {
  const AppBar4({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //ไอคอนสัตว์เลี้ยง
          Row(
            children:  [
              Image.asset("assets/images/logohome.png"),
            ],
          ),
          Row(
            children: [
              Text(
                "Owner",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              )              
            ],
          ),
        ],
      ),
    );
  }
}