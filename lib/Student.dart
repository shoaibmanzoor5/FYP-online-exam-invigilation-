
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

class Studentpage extends StatefulWidget {
  var id;



  Studentpage({Key? key,required this.id}) : super(key: key);


  @override
  _StudentpageState createState() => _StudentpageState();
}
void setState(Null Function() param0) {
}
class _StudentpageState extends State<Studentpage> {



  List<StudentTable> stdList = [];

  //String baseUrl = "http:/192.168.10.9//";

  Future<void> getImage() async{
    var response=await http.get(Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/getStudent'));
    if(response.statusCode==200)
    {
      //return json.decode(response.body)['response'];



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




  @override
  void dispose() {

    super.dispose();
  }
  late SnackBar sb;
  int length=0;
 Future<List<dynamic>> showData() async {

    var _message;
    var response = await http.post(
        // Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/senddatanextpg'),
        Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/senddatanextpg'),
        body: {
          "sRegNo": MyApp.Username,
        });

    if (response.statusCode == 200) {
      _message = response.body.toString();
     var jsonResult=convert.jsonDecode(response.body) as List<dynamic>;

     length=jsonResult.length;
      GetSemester();
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


  Future<String> GetSemester() async {


    var _message;
    var response = await http.post(
       //Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/senddatanextpg'),
         Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/ShowSemester'),
       // Uri.parse('http://'+MyApp.ip+'/FYPInvigilation/api/fyp/ShowSemester'),
        body: {
          "email": MyApp.Username,
        });

    MyApp.Semester=response.body.toString();

    return " ";



  }


  @override
  void initState() {
    super.initState();


  }


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async=>false,
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

                            child: Row(
                                children: [

                                  Container(

                                    margin: EdgeInsets.only(left: 10, top: 10),
                                    width: 210,
                                    height: 200,

                                     child: Column(
                                       children: [
                                         Row(
                                           children: [
                                             Text("Name: ",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                                             Text(snapshot.data![index]["sName"].toString(),style:TextStyle(fontSize: 18,)),
                                           ],

                                         ),
                                         SizedBox(
                                           height: 5,
                                         ),
                                         Row(
                                           children: [
                                             Text("Arid NO: ",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                                             Text(snapshot.data![index]["sRegNo"].toString(),style:TextStyle(fontSize: 18,)),
                                           ],

                                         ),
                                         SizedBox(
                                           height: 5,
                                         ),
                                          Row(
                                            children: [
                                              Text("Class: ",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                                             Text(snapshot.data![index]["sDiscipline"].toString(),style:TextStyle(fontSize: 18,)),
                                           ],

                                          ),
                                         SizedBox(
                                           height: 5,
                                         ),
                                         Row(
                                           children: [
                                             Text("Section: ",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                                             Text(snapshot.data![index]["sSection"].toString(),style:TextStyle(fontSize: 18,)),
                                           ],

                                         ),
                                         SizedBox(
                                           height: 5,
                                         ),
                                         Row(
                                           children: [
                                             Text("Semester: ",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                                             Text(snapshot.data![index]["Semester"].toString(),style:TextStyle(fontSize: 18,)),
                                           ],

                                         ),

                                       ],
                                     ),
                                  ),
                                  Container(

                                    margin: EdgeInsets.only(
                                       left: 1,  right: 7, top: 1, bottom: 40),
                                    width: 120,
                                    height: 120,
                    child: CircleAvatar(
                        backgroundImage: NetworkImage('http://'+MyApp.ip+''+ snapshot.data![index]["sPicture"].toString()
                        )




                                  ),


                                  )]),
                    ),


                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15, top: 25, right: 10,),
                          margin: EdgeInsets.only(top: 0, left: 5, right: 70),

                          width: 400,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.0),
                            color: Colors.grey,
                          ),


                          child: Text(
                            'Paper Start Time: 09:00: AM', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,

                          ),


                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15, top: 25, right: 10,),
                          margin: EdgeInsets.only(top: 0, left: 5, right: 70),

                          width: 400,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.0),
                            color: Colors.grey,
                          ),

                          child: Text(
                            'Paper End Time: 12:30: PM', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,

                          ),


                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(

                          padding: EdgeInsets.only(left: 15, top: 25, right: 10,),
                          margin: EdgeInsets.only(top: 0, left: 5, right: 70),

                          width: 400,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.0),
                            color: Colors.grey,
                          ),

                          child: Text(' Start In: 00:00:00 PM', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,

                          ),


                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 0, top: 0),
                          margin: EdgeInsets.only(top: 0, right: 100),
                          width: 150,
                          height: 50,
                         child: ElevatedButton(

                            child: Text("Read Rules",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),),
                            onPressed:() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new invigilatorpg156(id: widget.id,)),
                              );

                            },
                            style: ElevatedButton.styleFrom(

                              primary: Colors.blue,

                            ),

                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 0, top: 0),
                          margin: EdgeInsets.only(top: 10, right: 100),
                          width: 150,
                          height: 50,
                          child: ElevatedButton(

                            child: Text("Date Sheet", style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder: (context) => new invigilatorpgds(id: widget.id,)));



                            },

                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue,

                            ),
                          ),
                        ),
                        Container(

                          margin: EdgeInsets.only(top: 30, left: 180),
                          width: 150,
                          height: 50,
                          child: ElevatedButton(

                            child: Text("Start", style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new faceerror(id: widget.id,)),
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



