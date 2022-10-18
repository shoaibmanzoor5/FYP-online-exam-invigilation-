import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import"dart:convert" as convert;
import 'package:http/http.dart' as http;
import 'package:onlineexaminvigilation0001/uploadpaper.dart';
import 'invigilatorpage1.dart';
import 'main.dart';
import 'mainpage.dart';
import 'mcqs.dart';
import 'mcqsoption.dart';
import 'mcqsupload.dart';
class invigilater1 extends StatefulWidget {
  var id;

  invigilater1({Key? key,required this.id}) : super(key: key);

  @override
  UploadPaper1 createState() => UploadPaper1();
}

class UploadPaper1 extends State<invigilater1> {


  List<StudentTable> stdList = [];

  //String baseUrl = "http:/192.168.10.9//";

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
      print(widget.id);
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
    getImage();
    print("Build Completed");
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async=>true,
      child:Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(

            backgroundColor: Colors.blue,

            title: Text('Invigilator', style: TextStyle(
                color:Colors.white ,
                fontSize: 25,

                fontWeight: FontWeight.bold
            ),),
            // actions:<Widget> [
            //
            //   ElevatedButton(
            //
            //     child: Text("Logout",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white,),),
            //     onPressed:() {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => new mainpage(id: widget.id,)),
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
                                      //                       ),
                                      Container(

                                        margin: EdgeInsets.only(
                                            left: 2,  right: 5, top: 15, bottom: 40),
                                        width: 100,
                                        height: 100,
                                        child: CircleAvatar(
                                            backgroundImage: NetworkImage('http://'+MyApp.ip+''+ snapshot.data![index]["iPicture"].toString()
                                            )




                                        ),


                                      )
                                    ]
                                )),

                            // Container(
                            // padding: EdgeInsets.only(left: 0,top: 0),
                            // margin: EdgeInsets.only(top: 5,right: 10),
                            // width:170,
                            // height: 50,
                            // child:ElevatedButton(
                            //
                            // child: Text("Date Sheet",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                            // onPressed:() {
                            //
                            //
                            // },
                            //
                            // style: ElevatedButton.styleFrom(
                            // primary: Colors.blue,
                            //
                            // ),
                            // ),
                            // ),
                            Container(

                              margin: EdgeInsets.only(top: 25,left: 0),
                              width:200,
                              height: 50,
                              child:ElevatedButton(

                                child: Text("MCQ Paper",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                                onPressed:() {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => new mcqsoption(id: widget.id,)),
                                  // );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => new upload(id: widget.id,)),
                                  );

                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,

                                ),
                              ),
                            ),
                            Container(

                              margin: EdgeInsets.only(top: 25,left: 0),
                              width:200,
                              height: 50,
                              child:ElevatedButton(

                                child: Text("Subjective Paper",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                                onPressed:() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => new uploadpaper(id: widget.id,)),
                                  );


                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,

                                ),
                              ),
                            )
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

