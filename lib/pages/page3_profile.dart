import 'package:flutter/material.dart';

class HomePage4 extends StatelessWidget {
  const HomePage4({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 231, 137, 83),
          title: Center(
            child: const Text(
                "Profile",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ) ,
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 231, 137, 83), Colors.deepOrange.shade300],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.5, 0.9],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        minRadius: 60.0,
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              NetworkImage('https://scontent.fbkk17-1.fna.fbcdn.net/v/t39.30808-6/290155154_859067495484042_4052886512299510265_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFvdKARXReJ5IcwOZP_WFAq5D3Q-pkKvMDkPdD6mQq8wPAawaE1K40Yy9Edy9wF3LiiA0NSiva1E8qW2a8rlhx-&_nc_ohc=0cZA5QoURfgAX8m6yC9&_nc_ht=scontent.fbkk17-1.fna&oh=00_AfDrYrnKonIdmkfUq4qCD4ME3izs_MeZlAtN0JTCWKNM1Q&oe=642B243C'),
                        ),
                      ),
                     
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Piyapat Lukkhan',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '6321606286',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          
            Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Email',
                      style: TextStyle(
                        color: Color.fromARGB(255, 231, 137, 83),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'piyapat.la@ku.th',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'Tel',
                      style: TextStyle(
                        color: Color.fromARGB(255, 231, 137, 83),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '0958058412',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'University',
                      style: TextStyle(
                        color: Color.fromARGB(255, 231, 137, 83),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Kasetsart University Kamphaeng Sean Campus',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'Subject',
                      style: TextStyle(
                        color: Color.fromARGB(255, 231, 137, 83),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Application Development for Mobile Devices',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}