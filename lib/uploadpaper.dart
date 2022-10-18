
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'Papersubmit.dart';
import 'main.dart';
import 'package:path/path.dart';
import 'package:ftpconnect/ftpConnect.dart';
import 'package:file_picker/file_picker.dart';
// import 'dart:html';
import 'package:path/path.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftpconnect/ftpConnect.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'invigilatorpage1.dart';
import 'main.dart';
import 'mcqsoption.dart';

class uploadpaper extends StatefulWidget {
  var id;

   uploadpaper({Key? key,required this.id}) : super(key: key);
  @override
  _uploadpaperState createState() => _uploadpaperState();
}

class _uploadpaperState extends State<uploadpaper> {

  File? fil;
  File? filee;
  late SnackBar sb;
  var n;
  Future selectfile() async
  {
    final res= await FilePicker.platform.pickFiles(allowMultiple: false);
    if(res==null) return;
    final path=res.files.single.path;
    setState(() {
      fil=File(path!);
       n=basename(fil!.path);
      print(n);
    });
  }
  Future sendftp() async
  {
    selectfile();
    var response;

    FTPConnect ftpConnect = FTPConnect(MyApp.ip,user:'ftp-user', pass:'1234');
    try {
      File fileToUpload =   File(fil!.path);
      print("connected");
      await ftpConnect.connect();
      print("connecT");
      await ftpConnect.uploadFile(fileToUpload);
      await ftpConnect.disconnect();
      print("disconnected");

      print("11");
      var response = await http.post(
        // Uri.parse('http://'+MyApp.ip+'/FYPInvigilation/api/fyp/Login'),
          Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/uploadpaper'),
          body: {
            "eDate": _selectedindexFordate+"-0"+_selectedindexFormonth+"-"+_selectedindexForday,
            "sHours": _selectedindexForstarttime,
            "eHours": _selectedindexForendtime,
            "smeridiam":_selectedindexFortime,
            "emeridiam":_selectedindexFortime1,
            "section":_selectedindexForTeacher+"th",
            "papername":_selectedindexForsubject,
            "filepathpdf":n.toString(),
            "papertype":"subjective"
          }).timeout(const Duration(seconds: 60));

      print(response.statusCode);
    } catch (e) {
      //error
    }

  }





  // Future<String> getPhotos ()async{
  //   var response = await http.post(
  //       Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/uploadpaper'),
  //       body: {
  //         "eID": _selectedindexFordate+_selectedindexFormonth+_selectedindexForday,
  //         "sHours": _selectedindexFortime1,
  //         "eHours": _selectedindexFortime,
  //         "section":_selectedindexForTeacher,
  //         "papername": _selectedindexForsubject,
  //       }).timeout(const Duration(minutes: 5));
  //
  //
  //   return " " ;
  //
  //
  // }

  String _selectedindexForTeacher = 'Select Semester';
  String _selectedindexForsubject = 'Select Subject';
  String _selectedindexFordate = 'Select Date';
  String _selectedindexFormonth = 'Select month';
  String _selectedindexForday = 'Select day';
  String _selectedindexFortime = 'Select am';
  String _selectedindexFortime1 = 'Select pm';
  String _selectedindexForstarttime = 'Start Time';
  String _selectedindexForendtime = 'End Time';
  List<String> endtime = <String>[
    'End Time',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',


  ];
  List<String> starttime = <String>[
    'Start Time',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',


  ];
  List<String> Selecttime1 = <String>[
    'Select pm',
    'AM',
    'PM',


  ];
  List<String> Selecttime = <String>[
    'Select am',
    'AM',
    'PM',


  ];
  List<String> Selectday = <String>[
    'Select day',
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',

  ];
  List<String> Selectmonth = <String>[
    'Select month',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',

  ];
  List<String> Selectdate = <String>[
    'Select Date',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',

  ];
  List<String> Selectsubject = <String>[
    'Select Subject',
    'MTH-310',
    'CS-232',
    'CS-400',
    'MGT-411',
    'CS-323',




  ];
  List<String> SelectTeacher = <String>[
    'Select Semester',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',



  ];
  String? value;

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

