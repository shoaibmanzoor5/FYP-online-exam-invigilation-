import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class PhotoApiMubashirGet extends StatefulWidget {
  const PhotoApiMubashirGet({ Key? key, id }) : super(key: key);

  @override
  State<PhotoApiMubashirGet> createState() => _PhotoApiMubashirGetState();
}

class _PhotoApiMubashirGetState extends State<PhotoApiMubashirGet> {

  List<StudentTable> stdList = [];

  String baseUrl = "http://192.168.43.56/";

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Image'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          ElevatedButton(
              onPressed: () async{
                await getImage();
              },
              child: Text("Get Image")
          ),

          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: stdList.length,
            itemBuilder: (context, index){
              return ListTile(
                  leading: Text(stdList[index].sID.toString()),
                  title: Text(stdList[index].sName.toString()),
                  // subtitle: Text(bdata[index].bpubyear.toString()),
                  trailing: Hero(
                    tag: '',
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            baseUrl + stdList[index].Picture.toString()
                        )
                    ),
                  )
              );
            },
            shrinkWrap: true,
          )


        ],
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
      Picture: json['sPicture'],
      section: json['section'],
      groups: json['groups'],
      sclass: json['sclass'],
    );
  }
}