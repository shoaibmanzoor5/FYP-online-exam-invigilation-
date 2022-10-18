import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:onlineexaminvigilation0001/main.dart';

class RecordedVideo extends StatefulWidget {
  const RecordedVideo({ Key? key, required id }) : super(key: key);

  @override
  State<RecordedVideo> createState() => _RecordedVideoState();
}

class _RecordedVideoState extends State<RecordedVideo> {

  void initState(){
    super.initState();
    getVideo();
  }
  List<SavePython> videouploadList = [];


  Future<void> getVideo() async{
    var response=await http.get(Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/getPythonVideo'));
    if(response.statusCode==200)
    {
      print("Successfull Show Record");


      Iterable listt = jsonDecode(response.body);
      print(listt);
      var videouploadList=listt.map((e) => SavePython.fromJson(e)).toList();
      setState(() {

      });
    }
    else
      throw Exception('Failed to load data');

  }
  String _location(dynamic media)
  {
    return media;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recorded Videos'),
      ),

      body: Container(
        padding: EdgeInsets.all(15),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            // itemCount: videouploadList.length,
            itemCount: videouploadList.length,
            itemBuilder: (context,index){
              String myUrl ='http://'+ MyApp.ip + Uri.parse("/Invigilation/Content/Videoupload/imran.mp4").toString();
              VlcPlayerController _vlcPlayer = VlcPlayerController.network(myUrl,autoPlay: true,options: VlcPlayerOptions());
              return InkWell(
                onTap: (){
                  String videopath=videouploadList[index].id.toString();

                  List<SavePython> data=[];
                  for(int i=0;i<videouploadList.length;i++)
                  {
                    if(videouploadList[i].videopath==videopath)
                      data.add(videouploadList[i]);
                  }
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => RecordedVideoOnClick(videouplod: videouploadList[index], videouploadList:data,)));

                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue.withOpacity(0.5)),
                  child: Stack(
                    alignment: FractionalOffset.bottomCenter,
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: VlcPlayer(
                            controller: _vlcPlayer,
                            aspectRatio: 16 / 9,
                            placeholder: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 50,
                          color: Colors.blue,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              videouploadList[index].videoname.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}

class SavePython
{
  late String? videoname, videopath;
  late int id;
  SavePython(
      {
        required this.id,
        required this.videoname,
        required this.videopath,

      });
  factory SavePython.fromJson(Map<String,dynamic>json)
  {
    return SavePython(
        id: json['id'],
        videoname: json['videoname'],
        videopath: json['videopath'],

    );
  }
}