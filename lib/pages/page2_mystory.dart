
import 'package:flutter/material.dart';
 
// ส่วนของ Stateful widget
class HomePage2 extends StatefulWidget{
    @override
    State<StatefulWidget> createState() {
        return _HomePage2();
    }
}
class _HomePage2 extends State<HomePage2>{
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Welcome to MY Pets'),
                backgroundColor: Color.fromARGB(255, 231, 137, 83),
                
            ),
            
            body: Material(
                color: Colors.white,
                child: Center(
                    child: Image.asset('assets/images/page.png')
                     
                )
                
            )
            
        );
    }
}