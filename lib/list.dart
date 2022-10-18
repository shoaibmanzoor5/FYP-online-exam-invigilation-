import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlineexaminvigilation0001/paperfile.dart';
import 'dart:convert' as convert;
import 'dart:math';
import 'dart:async';
import 'Papersubmit.dart';
import 'Studentpaper2.dart';
import 'filepick.dart';
import 'ftpser.dart';
import 'main.dart';

class CaptainList extends StatefulWidget {

  var id;
  CaptainList({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<CaptainList> createState() => _CaptainListState();
}

class _CaptainListState extends State<CaptainList> {
   bool loop = true;

  int length = 0;

  final _fair = TextEditingController();

  final List<TextEditingController> _offer = [];

  static List<dynamic> jsonResult = [];

  late SnackBar sb;

  String ip = MyApp.ip;

   bool role=true;
    List <bool> selectA=[];
    List <bool> selectB=[];
    List <bool> selectC=[];
    List <bool> selectD=[];

   void initState() {
     print("Build Completed");
     // TODO: implement initState



     print("Build Completed");
     showData();

   }
var extra;
  Future<List<dynamic>> showData() async {
    print("w");
    var _message;
    var response = await http.post(
        Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/ShowPaper'),
        body: {
          "CCODE": MyApp.papername.replaceAll("[", '').replaceAll("]", '').replaceAll('"', '').replaceAll('"', ''),
        });

    if (response.statusCode == 200) {
      _message = response.body.toString();
      var jsonResult=convert.jsonDecode(response.body) as List<dynamic>;
      extra=jsonResult;
      length=jsonResult.length;
      for(int i =0 ; i < length;i++)
        {

          selectA.add(false);
          selectB.add(false);
          selectC.add(false);
          selectD.add(false);
        }

      return jsonResult;


      //obj

      //
    }
    else
    {
      sb = SnackBar(content: Text('Plzz Enter Correct Data'));
      ScaffoldMessenger.of(context).showSnackBar(sb);
    }
    return[];
  }



   Future<String> SubmitPaper() async {
     print("w");
     var _message;
     for(int i=0; i < length;i++) {
       var Ans="A";
       if(selectA[i]==true)
         Ans="A";
       if(selectB[i]==true)
         Ans="B";
       if(selectC[i]==true)
         Ans="C";
       if(selectD[i]==true)
         Ans="D";

       var response = await http.post(
           Uri.parse('http://' + MyApp.ip + '/invigilation/api/std/uploadMCQBYStudent'),
           body: {
             "Question": extra[i]["mcqsQuestion"],
             "pID": extra[i]["pID"].toString(),
             "TeacherID": "zahidahmed@biit.edu.pk",
             "Answer":Ans
           });
     }
    return "ok";
   }
   createAlerDialog(BuildContext context) {

     return showDialog(context: context, builder: (context) {
       return AlertDialog(
         title: Text('Successfully ' ),
         content: Text('Submit MCQS',style: TextStyle(

           fontSize: 18,
           color: Colors.black,)),

         // actions: [
         //   MaterialButton(
         //
         //     child:Text('OK',style: TextStyle(
         //       fontWeight: FontWeight.bold,
         //       fontSize: 15,
         //       color: Colors.blue,
         //
         //     ),), onPressed: () {
         //     // Navigator.push(context,
         //     //   MaterialPageRoute(builder: (context) => new CaptainList(id: widget.id,)),
         //     // );
         //   },)
         // ],
       );
     }
     );}
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student'),
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
        Container(
            width: 400,
            height: 60,
          child: Row(
            children: [


        Container(
        width: 120,
        height: 60,
        color: Colors.white,
          padding: EdgeInsets.only(left: 1,top: 5,right: 0,bottom: 10),
          margin: EdgeInsets.only(top: 0,right: 105,left:15,bottom: 0),


          child:ElevatedButton(


          child: Text("Start time  09:00 AM",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
          onPressed:() {



          },
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,

          ),
        ),
      ),
              SizedBox(
                width: 0.0,
              ),
              Container(
                width: 120,
                height: 60,
                color: Colors.white,
                padding: EdgeInsets.only(left: 1,top: 5,right: 10,bottom: 10),
                margin: EdgeInsets.only( left:0,),


                child:ElevatedButton(


                  child: Text("End time  12:00 PM",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                  onPressed:() {



                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,

                  ),
                ),
              ),
          ])),
          SizedBox(height: 10,),





          Expanded(
            child: Container(
              child: FutureBuilder<List<dynamic>>(
                future: showData(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(

                        itemCount: length,
                        itemBuilder: (context, index) {

                          return Column(
                            children: [
                             Container(
                              width: 390,
                              height: 50,

                              padding: EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 10),
                          margin: EdgeInsets.only(top: 0,left:5,right: 5,bottom: 0),
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.grey),

                          child: Row(
                          children:<Widget> [
                          Text(
                          "Q$index",
                          style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                          ),
                          ),
                          SizedBox(
                          width: 10.0,
                          ),
                          Text(
                          snapshot.data![index]["mcqsQuestion"].toString(),
                          style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                          ),
                          ),



                          ],
                          ),
                          ),
                          Column(

                          children: <Widget>[
                          ListTile(

                          title: Text(snapshot.data![index]["opt1"].toString(),style: TextStyle(fontSize: 20.0),),
                          leading: Checkbox(
                            value: selectA[index],
                            onChanged: (value) {
                              //print("dddddddddddddddddddddddddddddddddd");
                             this. setState(() {

                                selectA[index] = value!;
                                selectB[index] = false;
                                selectC[index] = false;
                                selectD[index] = false;
                              });
                              print(selectA[index]);
                            },
                          ),
                          )
                          ],
                          ),
                          Column(

                          children: <Widget>[
                          ListTile(

                          title: Text(snapshot.data![index]["opt2"].toString(),style: TextStyle(fontSize: 20.0),),
                          leading: Checkbox(
                            value: selectB[index],
                            onChanged: (value) {
                              this.setState(() {
                                selectA[index] = false;
                                selectB[index] = value!;
                                selectC[index] = false;
                                selectD[index] = false;

                              });
                            },
                          ),
                          )
                          ],
                          ),
                          Column(

                          children: <Widget>[
                          ListTile(
                          title: Text(snapshot.data![index]["opt3"].toString(),style: TextStyle(fontSize: 20.0),),
                          leading: Checkbox(
                            value: selectC[index],
                            onChanged: (value) {
                              this.setState(() {
                                selectA[index] = false;
                                selectB[index] = false;
                                selectC[index] = value!;
                                selectD[index] = false;
                              });
                            },
                          ),
                          )
                          ],
                          ),
                          Column(

                          children: <Widget>[
                          ListTile(

                          title: Text(snapshot.data![index]["opt4"].toString(),style: TextStyle(fontSize: 20.0),),
                          leading: Checkbox(
                          value:  selectD[index],
                          onChanged: (value) {
                            print("2");
                          this.setState(() {
                            print("1");
                            selectA[index] = false;
                            selectB[index] = false;
                            selectC[index] = false;
                            selectD[index] = value!;
                          });
                          },
                          ),
                          )
                          ],
                          ),
                            ]);


                          });
                  }
                },
              ),
            ),
          ),

          SizedBox(
          width: 10.0,
          ),
             Container(
          width: 120,
          height: 60,

               padding: EdgeInsets.only(left: 1,top: 5,right: 0,bottom: 10),
               margin: EdgeInsets.only(top: 5,right: 50,left:50,bottom: 5),

               child:ElevatedButton(


    child: Text("Submit",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.white),),
    onPressed:() {

      createAlerDialog(context);
         SubmitPaper();
      Navigator.push(context,
             MaterialPageRoute(builder: (context) => new submitpaper1(id: widget.id,)),
                );

    },
    style: ElevatedButton.styleFrom(
    primary: Colors.blue,

    ),
    ),
    ),
          SizedBox(
            width: 10.0,
          ),
    ]));


  }

  @override
  dispose() async {
    super.dispose();
    loop = false;
    // TODO: implement dispose
  }
}