import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'Papersubmit.dart';
import 'Studentpaper1.dart';
import 'file.dart';
import 'fileview.dart';
import 'main.dart';
import 'package:path/path.dart';
import 'package:ftpconnect/ftpConnect.dart';
import 'package:file_picker/file_picker.dart';

class ftpser extends StatefulWidget {
  var id;
  var times;
   ftpser({Key? key,required this.id,required this.times, required timesget}) : super(key: key);

  @override
  State<ftpser> createState() => _ftpserState();
}

class _ftpserState extends State<ftpser> {
   var sendfile;
  File? fil;
  File? filee;
  late SnackBar sb;
  Future selectfile() async
  {
    final res= await FilePicker.platform.pickFiles(allowMultiple: false);
    if(res==null) return;
    final path=res.files.single.path;
    setState(() {
      fil=File(path!);
    });
  }
  Future sendftp() async
  {
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
    } catch (e) {
      //error
    }

  }
  Future<void> _fileMock(String strFileName) async {
    final Directory appDocDir  = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    filee = File('$appDocPath/$strFileName');
    print('appDocPath : $appDocPath');
    print('file : $filee');

  }
var papername;
//download file
  Future<void> viewfile() async {
    try {
      FTPConnect ftpConnect = FTPConnect(
          MyApp.ip, user: 'ftp-user', pass: '1234');
      bool bRes = await ftpConnect!.connect();
      var fname=MyApp.paperpath.replaceAll('"', "");
      //var fname="CG Mid Fall 2020 BS (Afrasiab) (2).pdf";
      print('papername:'+fname.toString());
      papername=fname;
      print('papercg:'+papername.toString());
      _fileMock(fname);
      await ftpConnect.connect();
      print("connected");
      // await ftpConnect.changeDirectory(pth);
      await ftpConnect.downloadFileWithRetry(fname, filee!);
      print('path2 : ${filee!.path}');
      await ftpConnect.disconnect();

      print('file Name : ${filee!}');
      OpenFile.open(filee!.path);
      sendfile=filee;
      print('ssName : ${sendfile!}');
    } catch (e) {
      print('Error : ${e.toString()}');
    }
  }
  createAlerDialog(BuildContext context) {

    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('Successfully ' ),
        content: Text('Upload File',style: TextStyle(

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
              MaterialPageRoute(builder: (context) => new ftpser(id: widget.id, timesget: widget.times, times: null,  )),
            );
          },)
        ],
      );
    }
    );}

  submitpaperalert(BuildContext context) {

    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('Successfully ' ),
        content: Text('Paper Submitted',style: TextStyle(

          fontSize: 18,
          color: Colors.black,)),

        actions: [
          MaterialButton(

            child:Text('OK',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.blue,

            ),), onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => new submitpaper1(id: widget.id,)),
            );
          },)
        ],
      );
    }
    );}
  //createAlerDialog(context);
  @override
  Widget build(BuildContext context) {
    final filename=fil !=null? basename(fil!.path):'No File Selected';
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
              children: [
                SizedBox(height: 40),
                Container(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                        child: Text('Select File', style: TextStyle(
                            color: Colors.white,

                            fontWeight: FontWeight.bold,fontSize: 25
                        ),), onPressed: () {
                      selectfile();

                    })
                ),
                SizedBox(height: 10),
                Text(filename),
                SizedBox(height: 30),
                Container(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                        child: Text('Upload ', style: TextStyle(
                            color: Colors.white,

                            fontWeight: FontWeight.bold,fontSize: 25
                        ),), onPressed: () {
                      sendftp();
                      createAlerDialog(context);

                    })
                ),SizedBox(height: 40),
                Container(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                        child: Text('View File', style: TextStyle(
                            color: Colors.white,

                            fontWeight: FontWeight.bold,fontSize: 25
                        ),), onPressed: () {
                      // viewfile();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => new fileview(id: widget.id, paper: papername,)),
                      // );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new fileview(id: widget.id, paper: papername, file: sendfile, timeget: widget.times,)),
                      );
                    })
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  height: 70,

                  padding: EdgeInsets.only(left: 1,top: 5,right: 0,bottom: 10),
                  margin: EdgeInsets.only(top: 5,right: 50,left:50,bottom: 5),

                  child:ElevatedButton(


                    child: Text("Submit",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                    onPressed:() {
                      submitpaperalert(context);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => new submitpaper1(id: widget.id,)),
                      // );


                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,

                    ),
                  ),
                ),


              ])
      ),
    );
  }
}