import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class mcqsoption extends StatefulWidget {
  var id;
  mcqsoption({Key? key,required this.id}) : super(key: key);

  @override
  State<mcqsoption> createState() => _mcqsoptionState();
}

class _mcqsoptionState extends State<mcqsoption> {
  final question=TextEditingController();
  final mcq1=TextEditingController();
  final mcq2=TextEditingController();
  final mcq3=TextEditingController();
  final mcq4=TextEditingController();
  final question2=TextEditingController();
  final mcq22=TextEditingController();
  final mcq23=TextEditingController();
  final mcq24=TextEditingController();
  final mcq25=TextEditingController();
  final question3=TextEditingController();
  final mcq26=TextEditingController();
  final mcq27=TextEditingController();
  final mcq28=TextEditingController();
  final mcq29=TextEditingController();
  final question4=TextEditingController();
  final mcq30=TextEditingController();
  final mcq31=TextEditingController();
  final mcq32=TextEditingController();
  final mcq33=TextEditingController();
  final question5=TextEditingController();
  final mcq34=TextEditingController();
  final mcq35=TextEditingController();
  final mcq36=TextEditingController();
  final mcq37=TextEditingController();
  final question6=TextEditingController();
  final mcq38=TextEditingController();
  final mcq39=TextEditingController();
  final mcq40=TextEditingController();
  final mcq41=TextEditingController();
  final question7=TextEditingController();
  final mcq42=TextEditingController();
  final mcq43=TextEditingController();
  final mcq44=TextEditingController();
  final mcq45=TextEditingController();
  final question8=TextEditingController();
  final mcq46=TextEditingController();
  final mcq47=TextEditingController();
  final mcq48=TextEditingController();
  final mcq49=TextEditingController();
  final question9=TextEditingController();
  final mcq50=TextEditingController();
  final mcq51=TextEditingController();
  final mcq52=TextEditingController();
  final mcq53=TextEditingController();
  final question10=TextEditingController();
  final mcq54=TextEditingController();
  final mcq55=TextEditingController();
  final mcq56=TextEditingController();
  final mcq57=TextEditingController();
  final mcq58=TextEditingController();
  final paperid=TextEditingController();
  final paper1=TextEditingController();


  Future<String> uploadpaper() async {

    var _message;
    var response = await http.post(

        Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/mcqsuploadpaper'),

        body: {
          "CCODE":paper1.text,
          "pID":paperid.text,
          "mcqsQuestion": question.text,
          "opt1": mcq1.text,
          "opt2": mcq2.text,
          "opt3": mcq3.text,
          "opt4": mcq4.text,

        });
    print("aaya g");
    response = await http.post(

        Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/mcqsuploadpaper'),

        body: {
          "CCODE":paper1.text,
          "pID":paperid.text,
          "mcqsQuestion": question2.text,
          "opt1": mcq22.text,
          "opt2": mcq23.text,
          "opt3": mcq24.text,
          "opt4": mcq25.text,

        });

    response = await http.post(

        Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/mcqsuploadpaper'),

        body: {
          "CCODE":paper1.text,
          "pID":paperid.text,
          "mcqsQuestion": question3.text,
          "opt1": mcq26.text,
          "opt2": mcq27.text,
          "opt3": mcq28.text,
          "opt4": mcq29.text,

        });
    print("Chaly");
    response = await http.post(

        Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/mcqsuploadpaper'),

        body: {
          "CCODE":paper1.text,
          "pID":paperid.text,
          "mcqsQuestion": question4.text,
          "opt1": mcq30.text,
          "opt2": mcq31.text,
          "opt3": mcq32.text,
          "opt4": mcq33.text,

        });
    print("ok");
    response = await http.post(

        Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/mcqsuploadpaper'),

        body: {
          "CCODE":paper1.text,
          "pID":paperid.text,
          "mcqsQuestion": question5.text,
          "opt1": mcq34.text,
          "opt2": mcq35.text,
          "opt3": mcq36.text,
          "opt4": mcq37.text,

        });
    print("okk");
    response = await http.post(

        Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/mcqsuploadpaper'),

        body: {
          "CCODE":paper1.text,
          "pID":paperid.text,
          "mcqsQuestion": question6.text,
          "opt1": mcq38.text,
          "opt2": mcq39.text,
          "opt3": mcq40.text,
          "opt4": mcq41.text,

        });
    print("okkk");
    response = await http.post(

        Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/mcqsuploadpaper'),

        body: {
          "CCODE":paper1.text,
          "pID":paperid.text,
          "mcqsQuestion": question7.text,
          "opt1": mcq42.text,
          "opt2": mcq43.text,
          "opt3": mcq44.text,
          "opt4": mcq45.text,

        });
    print("okkk");
    response = await http.post(

        Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/mcqsuploadpaper'),

        body: {
          "CCODE":paper1.text,
          "pID":paperid.text,
          "mcqsQuestion": question8.text,
          "opt1": mcq46.text,
          "opt2": mcq47.text,
          "opt3": mcq48.text,
          "opt4": mcq49.text,

        });
    print("okkk");
    response = await http.post(

        Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/mcqsuploadpaper'),

        body: {
          "CCODE":paper1.text,
          "pID":paperid.text,
          "mcqsQuestion": question9.text,
          "opt1": mcq50.text,
          "opt2": mcq51.text,
          "opt3": mcq52.text,
          "opt4": mcq53.text,

        });
    print("okkk");
    response = await http.post(

        Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/mcqsuploadpaper'),

        body: {
          "CCODE":paper1.text,
          "pID":paperid.text,
          "mcqsQuestion": question10.text,
          "opt1": mcq54.text,
          "opt2": mcq55.text,
          "opt3": mcq56.text,
          "opt4": mcq57.text,

        });
    print("d2");


    print (response.statusCode);
    print(response.body);
    print (response.statusCode);
    print(response.body);
    MyApp.Semester=response.body.toString();
    print(MyApp.Semester);
    return " ";



  }




  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(

              backgroundColor: Colors.blue,
              title: Text('Invigilator', style: TextStyle(
                  color: Colors.white,

                  fontWeight: FontWeight.bold
              ),),
            ),
            body: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(
                        top: 20,
                        right: 10.0,
                        left: 30.0),

