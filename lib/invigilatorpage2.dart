import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlineexaminvigilation0001/paperend.dart';
import 'package:http/http.dart' as http;
import 'package:onlineexaminvigilation0001/warningshow.dart';


import 'clips.dart';
import 'invigilatorpage1.dart';
import 'invigilatorpage3.dart';
import 'main.dart';
import 'mischefvideo.dart';

class invigilatorpg2 extends StatefulWidget {
  String id;
  String tid;
   String receveoldmssg="";

  invigilatorpg2({Key? key, required this.id,required this.tid,required this.receveoldmssg}){
    print('tayyab=${tid}');
    print('std=${id}');
    print('value = ${receveoldmssg}');
  }


  @override
  _invigilatorpg2State createState() => _invigilatorpg2State();
}

class _invigilatorpg2State extends State<invigilatorpg2> {
String? sm;

  get present_Students => null;


  Future<void> warns() async {
     {

      var _message;
      var response = await http.get(
        // Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/senddatanextpg'),
        Uri.parse('http://' + MyApp.ipaddress + '/giveWarning/' + widget.id),
      );
      print("teacher send warning");
      print(widget.id);
    }
  }
Future<void> removestd() async {
  {
    String remove;
    var response = await http.get(

      Uri.parse(
          'http://' + MyApp.ipaddress + '/removeStudent/' + widget.id),
    );

    print(response.body.toString());

    remove = response.body.toString();
    print('studentid'+widget.id);
    print('removestudent'+remove);
  }
}
var data;
  // Future<void> warnsave() async {
  //   if (text12.text.isEmpty) {
  //     var sb = SnackBar(content: Text('Enter Item Name'));
  //     ScaffoldMessenger.of(context).showSnackBar(sb);
  //     return;
  //   }
  //
  //   var response = await http.post(
  //       Uri.parse('http://' + MyApp.ip + '/invigilation/api/std/warns'),
  //       body: {"sRegNo": widget.id, "warningmasg": text12.text});
  //
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       text12.text = "";
  //     });
  //     var _messsage = response.body.toString();
  //     var sb = SnackBar(content: Text("Successfully Added"));
  //     ScaffoldMessenger.of(context).showSnackBar(sb);
  //   } else {
  //     var _message = response.body.toString();
  //     var sb = SnackBar(content: Text('$_message'));
  //     ScaffoldMessenger.of(context).showSnackBar(sb);
  //   }
  // }
  /////////////////////////////
var msg;
var add;

Future<void> send() async {
  if (text12.text.isEmpty) {
    var sb = SnackBar(content: Text('Enter Item Name'));
    ScaffoldMessenger.of(context).showSnackBar(sb);
    return;
  }
  print('conc ${widget.receveoldmssg} with ${text12.text}');

  widget.receveoldmssg=widget.receveoldmssg.toString()+text12.text;
  text12.text=widget.receveoldmssg;
  var response = await http.post(
      Uri.parse('http://' + MyApp.ip + '/invigilation/api/std/warns'),
      body: {"sRegNo": widget.id, "warningmasg": text12.text});
print('mischef'+widget.receveoldmssg);
  if (response.statusCode == 200) {
    setState(() {
      text12.text=" ";
    });
    var _messsage = response.body.toString();
      msg=_messsage;
      print(msg);

    var sb = SnackBar(content: Text("Successfully Added"));
    ScaffoldMessenger.of(context).showSnackBar(sb);
  } else {
    var _message = response.body.toString();
    var sb = SnackBar(content: Text('$_message'));
    ScaffoldMessenger.of(context).showSnackBar(sb);
  }
}




  // Future<void> sendmsg() async {
  //    {
  //     var _message;
  //     var response = await http.get(
  //       // Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/senddatanextpg'),
  //       Uri.parse('http://' + MyApp.ipaddress + '/sendMsgs'+'/uiuiu/'+widget.id),);
  //     print("ahmed");
  //     print(response.body.toString());
  //     print("11223");
  //     sm = response.body.toString();
  //     print("11231");
  //     print(sm);
  //
  //
  //   }
  //
  // }

  @override
  void initState() {
    super.initState();

    //warns();
  }

  @override

