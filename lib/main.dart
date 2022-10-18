
import 'package:flutter/material.dart';
import 'package:onlineexaminvigilation0001/Student.dart';
import 'package:onlineexaminvigilation0001/Student2.dart';

import 'main.dart';
import 'faceerror.dart';
import 'mainpage.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static String ip = '192.168.43.49';
  static String ipaddress = '192.168.43.49:5000';
  static String Username = "";
  static String Userstd = "2018-ARID-1122";

  static String Semester = "";


  static String papername = "";
  static String warningmasg = "";
  static String paperpath = "";
  static String papertype = "";
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          child: Column(
            children: [
              Container(
                margin:
                EdgeInsets.only(left: 20, right: 5, top: 150, bottom: 10),
                width: 350,
                height: 300,
                child: Image.asset(
                  'image/online.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 120, top: 20),
                child: Text('Online Exam Invigilation',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 40.0,
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.white,
                child: IconButton(
                  color: Colors.black,
                  onPressed: () {

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => new baber()),
                    // );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new mainpage(id: null)),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 40,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      // debugShowCheckedModeBanner:false,
    );
    home:
    mainpage(
      id: null,
    );
  }
}
