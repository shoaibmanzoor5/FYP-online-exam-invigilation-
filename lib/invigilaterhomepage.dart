import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import"dart:convert" as convert;
import 'package:http/http.dart' as http;
import 'package:onlineexaminvigilation0001/UploadPaperType.dart';
import 'package:onlineexaminvigilation0001/sendvideoflutter.dart';
import 'package:onlineexaminvigilation0001/uploadpaper.dart';
import 'Student2.dart';
import 'headmovement.dart';
import 'invigilatorpage1.dart';
import 'invigilatorpage2.dart';
import 'main.dart';
import 'mainpage.dart';

 class invigilater extends StatefulWidget {
   var id;

   invigilater({Key? key,required this.id}) : super(key: key);

   @override
   _invigilaterState createState() => _invigilaterState();
 }

 class _invigilaterState extends State<invigilater> {

   final nm = TextEditingController();
   List<StudentTable> stdList = [];

                  //String baseUrl = "http:/192.168.10.9//";
   var _message;
   postData() async {
     {
       var response = await http.post(
           Uri.parse('http://' + MyApp.ip + '/invigilation/api/std/videoTime'),
           body: {
             "videotime": nm.text,

           });

       if (response.statusCode == 200) {
         _message = response.body.toString();
         var sb = SnackBar(content: Text('Data Inserted'));
         ScaffoldMessenger.of(context).showSnackBar(sb);
       } else {
         var sb = SnackBar(content: Text('Something Went Wrong'));
         ScaffoldMessenger.of(context).showSnackBar(sb);
       }
     }
   }


   Future<void> getImage() async{
                    var response=await http.get(Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/getInvigilator'));
                    if(response.statusCode==200)
                    {
                      //return json.decode(response.body)['response'];
                      print("Successfull Show Record");


                      Iterable listt = jsonDecode(response.body);
                      stdList=listt.map((e) => StudentTable.fromJson(e)).toList();
                      setState(() {

                      });
                      //var res=json.decode(response.body);
                      //return res.map<student>((json)=>student.fromJson(json)).toList();
                    }
                    else
                      throw Exception('Failed to load data');

                  }



                  int length=0;
                  Future<List<dynamic>> showData() async {
                    print(widget.id);
                    var _message;
                    var response = await http.post(
                       Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/senddatainvigaltorpg'),
                        //Uri.parse('http://' + MyApp.ip + '/FYPInvigilation/api/fyp/getinvigilator'),
                        body: {
                          "iEmail": widget.id.toString(),
                        });
                    print("d2");
                    print(widget.id);
                    print(response.statusCode);
                    print(response.body);
                    if (response.statusCode == 200) {
                      print('teacherid'+widget.id);
                      print("ali");
                      _message = response.body.toString();
                      var jsonResult = convert.jsonDecode(
                          response.body) as List<dynamic>;
                      print(jsonResult);
                      length = jsonResult.length;
                      return jsonResult;


                      //obj

                      //
                    }
                    else {
                      var sb = SnackBar(content: Text(
                          'Plzz Enter Correct Email And Password'));
                      ScaffoldMessenger.of(context).showSnackBar(sb);

                      return [];
                    }
                  }
                  @override
                  void initState() {
                    super.initState();
                    showData();
                     getImage();
                    print("Build Completed");
                  }



                  @override
                  Widget build(BuildContext context) {
                    print("shoaib");
                    return WillPopScope(
                      onWillPop: () async=>false,
                      child:Scaffold(
                          backgroundColor: Colors.white,
                          appBar: AppBar(

                            backgroundColor: Colors.blue,

                            title: Text('Invigilator', style: TextStyle(
                                color:Colors.white ,
                                fontSize: 25,

                                fontWeight: FontWeight.bold
                            ),),
                            actions:<Widget> [

                              ElevatedButton(

                                child: Text("Logout",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white,),),
                                onPressed:() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => new mainpage(id: widget.id,)),
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
                    return  Center(child: CircularProgressIndicator());
                    }
                    else {
                    return ListView.builder(
                    itemCount: length,
                    itemBuilder: (context, index) {
                    return Column(
                    children: <Widget>[
                    Container(

                    child: Row(
                    children: [

                    Container(

                    margin: EdgeInsets.only(left: 8, top: 10),
                    width: 240,
                    height: 150,

                    child: Column(
                    children: [
                    Row(
                    children: [
                    Text("ID NO: ",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                    Text(snapshot.data![index]["iID"].toString(),style:TextStyle(fontSize: 17))
                    ],
                    ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text("Name: ",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                          Text(snapshot.data![index]["iName"].toString(),style:TextStyle(fontSize: 17)),
                        ],

                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text("Email: ",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                          Text(snapshot.data![index]["iEmail"].toString(),style:TextStyle(fontSize: 17)),
                        ],

                      ),
                    ],
                    ),
                    ),

                    // ),SingleChildScrollView(
                    //
                    //         child: Column(
                    //           children: <Widget>[
                    //             Container(
                    //
                    //
                    //                 child: Row(
                    //                     children: [
                    //
                    //                       Container(
                    //                         margin: EdgeInsets.only(left: 15,top: 15),
                    //                         width: 190,
                    //                         height: 170,
                    //
                    //                         child: Text("NAME:Sir Zahid \n \n"" GROUP No: 1 \n\nTODAY'S PAPER: PF",style: TextStyle(
                    //                             fontSize: 20,
                    //                             fontWeight: FontWeight.bold,
                    //                             color: Colors.black
                    //                         ),
                    //
                    //
                    //                         ),
                    //
                   // ),

                      Container(

                        margin: EdgeInsets.only(
                            left: 2,  right: 8, top: 5, bottom: 40),
                        width: 100,
                        height: 100,
                        child: CircleAvatar(
                            backgroundImage: NetworkImage('http://'+MyApp.ip+''+ snapshot.data![index]["iPicture"].toString()
                            )




                        ),


                      )
                    ]),
                    ),
                      Container(
                        child:Row(
                      children: [

                      Container(
                        margin: EdgeInsets.only(left: 5,right: 60),
                        padding: EdgeInsets.only(
                          top: 5,
                        ),
                        width: 200,
                        height: 60,
                        child: TextField(
                          controller: nm,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'how to make video in seconds',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only( left: 0, ),
                        width: 90,
                        height: 50,
                        child: ElevatedButton(
                          child: Text(
                            "Video",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            postData();
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => new CameraPage(id: widget.id,)),
                            // );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                          ),
                        ),
                      ),
                    ])),
                    SizedBox(
                    height: 20,
                    ),

                    Container(
                    padding:EdgeInsets.only(left: 10,top: 20,right: 10,),
                    margin: EdgeInsets.only(top: 0,left: 0,right: 40),

                    width: 400,
                    height: 60,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    color: Colors.grey),

                    child: Text('Paper Start Time: 09:00 AM',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Colors.black,

                    ),


                    ),
                    ),
                    SizedBox(
                    height:5,
                    ),
                    Container(
                    padding:EdgeInsets.only(left: 10,top: 20,right: 10),
                    margin: EdgeInsets.only(top: 0,left: 0,right: 40,),

                    width: 400,
                    height: 60,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    color: Colors.grey),

                    child: Text('Paper End Time: 12:00 PM',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Colors.black,

                    ),


                    ),
                    ),
                    SizedBox(
                    height: 5,
                    ),
                    Container(

                    padding:EdgeInsets.only(left: 20,top: 20,right: 10,),
                    margin: EdgeInsets.only(top: 0,left: 0,right: 40,bottom: 0),

                    width: 400,
                    height: 60,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    color: Colors.grey),

                    child: Text(' Start In: 00:00 PM',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Colors.black,

                    ),


                    ),
                    ),
                    SizedBox(
                    height: 1,
                    ),
                      Container(

                        margin: EdgeInsets.only(top: 20,left: 0),
                        width:200,
                        height: 50,
                        child:ElevatedButton(

                          child: Text("Upload Paper",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                          onPressed:() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => new invigilater1(id: widget.id,)),

                              //MaterialPageRoute(builder: (context) => new uploadpaper(id: widget.id,)),
                            );


                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,

                          ),
                        ),
                      ),
                    Container(

                    margin: EdgeInsets.only(top: 10,left: 0),
                    width:200,
                    height: 50,
                    child:ElevatedButton(

                    child: Text("Enter",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                    onPressed:() async {
                       // print('inside inv${widget.id}');
                      // call get all student method
                     // String u='http://'+MyApp.ipaddress+'/getAllStudents';
                      String u='http://'+MyApp.ipaddress+'/getAllStudents/'+widget.id;
                      print(u);
                      var response=await http.get(Uri.parse('http://'+MyApp.ipaddress+'/getAllStudents/'+widget.id));
                      print(response.body.toString()+"GHGHGGHGHGHGHGHHGGHGH");
                     Iterable resp_body= jsonDecode( response.body);
                     List<String> present_Students=[];
                     resp_body.forEach((element) {
                      present_Students.add(element["Present_Students"]);
                     });
                     print('Present Students${present_Students.length}');

                     Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => VideoPlayerScreen(id: widget.id,present_Students: present_Students)),
                     );
                   // Navigator.push(
                   //    context,
                   //    MaterialPageRoute(builder: (context) => new invigilatorpg2(id: widget.id,)),
                   //  );


                    },
                    style: ElevatedButton.styleFrom(
                    primary: Colors.blue,

                    ),
                    ),
                    ),
                      Container(

                        margin: EdgeInsets.only(top: 20,left: 0),
                        width:200,
                        height: 50,
                        child:ElevatedButton(

                          child: Text("Upload Paper",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                          onPressed:() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => new insert(id: null,)),

                              //MaterialPageRoute(builder: (context) => new uploadpaper(id: widget.id,)),
                            );


                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,

                          ),
                        ),
                      ),
                      ],);
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
                  late String? iName,iPassword,iPicture,iID;
                  // late int sID;
                  StudentTable(
                      {
                        required this.iName,
                        required this.iID,
                        required this.iPassword,
                        required this.iPicture,

                      });
                  factory StudentTable.fromJson(Map<String,dynamic>json)
                  {
                    return StudentTable(
                      iName:json['iName'],
                      iID:json['iID'],
                      iPassword:json['iPassword'],
                      iPicture: json['Picture'],


                    );
                  }
                }