  final text12 = TextEditingController();

  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(

            backgroundColor: Colors.white60,
            body: Column(children: <Widget>[
              Container(

                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(right: 290, top: 80),
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      color: Colors.black,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new VideoPlayerScreen(
                                    id: widget.id,
                                    present_Students: [],
                                  )),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                  )),
              SizedBox(
                height: 25,
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 50,
                      ),
                      padding: EdgeInsets.only(left: 30, top: 0),
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.watch_later_outlined,
                        color: Colors.black,
                        size: 25.0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 0,
                      ),
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      width: 250,
                      height: 50,
                      child: Text(
                        "Remaining Time : 00:00 ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  color: Colors.white70,
                  margin: EdgeInsets.only(left: 0, top: 10),
                  padding: EdgeInsets.only(left: 10, right: 10,top: 8),
                  width: 370,
                  height: 400,
                  child: Row(children: [
                    Container(
                        margin:
                            EdgeInsets.only(right: 10, left: 180, bottom: 167),
                        width: 150,
                        height: 240,
                        child: Column(children: [

                          // Container(
                          //
                          //   margin: EdgeInsets.only(top: 1,left: 15,right: 10,bottom: 10),
                          //   padding: EdgeInsets.only(left: 15,right: 10,bottom: 30),
                          //
                          //   width: 120,
                          //   height:60,
                          //   child:Row(
                          //       children: [
                          //         Container(
                          //
                          //           padding: EdgeInsets.only(left: 24,bottom: 10,top: 3),
                          //           width:30,
                          //           height: 40,
                          //           child: IconButton(
                          //             color: Colors.red,
                          //             onPressed:() {
                          //
                          //
                          //             },
                          //             icon: Icon(Icons.add_circle_outline_sharp ,size: 30,),
                          //           ),
                          //
                          //         ),
                          //         Container(
                          //
                          //           margin: EdgeInsets.only(right: 10),
                          //           width:30,
                          //           height: 40,
                          //           child: IconButton(
                          //             color: Colors.red,
                          //             onPressed:() {
                          //
                          //
                          //             },
                          //             icon: Icon(Icons.warning_amber_rounded ,size: 50,),
                          //           ),
                          //         ),
                          //
                          //       ]),
                          // ),
                          Container(
                            //color: Colors.black,
                            width: 120,
                            height: 50,
                            child: ElevatedButton(
                              child: Text(
                                "Warn",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              onPressed: () {
                                warns();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 8,
                          ),
                          // Container(
                          //
                          //   margin: EdgeInsets.only(top: 25,left: 0),
                          //   width:120,
                          //   height: 50,
                          //   child:ElevatedButton(
                          //
                          //     child: Text("video",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                          //     onPressed:() async {
                          //       print('inside inv${widget.id}');
                          //       // call get all student method
                          //       String u='http://'+MyApp.ipaddress+'/getMischeifVideos/${widget.id}';
                          //       print(u);
                          //       var response=await http.get(Uri.parse('http://'+MyApp.ipaddress+'/getMischeifVideos/${widget.id}'));
                          //       Iterable resp_body= jsonDecode( response.body);
                          //       List<String> michef_video=[];
                          //       resp_body.forEach((element) {
                          //         michef_video.add(element["Present_Students"]);
                          //       });
                          //       print('Present Students${michef_video.length}');
                          //
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(builder: (context) => new michef(id: widget.id, mischf_video: [],)),
                          //       );
                          //       // Navigator.push(
                          //       //    context,
                          //       //    MaterialPageRoute(builder: (context) => new invigilatorpg2(id: widget.id,)),
                          //       //  );
                          //
                          //
                          //     },
                          //     style: ElevatedButton.styleFrom(
                          //       primary: Colors.blue,
                          //
                          //     ),
                          //   ),
                          // ),
                          Container(

                            width: 120,
                            height: 50,
                            child: ElevatedButton(
                              child: Text(
                                "Video",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                               onPressed: ()
                                  async {
                                    print('inside inv${widget.id}');
                                    // call get all student method
                                    String u='http://'+MyApp.ipaddress+'/getMischeifVideos/${widget.id}';
                                    print(u);
                                    var response=await http.get(Uri.parse('http://'+MyApp.ipaddress+'/getMischeifVideos/${widget.id}'));
                                    Iterable resp_body= jsonDecode( response.body);
                                    print('response:${response.body}');

                                   List<String> present_Students=[];
                                    resp_body.forEach((element) {
                                      print('element: $element');
                                      present_Students.add(element);
                                    });
                                    print('Present Students${present_Students.length}');


                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) => new VideoPlayerScreen1(id: widget.id,present_Students: present_Students,)),
                                    // );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => new Video12(id: widget.id,present_Students: present_Students,)),
                                    );


    // Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) => new michef(id: widget.id, mischf_video: [],)),
    //         );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            //color: Colors.black,
                            width: 120,
                            height: 50,
                            child: ElevatedButton(
                              child: Text(
                                "Remove",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              onPressed: ()  {

                                removestd();

                                },


                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                              ),
                            ),
                          ),SizedBox(
                            height: 8,
                          ),
                          //ALL MESCHEF MESSAGE DISPLAY IN LIST
                          // Container(
                          //  // color: Colors.black,
                          //   width: 120,
                          //   height: 50,
                          //   child: ElevatedButton(
                          //     child: Text(
                          //       "mischef MSG",
                          //       style: TextStyle(
                          //           fontSize: 20,
                          //           fontWeight: FontWeight.bold,
                          //           color: Colors.white),
                          //     ),
                          //     onPressed: () {
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(builder: (context) => warning(studentid: widget.id))
                          //       );
                          //     },
                          //     style: ElevatedButton.styleFrom(
                          //       primary: Colors.blue,
                          //     ),
                          //   ),
                          // ),
                        ])),
                  ])),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(children: [
                  Container(
                    color: Colors.white70,
                    margin: EdgeInsets.only(right: 10, top: 15, left: 10),
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    width: 260,
                    height: 75,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 5, top: 5, bottom: 5),
                          width: 230,
                          height: 60,
                          child: TextField(
                            controller: text12,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Type Text',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                        // Container(
                        //
                        //   margin: EdgeInsets.only( bottom: 10,
                        //     left: 25,),
                        //   padding: EdgeInsets.only(left: 0,top: 0),
                        //
                        //
                        //   width: 50,
                        //   height: 50,
                        //   child: Icon(
                        //     Icons.keyboard_voice,
                        //     color: Colors.black,
                        //     size: 40.0,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Container(
                      width: 70,
                      height: 70,
                      margin: EdgeInsets.only(left: 0, top: 10),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          color: Colors.black,
                          onPressed: () {
                            print(
                                "This is the value inside the controller $text12");

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new paperendss(
                                         teacherid: widget.tid,
                                      )),
                            );

                            send();
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 40,
                          ),
                        ),
                      )),
                ]),
              ),
            ])));
  }
}