        child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20, left: 10),
            child: Row(
              children: [
                Text("Select Semester", style: TextStyle(
                    color: Colors.black, fontSize: 20,)),
                Container(
                    width: 170,
                    margin: EdgeInsets.only(left: 15,right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    color: Colors.blue,
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton(

                          isExpanded: true,
                          dropdownColor: Colors.blueGrey,
                          value: _selectedindexForTeacher,
                          onChanged: (value) =>
                              setState(() {
                                _selectedindexForTeacher =
                                value as String;

                              }),
                          items: SelectTeacher
                              .map((item) =>
                              DropdownMenuItem(
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                value: item,
                              ))
                              .toList(),
                        ))),
              ],

            ),

          ),

          Container(
            margin: EdgeInsets.only(top: 20, left: 10),
            child: Row(
              children: [
                Text("Select Subject", style: TextStyle(
                    color: Colors.black, fontSize: 20)),
                Container(
                    width: 170,
                    margin: EdgeInsets.only(left: 15,right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    color: Colors.blue,
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton(

                          isExpanded: true,
                          dropdownColor: Colors.blueGrey,
                          value: _selectedindexForsubject,
                          onChanged: (value) =>
                              setState(() {
                                _selectedindexForsubject =
                                value as String;

                              }),
                          items: Selectsubject
                              .map((item) =>
                              DropdownMenuItem(
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                value: item,
                              ))
                              .toList(),
                        ))),
        //   Container(
        //
        //   width: 210,
        //   height: 240,
        //      child: DropdownButton<String>(
        //        value: value,
        //         iconSize: 45
        //        icon: Icon(Icon.arrow_drop_down,color: Colors.white,),
        //         items: <String>['A', 'B', 'C', 'D'].map((String value) {
        //           return DropdownMenuItem<String>(
        //             value: value,
        //             child: Text(value, style: TextStyle(
        //
        //
        //                 fontWeight: FontWeight.bold,fontSize: 20
        //             ),),
        //           );
        //         }).toList(),
        //         onChanged: (_) {},
        //       )
        // ),
          ])),
          Container(
            margin: EdgeInsets.only(top: 20, left: 10),
            child: Row(
              children: [
                Text("Select date", style: TextStyle(
                    color: Colors.black, fontSize: 20)),
                Container(
                    width: 170,
                    margin: EdgeInsets.only(left: 40,right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    color: Colors.blue,
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton(

                          isExpanded: true,
                          dropdownColor: Colors.blueGrey,
                          value: _selectedindexFordate,
                          onChanged: (value) =>
                              setState(() {
                                _selectedindexFordate =
                                value as String;

                              }),
                          items: Selectdate
                              .map((item) =>
                              DropdownMenuItem(
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                value: item,
                              ))
                              .toList(),
                        ))),
              ],

            ),

          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 10),
            child: Row(
              children: [
                Text("Select Month", style: TextStyle(
                    color: Colors.black, fontSize: 20)),
                Container(
                    width: 170,
                    margin: EdgeInsets.only(left: 25,right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    color: Colors.blue,
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton(

                          isExpanded: true,
                          dropdownColor: Colors.blueGrey,
                          value: _selectedindexFormonth,
                          onChanged: (value) =>
                              setState(() {
                                _selectedindexFormonth =
                                value as String;

                              }),
                          items: Selectmonth
                              .map((item) =>
                              DropdownMenuItem(
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                value: item,
                              ))
                              .toList(),
                        ))),
              ],

            ),

          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 10),
            child: Row(
              children: [
                Text("Select day", style: TextStyle(
                    color: Colors.black, fontSize: 20)),
                Container(
                    width: 170,
                    margin: EdgeInsets.only(left: 48,right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    color: Colors.blue,
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton(

                          isExpanded: true,
                          dropdownColor: Colors.blueGrey,
                          value: _selectedindexForday,
                          onChanged: (value) =>
                              setState(() {
                                _selectedindexForday =
                                value as String;

                              }),
                          items: Selectday
                              .map((item) =>
                              DropdownMenuItem(
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                value: item,
                              ))
                              .toList(),
                        ))),
              ],

            ),

          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 10),
            child: Row(
              children: [
                Text("Start Time", style: TextStyle(
                    color: Colors.black, fontSize: 20)),
                Container(
                    width: 170,
                    margin: EdgeInsets.only(left: 48,right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    color: Colors.blue,
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton(

                          isExpanded: true,
                          dropdownColor: Colors.blueGrey,
                          value: _selectedindexForstarttime,
                          onChanged: (value) =>
                              setState(() {
                                _selectedindexForstarttime =
                                value as String;

                              }),
                          items: starttime
                              .map((item) =>
                              DropdownMenuItem(
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                value: item,
                              ))
                              .toList(),
                        ))),
              ],

            ),

          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 10),
            child: Row(
              children: [
                Text("End Time", style: TextStyle(
                    color: Colors.black, fontSize: 20)),
                Container(
                    width: 170,
                    margin: EdgeInsets.only(left: 55,right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    color: Colors.blue,
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton(

                          isExpanded: true,
                          dropdownColor: Colors.blueGrey,
                          value: _selectedindexForendtime,
                          onChanged: (value) =>
                              setState(() {
                                _selectedindexForendtime =
                                value as String;

                              }),
                          items: endtime
                              .map((item) =>
                              DropdownMenuItem(
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                value: item,
                              ))
                              .toList(),
                        ))),
              ],

            ),

          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 10),
            child: Row(
              children: [
                Text("Select AM", style: TextStyle(
                    color: Colors.black, fontSize: 20)),
                Container(
                    width: 170,
                    margin: EdgeInsets.only(left: 48,right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    color: Colors.blue,
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton(

                          isExpanded: true,
                          dropdownColor: Colors.blueGrey,
                          value: _selectedindexFortime,
                          onChanged: (value) =>
                              setState(() {
                                _selectedindexFortime =
                                value as String;

                              }),
                          items: Selecttime
                              .map((item) =>
                              DropdownMenuItem(
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                value: item,
                              ))
                              .toList(),
                        ))),
              ],

            ),

          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 10),
            child: Row(
              children: [
                Text("Select PM", style: TextStyle(
                    color: Colors.black, fontSize: 20)),
                Container(
                    width: 170,
                    margin: EdgeInsets.only(left:48,right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    color: Colors.blue,
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton(

                          isExpanded: true,
                          dropdownColor: Colors.blueGrey,
                          value: _selectedindexFortime1,
                          onChanged: (value) =>
                              setState(() {
                                _selectedindexFortime1 =
                                value as String;

                              }),
                          items: Selecttime1
                              .map((item) =>
                              DropdownMenuItem(
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                value: item,
                              ))
                              .toList(),
                        ))),
              ],

            ),

          ),
          SizedBox(height: 20),
          Container(
              width: 360,
              height: 70,

              child: Row(
                  children: [
            Container(
                height: 50,
                width: 120,
                margin: EdgeInsets.only(top: 5,right: 10,left:10,bottom: 5),
                child: ElevatedButton(
                    child: Text('Upload ', style: TextStyle(
                        color: Colors.white,

                        fontWeight: FontWeight.bold,fontSize: 25
                    ),), onPressed: () {
                   sendftp();
                   // Navigator.push(
                   //   context,
                   //   MaterialPageRoute(
                   //       builder: (context) => new mcqsoption(id: widget.id,)),
                   // );


                })),

          Container(
            width: 120,
            height: 90,

            padding: EdgeInsets.only(top: 5,right: 10,bottom: 10),
            margin: EdgeInsets.only(top: 5,right: 50,left:50,bottom: 5),

            child:ElevatedButton(


              child: Text("Next",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
              onPressed:() {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new VideoPlayerScreen(id: widget.id, present_Students: [],)),
                );


              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,

              ),
            ),
          ),
]))

        ]))));
  }

}
