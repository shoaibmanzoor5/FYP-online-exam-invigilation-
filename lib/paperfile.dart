
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlineexaminvigilation0001/rules.dart';
import 'Widgets/timer.dart';
import 'datesheet.dart';
import 'faceerror.dart';
import"dart:convert" as convert;
import 'invigilaterhomepage.dart';
import 'package:http/http.dart' as http;

import 'list.dart';
import 'main.dart';
import 'mainpage.dart';

class Studentpag extends StatefulWidget {
  var id;



  Studentpag({Key? key,required this.id}) : super(key: key);


  @override
  _StudentpageState createStat() => _StudentpageState();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
void setState(Null Function() param0) {
}
class _StudentpageState extends State<Studentpag> {
  late Timer _timer;
  int _start = 10;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  late SnackBar sb;
  int length=0;
  Future<List<dynamic>> showData() async {
    print(widget.id);
    var _message;
    var response = await http.post(
      // Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/senddatanextpg'),
        Uri.parse('http://'+MyApp.ip+'/FYPInvigilation/api/fyp/getstudents'),
        body: {
          "regno": widget.id,
        });
    print("d2");
    print(widget.id);
    print (response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      _message = response.body.toString();
      var jsonResult=convert.jsonDecode(response.body) as List<dynamic>;
      print(jsonResult);
      length=jsonResult.length;
      return jsonResult;


      //obj

      //
    }
    else {
      sb = SnackBar(content: Text('Plzz Enter Correct Email And Password'));
      ScaffoldMessenger.of(context).showSnackBar(sb);
    }
    return[];
  }


  @override
  void initState() {
    print("Build Completed");
    // TODO: implement initState
    super.initState();
    startTimer();

    print("Build Completed");


  }

  void startTimer()
  {
    print("jgu0");
    int timerCount;
    for (int x = _start; x > 0; x--) {
      print("jgu1");

      setState(() {
        print("jgu");

        _start -= 1;
        print("jgu");

      });
    }

  }
  @override
  Widget build(BuildContext context) {

    return Material(
      child:Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(

            backgroundColor: Colors.blue,
            title: Text('Student', style: TextStyle(
                color:Colors.white ,

                fontWeight: FontWeight.bold
            ),),
            actions:<Widget> [
              ElevatedButton(

                child: Text("Logout",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white,),),
                onPressed:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new mainpage(id:widget.id,)),
                  );

                },
                style: ElevatedButton.styleFrom(

                  primary: Colors.blue,

                ),

              ),
            ],
          ),
          body: FutureBuilder<List<dynamic>>(
              future: showData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                else {
                  return ListView.builder(
                      itemCount: length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[



                                    Container(

                                      margin: EdgeInsets.only(
                                          left: 20,  right: 7, top: 15, bottom: 40),
                                      width: 110,
                                      height: 110,





                                      child:ClipRRect(
                                        borderRadius: BorderRadius.circular(20), // Image border
                                        child: SizedBox.fromSize(
                                            size: Size.fromRadius(48), // Image radius
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(20), // Image borderss
                                              child: SizedBox.fromSize(
                                                size: Size.fromRadius(48), // Image radius
                                                child: Image.asset('image/cg.pdf', fit: BoxFit.cover),
                                              ),
                                            )
                                        ),
                                      ),


                                      //   child: CircleAvatar(
                                      //     backgroundImage: NetworkImage('http://'+MyApp.ip+'' + snapshot.data![index]["Picture"].toString()
                                      //
                                      //     )
                                      //
                                      // ),
                                    ),


                                  ]




                            );



                      }
                  );
                }
              }
          )
      ),
    );
  }
}

class StudentTable{
  late String? sName,sPassword,sclass,Picture,groups,section,sID;
  // late int sID;
  StudentTable(
      {
        required this.sName,
        required this.sID,
        required this.sPassword,
        required this.Picture,
        required this.section,
        required this.groups,
        required this.sclass,
      });
  factory StudentTable.fromJson(Map<String,dynamic>json)
  {
    return StudentTable(
      sName:json['sName'],
      sID:json['sID'],
      sPassword:json['sPassword'],
      Picture: json['Picture'],
      section: json['section'],
      groups: json['groups'],
      sclass: json['sclass'],
    );
  }
}



