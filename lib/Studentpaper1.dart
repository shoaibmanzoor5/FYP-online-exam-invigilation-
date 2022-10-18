import 'dart:convert';
import "dart:convert" as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlineexaminvigilation0001/recordingvideo/camera_page.dart';
import 'FaceNoError2.dart';
import 'Papersubmit.dart';
import 'Studentpaper2.dart';
import 'faceerror.dart';
import 'ftpser.dart';
import 'list.dart';
import 'main.dart';
import 'mainpage.dart';

class StudentPaperpage extends StatefulWidget {
  var id;
  var time;
  StudentPaperpage({Key? key, required this.id,required this.time}){
    print('sP$time');
  }

  @override
  _StudentPaperpageState createState() => _StudentPaperpageState();
}

class _StudentPaperpageState extends State<StudentPaperpage> {
  String? msg = "";
  String? as = "";
  bool wrns = true;
  String? warn_message = "";
  bool rm = true;

  // bool chalo=true;
  Future<void> GetTime() async {
    // while(chalo) {
    var datetime = DateTime.now();
    String date;
    date = datetime.year.toString() +
        "-0" +
        datetime.month.toString() +
        "-" +
        datetime.day.toString();
    String Time = datetime.hour.toString();
    String AMPM = "AM";
    var time = int.parse(Time);
    if (time > 12) {
      time = time - 12;
      AMPM = "PM";
    }
    String tme = time.toString();

    var response = await http.post(Uri.parse('http://' +
        MyApp.ip +
        '/invigilation/api/std/ShowPaper123?ID=' +
        MyApp.Username +
        '&eDate=' +
        date +
        '&section=' +
        MyApp.Semester.replaceAll("[", '')
            .replaceAll("]", '')
            .replaceAll('"', '') +
        '&sHours=' +
        tme +
        '&smeridiam=' +
        AMPM +
        '&emeridiam=' +
        AMPM));
    this.setState(() {
      List<String> lst = response.body.toString().split(",,,");
      MyApp.papername = lst[0].replaceAll('"', "");
      MyApp.paperpath = lst[1];
      MyApp.papertype = lst[2].replaceAll('"', "");
      print(response.body.toString());
    });

    // print("meri jaan bhai");
    // await Future.delayed(Duration(seconds: 2));

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      throw UnimplementedError();
    }
  }

  List<StudentTable> stdList = [];

  //String baseUrl = "http:/192.168.10.9//";

  Future<void> getImage() async {
    var response = await http.get(
        Uri.parse('http://' + MyApp.ip + '/invigilation/api/std/getStudent'));
    if (response.statusCode == 200) {
      //return json.decode(response.body)['response'];

      Iterable listt = jsonDecode(response.body);
      stdList = listt.map((e) => StudentTable.fromJson(e)).toList();
      setState(() {});

      //var res=json.decode(response.body);
      //return res.map<student>((json)=>student.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> warns() async {
    while (wrns) {
      var _message;
      var response = await http.get(
        // Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/senddatanextpg'),
        Uri.parse(
            'http://' + MyApp.ipaddress + '/recieveWarnings/' + widget.id),
      );
      print("shoaib");
      print(response.body.toString());
      print("11223");
      msg = response.body.toString();
      print("11231");
      print(msg);
      await Future.delayed(Duration(seconds: 3));
    }
  }

  Future<void> receviemsg() async {
    while (rm) {
      var response = await http.post(
          Uri.parse('http://' + MyApp.ip + '/invigilation/api/std/getWarns'),
          body: {
            "sRegNo": widget.id,
          });

      if (response.statusCode == 200) {
        warn_message = response.body.toString();

        print(warn_message);


        // savemasge= (warn_message+text12.text)! ;
      }
      // var _message;
      // var response = await http.get(
      //   // Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/senddatanextpg'),
      //   Uri.parse('http://' + MyApp.ipaddress + '/recieveMsgs/'+widget.id),);
      // print("ahmed");
      // print(response.body.toString());
      // print("11223");
      // as = response.body.toString();
      // print("11231");
      // print(as);
      await Future.delayed(Duration(seconds: 3));
    }
  }

  @override
  void dispose() {
    super.dispose();
    getImage();
    warns();
  }

  late SnackBar sb;
  int length = 0;

  Future<List<dynamic>> showData() async {
    var _message;
    var response = await http.post(
        // Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/senddatanextpg'),
        Uri.parse(
            'http://' + MyApp.ip + '/invigilation/api/std/senddatanextpg'),
        body: {
          "sRegNo": MyApp.Username,
        });

    if (response.statusCode == 200) {
      _message = response.body.toString();
      var jsonResult = convert.jsonDecode(response.body) as List<dynamic>;

      length = jsonResult.length;
      GetSemester();
      return jsonResult;

      //obj

      //
    } else {
      sb = SnackBar(content: Text('Plzz Enter Correct Email And Password'));
      ScaffoldMessenger.of(context).showSnackBar(sb);
    }

    return [];
  }

  Future<String> GetSemester() async {
    var _message;
    var response = await http.post(
        //Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/senddatanextpg'),
        Uri.parse('http://' + MyApp.ip + '/invigilation/api/std/ShowSemester'),
        // Uri.parse('http://'+MyApp.ip+'/FYPInvigilation/api/fyp/ShowSemester'),
        body: {
          "email": MyApp.Username,
        });

    MyApp.Semester = response.body.toString();
    return " ";
  }

  @override
  void initState() {
    super.initState();
    GetTime();
    warns();
    receviemsg();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text(
              'Student',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // actions:<Widget> [
            //   ElevatedButton(
            //
            //     child: Text("Logout",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white,),),
            //     onPressed:() {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => new mainpage(id:widget.id,)),
            //       );
            //
            //     },
            //     style: ElevatedButton.styleFrom(
            //
            //       primary: Colors.blue,
            //
            //     ),
            //
            //   ),
            // ],
          ),
          body: FutureBuilder<List<dynamic>>(
              future: showData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                      itemCount: length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            Container(
                              width: 410,
                              height: 240,
                              child: Row(children: [
                                Container(
                                    width: 170,
                                    height: 200,
                                    child: Row(children: [
                                      Container(
                                          width: 170,
                                          height: 180,
                                          child: Column(children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 5,
                                                  right: 0,
                                                  top: 5,
                                                  bottom: 0),
                                              margin: EdgeInsets.only(
                                                  left: 20, right: 30, top: 0),
                                              width: 170,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  color: Colors.grey),
                                              child: Text(
                                                ' Start \n Time:00:00 AM',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 5,
                                                  right: 0,
                                                  top: 5,
                                                  bottom: 0),
                                              margin: EdgeInsets.only(
                                                  left: 20, right: 30, top: 10),
                                              width: 170,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  color: Colors.grey),
                                              child: Text(
                                                ' End \n Time:00:00 AM',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 5,
                                                  right: 0,
                                                  top: 5,
                                                  bottom: 0),
                                              margin: EdgeInsets.only(
                                                  left: 20, right: 30, top: 10),
                                              width: 170,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  color: Colors.grey),
                                              child: Text(
                                                ' Remaining Time:00:00 AM',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ])),
                                    ])),
                                Container(
                                  //color: Colors.redAccent.withOpacity(0.5),

                                  padding: EdgeInsets.only(top: 0, bottom: 10),
                                  margin: EdgeInsets.only(
                                      left: 10, right: 7, top: 0, bottom: 0),

                                  width: 170,
                                  height: 170,

                                  decoration: BoxDecoration(
                                      border: warn_message! != ""
                                          ? Border.all(
                                              color: Colors.red,
                                            )
                                          : Border.all(
                                              color: Colors.black,
                                            ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  // decoration: BoxDecoration(
                                  //   borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                  //   color: Colors.red,

                                  child: CircleAvatar(
                                      backgroundImage: NetworkImage('http://' +
                                          MyApp.ip +
                                          '' +
                                          snapshot.data![index]["sPicture"]
                                              .toString())),
                                ),
                              ]),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: 384,
                              height: 70,
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 10,
                                        top: 5,
                                        right: 10,
                                        bottom: 10),
                                    margin: EdgeInsets.only(
                                        top: 0.0,
                                        left: 1.0,
                                        right: 0.0,
                                        bottom: 10),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: Colors.grey),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.notifications,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                        SizedBox(
                                          width: 40.0,
                                        ),
                                        //     Text(snapshot.data![index]["warningmasg"].toString(),style:TextStyle(color: Colors.red,
                                        // fontWeight: FontWeight.bold,fontSize: 20.0,)),
                                        Text(
                                          warn_message!,
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold),
                                        ),

                                        SizedBox(
                                          width: 30.0,
                                        ),
                                        Icon(
                                          Icons.warning_amber_rounded,
                                          color: Colors.red,
                                          size: 30.0,
                                        ),
                                        SizedBox(
                                          width: 1.0,
                                        ),
                                        Text(
                                          msg!,
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 60, top: 20, right: 10, bottom: 0),
                              margin:
                                  EdgeInsets.only(top: 0, right: 0, bottom: 10),
                              width: 230,
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.0),
                                  color: Colors.grey),
                              child: Text(
                                MyApp.papername,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: 170,
                              height: 50,
                              color: Colors.white,
                              child: ElevatedButton(
                                child: Text(
                                  "Attempt Paper",
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                onPressed: () {
                                  if (MyApp.papertype == "subjective") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => new ftpser(
                                                  id: widget.id, times: widget.time, timesget: widget.time,
                                                )));
                                  } else {
                                    // Navigator.push(context,
                                    //   MaterialPageRoute(builder: (
                                    //       context) =>
                                    //   new CaptainList(id: widget.id,)),
                                    // );
                                    print('Time:${widget.time}');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => new CameraPage(
                                                id: widget.id,  ttime: widget.time,
                                              )),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                ),
                              ),
                            ),
                            // Container(
                            //
                            //   margin: EdgeInsets.only(top: 8, left: 100,right: 100),
                            //   width: 100,
                            //   height: 50,
                            //   child: ElevatedButton(
                            //
                            //     child: Text("Video", style: TextStyle(fontSize: 25,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white),),
                            //     onPressed: () {
                            //       Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) => new CameraPage(id: widget.id,)),
                            //       );
                            //       // // MaterialPageRoute(
                            //       // //     builder: (context) => new CameraPage(id: widget.id,)),
                            //       // );
                            //     },
                            //     style: ElevatedButton.styleFrom(
                            //       primary: Colors.blue,
                            //
                            //     ),
                            //   ),
                            // ),

                            //         Container(
                            //           width: 390,
                            //           height: 50,
                            //
                            //           padding: EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 10),
                            //           margin: EdgeInsets.only(top: 0,left:5,right: 5,bottom: 0),
                            //           decoration: BoxDecoration(
                            //               borderRadius: BorderRadius.circular(25.0),
                            //               color: Colors.grey),
                            //
                            //           child: Row(
                            //             children:<Widget> [
                            //               Text(
                            //                 "Q#1",
                            //                 style: TextStyle(
                            //                     color: Colors.black,
                            //                     fontSize: 20.0,
                            //                     fontWeight: FontWeight.bold
                            //                 ),
                            //               ),
                            //               SizedBox(
                            //                 width: 10.0,
                            //               ),
                            //               Text(
                            //                 "In flowchart reactangle symbol indicates",
                            //                 style: TextStyle(
                            //                     color: Colors.black,
                            //                     fontSize: 15.0,
                            //                     fontWeight: FontWeight.bold
                            //                 ),
                            //               ),
                            //
                            //
                            //
                            //             ],
                            //           ),
                            //         ),
                            //
                            //         Column(
                            //
                            //           children: <Widget>[
                            //             ListTile(
                            //
                            //               title: Text('A.Input/Output',style: TextStyle(fontSize: 20.0),),
                            //               leading: Radio(
                            //                 value: 'Customer',
                            //                 groupValue: role,
                            //                 onChanged: (value) {
                            //                   setState(() {
                            //                     role = value.toString();
                            //                   });
                            //                 },
                            //               ),
                            //             )
                            //           ],
                            //         ),
                            //
                            //
                            // Column(
                            //   children: <Widget>[
                            //     ListTile(
                            //
                            //       title: Text('B.Conector',style: TextStyle(fontSize: 20.0),),
                            //       leading: Radio(
                            //         value: 'ct',
                            //         groupValue: role,
                            //         onChanged: (value) {
                            //           setState(() {
                            //           role = value.toString();
                            //           });
                            //         },
                            //       ),
                            //     )
                            //   ],
                            // ),
                            //
                            //         Column(
                            //           children: <Widget>[
                            //             ListTile(
                            //               title: Text('C.Proce',style: TextStyle(fontSize: 20.0),),
                            //               leading: Radio(
                            //                 value: 'ak',
                            //                 groupValue: role,
                            //                 onChanged: (value) {
                            //                   setState(() {
                            //                   role = value.toString();
                            //                   });
                            //                 },
                            //               ),
                            //             )
                            //           ],
                            //         ),
                            //         Column(
                            //           children: <Widget>[
                            //             ListTile(
                            //               title: Text('D.Decision',style: TextStyle(fontSize: 20.0),),
                            //               leading: Radio(
                            //                 value: 'sh',
                            //                 groupValue: role,
                            //                 onChanged: (value) {
                            //                   setState(() {
                            //                  role = value.toString();
                            //                   });
                            //                 },
                            //               ),
                            //             )
                            //           ],
                            //         ),
                            //
                            //         Container(
                            //             width: 385,
                            //             height: 50,
                            //
                            //             padding: EdgeInsets.only(left: 1,top: 5,right: 0,bottom: 10),
                            //             margin: EdgeInsets.only(top: 0,right: 10,left:5,bottom: 0),
                            //
                            //             child: Row(
                            //               children:<Widget> [
                            //                 Container(
                            //                   margin: EdgeInsets.only(left:4),
                            //                   width: 100,
                            //                   height: 50,
                            //
                            //                   child:ElevatedButton(
                            //
                            //
                            //                     child: Text("Previous",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                            //                     onPressed:() {
                            //                       Navigator.push(
                            //                         context,
                            //                         MaterialPageRoute(builder: (context) => new Facenoeror(id: widget.id,)),
                            //                       );
                            //
                            //
                            //                     },
                            //                     style: ElevatedButton.styleFrom(
                            //                         primary: Colors.blue,
                            //
                            //                     ),
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   width: 10.0,
                            //                 ),
                            //                 Container(
                            //                   width: 100,
                            //                   height: 50,
                            //                   color: Colors.white,
                            //                   child:ElevatedButton(
                            //
                            //
                            //                     child: Text("Submit",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                            //                     onPressed:() {
                            //
                            //
                            //
                            //                     },
                            //                     style: ElevatedButton.styleFrom(
                            //                         primary: Colors.blue,
                            //
                            //                     ),
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   width: 10.0,
                            //                 ),
                            //                 Container(
                            //
                            //                   width: 100,
                            //                   height: 50,
                            //                   child:ElevatedButton(
                            //
                            //
                            //                     child: Text("Next",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                            //                     onPressed:() {
                            //                       Navigator.push(
                            //                         context,
                            //                         MaterialPageRoute(builder: (context) => new Studentpapers2(id: widget.id,)),
                            //                       );
                            //
                            //
                            //                     },
                            //                     style: ElevatedButton.styleFrom(
                            //                         primary: Colors.blue,
                            //
                            //                     ),
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   width: 20.0,
                            //                 ),
                            //
                            //
                            //
                            //               ],
                            //             )
                            //         ),
                          ],
                        );
                      });
                }
              })),
    );
  }
}

class StudentTable {
  late String? sName, sPassword, sclass, Picture, groups, section, sID;

  // late int sID;
  StudentTable({
    required this.sName,
    required this.sID,
    required this.sPassword,
    required this.Picture,
    required this.section,
    required this.groups,
    required this.sclass,
  });

  factory StudentTable.fromJson(Map<String, dynamic> json) {
    return StudentTable(
      sName: json['sName'],
      sID: json['sID'],
      sPassword: json['sPassword'],
      Picture: json['Picture'],
      section: json['section'],
      groups: json['groups'],
      sclass: json['sclass'],
    );
  }
}
