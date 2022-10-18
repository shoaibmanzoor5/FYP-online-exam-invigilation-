import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Student.dart';
import"dart:convert" as convert;
import 'invigilaterhomepage.dart';
import 'main.dart';
import 'mainpage.dart';

class submitpaper1 extends StatefulWidget {
  var id;


  submitpaper1({Key? key,required this.id}) : super(key: key);

  @override
  _submitpaper1State createState() => _submitpaper1State();
}

class _submitpaper1State extends State<submitpaper1> {
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
      print(MyApp.papername);
    });
    // MyApp.papername = response.body.toString();
    // print(MyApp.papername);
    // print(MyApp.papername);
  }



  List<StudentTable> stdList = [];

  //String baseUrl = "http:/192.168.10.9//";

  Future<void> getImage() async{
    var response=await http.get(Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/getStudent'));
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




  @override
  void dispose() {

    super.dispose();
  }
  late SnackBar sb;
  int length=0;
  Future<List<dynamic>> showData() async {
    print(widget.id);
    var _message;
    var response = await http.post(
      // Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/senddatanextpg'),
        Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/senddatanextpg'),
        body: {
          "sRegNo": MyApp.Username,
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
    print(widget.id);
    var _message;
    var response = await http.post(
      //Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/senddatanextpg'),
        Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/ShowSemester'),
        // Uri.parse('http://'+MyApp.ip+'/FYPInvigilation/api/fyp/ShowSemester'),
        body: {
          "email": MyApp.Username,
        });
    print("d2");
    print(widget.id);
    print (response.statusCode);
    print(response.body);
    MyApp.Semester=response.body.toString();
    print(MyApp.Semester);
    return " ";



  }


    // Or call your function here



  @override
  void initState() {
    super.initState();
     GetTime();
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
    title: Text('Student', style: TextStyle(
    color:Colors.white ,fontSize: 20,

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
    Text("Arid N0: ",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
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
      SizedBox(
        height: 5,
      ),
      Row(
        children: [
          //Text(MyApp.papername,style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
          Text("Paper Name: ",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
          Text(MyApp.papername.toString(),style:TextStyle(fontSize: 18,)),
        ],

      ),

    ],
    ),
    ),
    Container(

    margin: EdgeInsets.only(
    left: 10,  right: 7, top: 1, bottom: 40),
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
                        padding:EdgeInsets.only(left: 20,top:25,right: 20,bottom: 0),
                        margin: EdgeInsets.only(top: 30,right: 0,bottom: 20),

                        width: 320,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey),

                        child: Text(' Paper Submitted Successfully',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,

                        ),


                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left:0,top: 5),
                        margin: EdgeInsets.only(top:30,left: 10),
                        width:150,
                        height: 50,

                        child:ElevatedButton(


                          child: Text("Logout",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
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
                      ),
                      Container(
                        padding: EdgeInsets.only(left:0,top: 5),
                        margin: EdgeInsets.only(top:20,left: 10),
                        width:150,
                        height: 50,

                        child:ElevatedButton(


                          child: Text("Home",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                           onPressed:() {

                               Navigator.push(
                               context,
                                MaterialPageRoute(builder: (context) => new Studentpage(id:widget.id,)),
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