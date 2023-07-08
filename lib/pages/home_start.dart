import 'package:flutter/material.dart';
import 'package:mypets/database/database_helper.dart';
import 'package:mypets/navbar.dart';
import 'package:mypets/pages/page1_mypets.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logohome.png"),
                const SizedBox(
                  height: 155.0,
                  child: Text(
                    'My pets',
                    style: TextStyle(
                      fontSize: 50),
                  ),
                ),
                
                const SizedBox(height: 45.0),
                
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Color.fromARGB(255, 231, 137, 83),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () {
                      //go to navbar
                      Navigator.push(context, MaterialPageRoute(builder : (context) {
                        return CustomNavBar(dbHelper: DatabaseHelper(),);
                      }));
                    },
                    child: const Text(
                      "Get started",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white
                        ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
              
            ),
          ),
        ),
      ),
    );
  }
}