// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http ;
import 'package:image_picker/image_picker.dart';
import 'dart:io';
// import 'package:http/http.dart' as http;

import 'package:onlineexaminvigilation0001/Studentpaper2.dart';
import 'package:onlineexaminvigilation0001/recordingvideo/camera_page.dart';

import 'package:path_provider/path_provider.dart';

import 'FaceNoError2.dart';
import 'Student.dart';
import 'Studentpaper1.dart';

import 'main.dart';




class faceerror extends StatefulWidget {
  var id;
  var ui;

  faceerror({Key? key,required this.id}) : super(key: key);

  @override
  _invigilatorpg1State createState() => _invigilatorpg1State();
}

class _invigilatorpg1State extends State<faceerror> {
  String? msg = "";
  bool wrns = true;
 late String? receivetime='';
  Future<void> videotime() async {

      var _message;
      var response = await http.post(
        // Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/senddatanextpg'),
        Uri.parse(
            'http://'+MyApp.ip+'/invigilation/api/std/recevetime'),
      );

      print(response.body.toString());

      msg = response.body.toString();
       receivetime=msg;
      print('response'+receivetime!);
      print(receivetime);
      //await Future.delayed(Duration(seconds: 30));

  }

  succesAlerDialog(BuildContext context) {

    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('Successfully ' ),
         content: Text('Face Recognition',style: TextStyle(

           fontSize: 18,
           color: Colors.black,)),

        actions: [
          MaterialButton(

          child:Text('OK',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.blue,

          ),), onPressed: () async{
            await videotime();
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => new StudentPaperpage(id: widget.id, time: receivetime,)),
            );
          },)
        ],
      );
    }
    );
  }
  againAlerDialog(BuildContext context) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('Again'),
        content: Text('Face Not Recognize',style: TextStyle(

        fontSize: 18,
        color: Colors.black,)),
        actions: [
          MaterialButton(

            child:Text('OK',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.blue,

            ),), onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => new faceerror(id: widget.id,)),
            );
          },)
        ],
      );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
          children: [
            SizedBox(
              height: 100,
            ),

            Container(
              child: Icon(
                Icons.camera_enhance_rounded,
                color: Colors.black,
                size: MediaQuery
                    .of(context)
                    .size
                    .width * .6,
              ),
            ),
            Padding(

              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                child: Text('Capture Image with Camera', style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),),
                onPressed: () {

                  // Navigator.push(context,
                  //   MaterialPageRoute(builder: (context) => new StudentPaperpage(id: widget.id,)),
                  // );
                  face(context);

                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)),

                ),

              ),
            ),

            // Container(
            //
            //   padding: EdgeInsets.only(left: 30, top: 15.0, right: 5,),
            //   margin: EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0),
            //   width: 350,
            //   height: 90,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(35.0),
            //     color: Colors.red,
            //   ),
            //
            //   child: Text(
            //     'Face Not Recognizing   \n         Try Again', style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 25,
            //     color: Colors.black,
            //
            //   ),
            //
            //
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            // CircleAvatar(
            //
            //   radius: 40.0,
            //   backgroundColor: Colors.white,
            //   child: IconButton(
            //     color: Colors.black,
            //     onPressed: () async{
            //    await   videotime();
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => new StudentPaperpage(id: widget.id, time: receivetime,)),
            //       );
            //
            //     },
            //     icon: Icon(Icons.arrow_forward, size: 30,),
            //
            //   ),
            // ),
            Container(

              margin: EdgeInsets.only(top: 20, left: 100,right: 100),
              width: 50,
              height: 50,
              child: ElevatedButton(

                child: Text("Back", style: TextStyle(fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                         builder: (context) => new Studentpage(id: widget.id,)),
                   );
                  // // MaterialPageRoute(
                  // //     builder: (context) => new CameraPage(id: widget.id,)),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,

                ),
              ),
            ),
            // Container(
            //
            //   margin: EdgeInsets.only(top: 20, left: 100,right: 100),
            //   width: 50,
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
            // Container(
            //
            //   margin: EdgeInsets.only(top: 20, left: 100,right: 100),
            //   width: 50,
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
            //             builder: (context) => new camerascreen(id: widget.id,videoPath: '12',)),
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
          ]

      ),
    );
  }

  Future <void> face(context) async
  {
    final ImagePicker _picker = ImagePicker();
    var image =await  _picker.pickImage(source: ImageSource.camera);

    var postUri = Uri.parse("http://192.168.43.49:5000/face_recog");
    http.MultipartRequest request = new http.MultipartRequest("POST", postUri);
    request.files.add(
        await http.MultipartFile.fromPath(
            'image',
            image!.path)
    );

    http.Response response = await http.Response.fromStream(
        await request.send());

    var _msg = response.body.toString().replaceAll("'", "").replaceAll('"', "").replaceAll(
        "[", "").replaceAll("]", "");
    print(_msg);
    print(_msg);

    print(widget.id);
    if (_msg.contains(widget.id))
    {
        print('Im here');
        succesAlerDialog(context);
      //againAlerDialog(context);
    }
    else
    {againAlerDialog(context);
      //succesAlerDialog(context);
    }




    }

  // Future<void> takeScreenshot() async {
  //   var previewContainer;
  //   RenderRepaintBoundary boundary =
  //   previewContainer.currentContext.findRenderObject();
  //   var image = await boundary.toImage();
  //   final directory = (await getApplicationDocumentsDirectory()).path;
  //   var ui;
  //   ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //   Uint8List? pngBytes = byteData?.buffer.asUint8List();
  //   print(pngBytes);
  //   File imgFile =new File('$directory/screenshot.png');
  //   imgFile.writeAsBytes(pngBytes!);
  //   }
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
//file_picker: ^2.1.7