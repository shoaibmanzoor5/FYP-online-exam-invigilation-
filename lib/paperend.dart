import 'dart:convert';

import 'package:flutter/material.dart';
import "dart:convert" as convert;
import 'package:http/http.dart' as http;
import 'Student.dart';
import 'invigilaterhomepage.dart';
import 'main.dart';
import 'mainpage.dart';

class paperendss extends StatefulWidget {
  String teacherid;

  paperendss({Key? key, required this.teacherid}) : super(key: key);

  @override
  _submitpaper1State createState() => _submitpaper1State();
}

class _submitpaper1State extends State<paperendss> {

  Future<void> GetTime()
  async {
    var datetime = DateTime.now();
    String date;
    date=datetime.year.toString()+"-0"+datetime.month.toString()+"-"+datetime.day.toString();
    String Time = datetime.hour.toString();
    String AMPM = "AM";
    var time = int. parse(Time);
    if(time > 12 ) {
      time = time - 12;
      AMPM="PM";
    }
    String tme = time.toString();
    print(AMPM);
    print(MyApp.Semester.replaceAll("[", '').replaceAll("]", '').replaceAll('"', ''));
    print(date);
    print(MyApp.Username);
    print(tme);

    var response = await http.post(
        Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/ShowPaper123?ID='+MyApp.Username+'&eDate='+date+'&section='+MyApp.Semester.replaceAll("[", '').replaceAll("]", '').replaceAll('"', '')+'&sHours='+tme+'&smeridiam='+AMPM+'&emeridiam='+AMPM));
    print("jj");
    this.setState(() {
      print("jj");
      List<String> lst = response.body.toString().split(",,,");
      MyApp.papername = lst[0].replaceAll('"', "");
      MyApp.paperpath = lst[1];
      MyApp.papertype = lst[2].replaceAll('"', "");
      print(MyApp.papername);
      print('papername'+MyApp.papername);
    });
    // MyApp.papername = response.body.toString();
    // print(MyApp.papername);
    // print(MyApp.papername);
  }

  List<StudentTable> stdList = [];

  //String baseUrl = "http:/192.168.10.9//";

  Future<void> getImage() async {
    var response = await http.get(Uri.parse(
        'http://' + MyApp.ip + '/invigilation/api/std/getInvigilator'));
    if (response.statusCode == 200) {
      //return json.decode(response.body)['response'];
      print("Successfull Show Record");

      Iterable listt = jsonDecode(response.body);
      stdList = listt.map((e) => StudentTable.fromJson(e)).toList();
      setState(() {});
      //var res=json.decode(response.body);
      //return res.map<student>((json)=>student.fromJson(json)).toList();
    } else
      throw Exception('Failed to load data');
  }

  int length = 0;

  Future<List<dynamic>> showData() async {
    print('inside show data...');
    print('teacid${widget.teacherid}');
    var _message;
    var response = await http.post(
        Uri.parse('http://' +
            MyApp.ip +
            '/invigilation/api/std/senddatainvigaltorpg'),
        //Uri.parse('http://' + MyApp.ip + '/FYPInvigilation/api/fyp/getinvigilator'),
        body: {
          "iEmail": widget.teacherid.toString(),
        });
    print("d2");
    print(widget.teacherid);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      print(widget.teacherid);
      print("ali");
      _message = response.body.toString();
      var jsonResult = convert.jsonDecode(response.body) as List<dynamic>;
      print(jsonResult);
      length = jsonResult.length;
      return jsonResult;

      //obj

      //
    } else {
      var sb = SnackBar(content: Text('Plzz Enter Correct Email And Password'));
      ScaffoldMessenger.of(context).showSnackBar(sb);

      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    getImage();
    GetTime();

    print("Build Completed");
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
              'Invigilator',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new mainpage(
                              id: widget.teacherid,
                            )),
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
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                      itemCount: length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            Container(
                                child: Row(children: [
                              Container(
                                margin: EdgeInsets.only(left: 7, top: 5),
                                width: 240,
                                height: 150,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "ID NO: ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                            snapshot.data![index]["iID"]
                                                .toString(),
                                            style: TextStyle(fontSize: 17))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Name: ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                            snapshot.data![index]["iName"]
                                                .toString(),
                                            style: TextStyle(fontSize: 17)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Email: ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                            snapshot.data![index]["iEmail"]
                                                .toString(),
                                            style: TextStyle(fontSize: 17)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Text(
                                    //       "Paper Name :",
                                    //       style: TextStyle(
                                    //         fontSize: 16,
                                    //         fontWeight: FontWeight.bold,
                                    //       ),
                                    //     ),
                                    //     Text(MyApp.papername.toString(),
                                    //         style: TextStyle(fontSize: 17)),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),

                              // get data => null;
                              //
                              // @override
                              // Widget build(BuildContext context) {
                              //   return Material(
                              //       child:Scaffold(
                              //           backgroundColor: Colors.white,
                              //           appBar: AppBar(
                              //
                              //             backgroundColor: Colors.blue,
                              //             title: Text('Invigilator', style: TextStyle(
                              //                 color:Colors.white ,
                              //
                              //                 fontWeight: FontWeight.bold
                              //             ),),
                              //           ),
                              //           body: SingleChildScrollView(
                              //
                              //               child: Column(
                              //                   children: <Widget>[
                              //                     Container(
                              //
                              //
                              //                         child: Row(
                              //                             children: [
                              //
                              //                               Container(
                              //                                 margin: EdgeInsets.only(left: 10,top: 5),
                              //                                 width: 180,
                              //                                 height: 150,
                              //
                              //                                 child: Text("NAME: Ahmed Khokhar \n ARID NO: 2018-ARID-0959 \n CLASS: BSCS-7B "
                              //                                     "\n SECTION: A \n GROUP: 1 \n TODAY PAPER: PF",style: TextStyle(
                              //                                     fontSize: 14,
                              //                                     fontWeight: FontWeight.bold,
                              //                                     color: Colors.black
                              //                                 ),
                              //
                              //
                              //                                 ),
                              //                               ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 5, right: 7, top: 10, bottom: 40),
                                width: 100,
                                height: 100,
                                child: CircleAvatar(
                                    backgroundImage: NetworkImage('http://' +
                                        MyApp.ip +
                                        '' +
                                        snapshot.data![index]["iPicture"]
                                            .toString())),
                              )
                            ])),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 40, top: 25, right: 30, bottom: 0),
                              margin: EdgeInsets.only(
                                  top: 30, right: 0, bottom: 20),
                              width: 320,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.grey),
                              child: Text(
                                ' Paper Session Ended',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 0, top: 5),
                              margin: EdgeInsets.only(top: 40, left: 10),
                              width: 150,
                              height: 50,
                              child: ElevatedButton(
                                child: Text(
                                  "Home",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => new invigilater(
                                              id: widget.teacherid,
                                            )),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 0, top: 5),
                              margin: EdgeInsets.only(top: 30, left: 10),
                              width: 150,
                              height: 50,
                              child: ElevatedButton(
                                child: Text(
                                  "Logout",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => new mainpage(
                                              id: widget.teacherid,
                                            )),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                }
              })),
    );
  }
}

class StudentTable {
  late String? iName, iPassword, iPicture, iID;

  // late int iID;
  StudentTable({
    required this.iName,
    required this.iID,
    required this.iPassword,
    required this.iPicture,
  });

  factory StudentTable.fromJson(Map<String, dynamic> json) {
    return StudentTable(
      iName: json['iName'],
      iID: json['iID'].toString(),
      iPassword: json['iPassword'],
      iPicture: json['Picture'],
    );
  }
}
