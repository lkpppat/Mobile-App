//home app bar
import 'package:flutter/material.dart';

class AppBar3 extends StatelessWidget {
  const AppBar3({Key? key}) : super(key: key);

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
                "health insurance",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              )              
            ],
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    ),
                ],
                 borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(Icons.add,
              color: Color.fromARGB(255, 231, 137, 83),),
              
            ),
          ),
        ],
      ),
    );
  }
}