                    child: Column(
                        children: <Widget>[
                         //  Container(
                         // child: Row(
                         //      children: <Widget>[
                         //        Container(
                         //
                         //          margin: EdgeInsets.only(left: 10),
                         //          padding: EdgeInsets.only(top: 5,),
                         //          width: 160,
                         //          height: 60,
                         //          child: TextField(
                         //            controller: papername,
                         //            decoration: InputDecoration(
                         //                fillColor: Colors.grey.shade100,
                         //
                         //                filled: true,
                         //                hintText: 'Paper Name',
                         //                border: OutlineInputBorder(
                         //                    borderRadius: BorderRadius.circular(
                         //                        5))),),),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(

                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: paperid,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Enter paper  id',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),

                          //]
                         //),),
                          SizedBox(
                            height: 10,
                          ),
                    Container(

                               margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.only(top: 5,),
                                width: 160,
                                height: 60,
                                child: TextField(
                                  controller: paper1,
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,

                                      filled: true,
                                      hintText: 'Paper Name',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                             5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(


                            child: TextField(
                              controller: question,

                              //onChanged: (value) => UserNameField = value,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: 'Question1 Write',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq1,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option A',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq2,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option B',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq3,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option C',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq4,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option D',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 20,
                          ),
                          Container(


                            child: TextField(
                              controller: question2,

                              //onChanged: (value) => UserNameField = value,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: 'Question2 Write',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq22,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option A',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq23,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option B',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq24,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option C',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq25,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option D',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 20,
                          ),
                          Container(


                            child: TextField(
                              controller: question3,

                              //onChanged: (value) => UserNameField = value,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: 'Question3 Write',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq26,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option A',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq27,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option B',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq28,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option C',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq29,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option D',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 20,
                          ),
                          Container(


                            child: TextField(

                              controller: question4,
                              //onChanged: (value) => UserNameField = value,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: 'Question4 Write',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq30,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option A',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq31,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option B',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq32,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option C',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq33,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option D',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 20,
                          ),
                          Container(


                            child: TextField(
                              //controller: idd,
                              controller: question5,
                              //onChanged: (value) => UserNameField = value,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: 'Question5 Write',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq34,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option A',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq35,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option B',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq36,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option C',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq37,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option D',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 20,
                          ),
                          Container(


                            child: TextField(
                              controller: question6,

                              //onChanged: (value) => UserNameField = value,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: 'Question6 Write',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq38,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option A',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq39,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option B',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq40,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option C',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq41,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option D',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 20,
                          ),
                          Container(


                            child: TextField(
                              //controller: idd,
                              controller: question7,
                              //onChanged: (value) => UserNameField = value,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: 'Question7 Write',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq42,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option A',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq43,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option B',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq44,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option C',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq45,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option D',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 20,
                          ),
                          Container(


                            child: TextField(
                              //controller: idd,
                              controller: question8,
                              //onChanged: (value) => UserNameField = value,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: 'Question8 Write',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq46,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option A',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq47,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option B',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq48,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option C',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq49,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option D',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 20,
                          ),
                          Container(


                            child: TextField(
                              controller: question9,
                              //controller: idd,

                              //onChanged: (value) => UserNameField = value,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: 'Question9 Write',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq50,
                              // obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option A',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq51,
                              // obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option B',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq52,
                              // obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option C',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq53,
                              // obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option D',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 20,
                          ),
                          Container(


                            child: TextField(
                              //controller: idd,
                              controller: question10,
                              //onChanged: (value) => UserNameField = value,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: 'Question10 Write',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq54,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option A',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq55,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option B',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq56,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option C',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            margin: EdgeInsets.only(right: 140),
                            padding: EdgeInsets.only(top: 5,),
                            width: 160,
                            height: 60,
                            child: TextField(
                              controller: mcq57,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,

                                  filled: true,
                                  hintText: 'Option D',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          5))),),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 0, top: 0),
                            margin: EdgeInsets.only(
                                left: 70, right: 10, bottom: 10),
                            width: 150,
                            height: 50,
                            child: ElevatedButton(

                              child: Text("Upload", style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,),),
                              onPressed: () {
                                uploadpaper();
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => new POrder()),
                                // );

                              },
                              style: ElevatedButton.styleFrom(

                                primary: Colors.blue,

                              ),

                            ),
                          ),
                          // TextField(
                          // //controller: password,
                          // obscureText: true,
                          // decoration: InputDecoration(
                          // fillColor: Colors.grey.shade100,
                          //
                          // filled: true,
                          // hintText: 'Option 1',
                          // border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(10))),),

                        ])))));
  }
}
