
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlineexaminvigilation0001/filelist.dart';
import 'package:onlineexaminvigilation0001/list.dart';
import 'package:open_file/open_file.dart';

import 'Papersubmit.dart';


class filees extends StatefulWidget {
  const filees({Key? key}) : super(key: key);

  @override
  State<filees> createState() => _MyAppState();

}

class _MyAppState extends State<filees> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  const MyHomePage({Key? key}) : super(key: key);

  get id => null;

  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String fileType = 'All';
  var fileTypeList = ['All', 'Image', 'Video', 'Audio','MultipleFile'];

  FilePickerResult? result;
  PlatformFile? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue,
        title: Text('Student', style: TextStyle(
            color:Colors.white ,

            fontWeight: FontWeight.bold
        ),),),

      body: Container(
        margin: EdgeInsets.only(top: 100,left: 10,right: 10),

        width: 400,
        height: 500,

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.grey),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [

             Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Selected File Type:  ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                DropdownButton(
                  value: fileType,
                  items: fileTypeList.map((String type) {
                    return DropdownMenuItem(
                        value: type,
                        child: Text(
                          type,
                          style: TextStyle(fontSize: 20),
                        ));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      fileType = value!;
                      file = null;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(

              onPressed: () async {
                pickFiles(fileType);
              },
              child: Text('Pick file'),
            ),
             if(file != null) fileDetails(file!),
            if (file != null) ElevatedButton(onPressed: (){viewFile(file!);},child: Text('View Selected File'),),
            Container(
              width: 120,
              height: 60,

              padding: EdgeInsets.only(left: 1,top: 5,right: 0,bottom: 10),
              margin: EdgeInsets.only(top: 5,right: 50,left:50,bottom: 5),

              child:ElevatedButton(


                child: Text("Submit",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.white),),
                onPressed:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new submitpaper1(id: widget.id,)),
                  );


                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,

                ),
              ),
            ),
    ],
        ),
      ),

    );
  }


  Widget fileDetails(PlatformFile file){
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final size  = (mb>=1)?'${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('File Name: ${file.name}'),
          Text('File Size: $size'),
          Text('File Extension: ${file.extension}'),
          Text('File Path: ${file.path}'),
        ],
      ),
    );

  }

  void pickFiles(String? filetype) async {
    switch (filetype) {
      case 'Image':
        result = await FilePicker.platform.pickFiles(type: FileType.image);
        if (result == null) return;
        file = result!.files.first;
        setState(() {});
        break;
      case 'Video':
        result = await FilePicker.platform.pickFiles(type: FileType.video);
        if (result == null) return;
        file = result!.files.first;
        setState(() {});
        break;

      case 'Audio':
        result = await FilePicker.platform.pickFiles(type: FileType.audio);
        if (result == null) return;
        file = result!.files.first;
        setState(() {});
        break;
      case 'All':
        result = await FilePicker.platform.pickFiles();
        if (result == null) return;
        file = result!.files.first;
        setState(() {});
        break;
      case 'MultipleFile':
        result = await FilePicker.platform.pickFiles(allowMultiple: true);
        if (result == null) return;
        loadSelectedFiles(result!.files);
        break;
    }
  }

  // multiple file selected
  // navigate user to 2nd screen to show selected files
  void loadSelectedFiles(List<PlatformFile> files){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => FileList(files: files, onOpenedFile:viewFile ))
    );
  }

  // open the picked file
  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}