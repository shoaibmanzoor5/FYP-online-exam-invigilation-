import 'dart:convert';

import 'package:onlineexaminvigilation0001/sendvideoflutter.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'invigilatorpage2.dart';
import 'main.dart';

class VideoPlayerScreen1 extends StatefulWidget {
  String id;
  List<String> present_Students;

  VideoPlayerScreen1(
      {Key? key, required this.id, required this.present_Students})
      : super(key: key);

  @override
  State<VideoPlayerScreen1> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen1> {
  String? as = "";

  List<VideoPlayerController> video_controllers = [];
  int length = 0;
  List<SavePython> videouploadList = [];

  Future<List<SavePython>> getVideo() async {
    var response = await http.get(Uri.parse(
        'http://' + MyApp.ip + '/invigilation/api/std/getPythonVideo'));

    if (response.statusCode == 200) {
      print("Successfull Show Record");

      Iterable listt = jsonDecode(response.body);
      print(listt);
      listt.forEach((element) {
        SavePython s = SavePython.fromJson(element);
        videouploadList.add(s);
        print('added${s.videopath}');
      });
      print('Video list${videouploadList.length}');
      setState(() {});
      print(videouploadList.length);
      length = videouploadList.length;
    } else
      throw Exception('Failed to load data');

    return videouploadList;
  }

  String _location(dynamic media) {
    return media;
  }

  //late VideoPlayerController _controller;
  //late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {

    super.initState();
    for (int i = 0; i < widget.present_Students.length; i++) {
      print('Initializing Videoplayers... ');
      String np='http://192.168.43.49:5000/getMischief/${widget.present_Students[i]}/${widget.id}';
      //String np='http://192.168.43.49:5000/getMischief/REC1732351289136195062.mp4/2018-ARID-1122';
      print('Network path${np}');
      VideoPlayerController cont = VideoPlayerController.network(np);

      print('${widget.present_Students[i]}');


      cont.setLooping(true);
      cont.initialize().then((_) => setState(() {}));
      cont.play();
      // cont.addListener(() {
      //   setState(() {});
      // });
      // cont.setLooping(true);
      // cont.initialize().then((_) => setState(() {}));
      // cont.play();
      // video_controllers.add(cont);
      // VideoPlayerController contler = VideoPlayerController.network('http://192.168.43.49:5000/getMischief/${widget.present_Students[i]}/${widget.id}');
      // contler.addListener(() {
      //   setState(() {});
      // });
      // contler.setLooping(true);
      // contler.initialize().then((_) => setState(() {}));
      // contler.play();

      video_controllers.add(cont);
    }


  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('invigilator'),
        ),
    //     body: new GestureDetector(
    //     behavior: HitTestBehavior.opaque,
    // onPanDown: (detail) {
    // print(detail);
    // FocusScope.of(context).requestFocus(new FocusNode());
    // },
        body: ListView.builder(

            itemCount: video_controllers.length,
            itemBuilder: (cont, index) {
              print('Building$index');
              VideoPlayerController controller = video_controllers[index];

              print('Playing..');

              print('Aspect Ratio${controller.value.aspectRatio}');

    //           return child: GridView.builder(
    // physics: NeverScrollableScrollPhysics(),
    // shrinkWrap: true,
    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    // crossAxisCount: 2,
    // crossAxisSpacing: 5.0,
    // mainAxisSpacing: 5.0,
    // ),
    // itemCount: 10,
    // itemBuilder: (context, index) {
    // return
    //
    // Container(
              return
                Container(
                    margin: EdgeInsets.only(left: 15, top: 20,right: 15,),
                    height: 300,
                    width: 300,

                    decoration: BoxDecoration(
                        //color: Colors.yellow[100],
                        border: Border.all(
                          color: Colors.green,
                          width: 5,
                        )),

                    child: GestureDetector(
                        onTap: () {
                          String aridnumber=widget.present_Students[index];
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (
                          //       context) => new invigilatorpg2(id: aridnumber,)),
                          // );
                        },
//                   return InkWell(
// //                 onTap: (){},

                        child: AspectRatio(
                          aspectRatio: controller.value.aspectRatio,
                          child: VideoPlayer(controller),
                        )));
            }));
  }
}

class SavePython {
  late String? videoname, videopath;
  late int id;

  SavePython({
    required this.id,
    required this.videoname,
    required this.videopath,
  });

  factory SavePython.fromJson(Map<String, dynamic> json) {
    return SavePython(
      id: json['id'],
      videoname: json['videoname'],
      videopath: json['videopath'],
    );
  }
}











// import 'dart:convert';
//
// import 'package:onlineexaminvigilation0001/sendvideoflutter.dart';
// import 'package:video_player/video_player.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'invigilatorpage2.dart';
// import 'main.dart';
// class michef extends StatefulWidget {
//   String id;
//
//   michef({Key? key, required this.id}) : super(key: key);
//
//
//
//   @override
//   State<michef> createState() => _VideoPlayerScreenState();
// }
//
// class _VideoPlayerScreenState extends State<michef> {
//   Future<void> warns() async {
//     {
//       var _message;
//       var response = await http.get(
//         // Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/senddatanextpg'),
//         Uri.parse('http://' + MyApp.ipaddress + '/getMischeifVideos'),
//       );
//       print("teacher send warning");
//       print(widget.id);
//     }
//   }
//   int length = 0;
//   List<SavePython> videouploadList = [];
//
//
//   Future<List<SavePython>> getVideo() async {
//     var response = await http.get(Uri.parse(
//         'http://' + MyApp.ip + '/invigilation/api/std/getPythonVideo'));
//
//     if (response.statusCode == 200) {
//       print("Successfull Show Record");
//
//
//       Iterable listt = jsonDecode(response.body);
//       print(listt);
//       listt.forEach((element) {
//         SavePython s= SavePython.fromJson(element);
//         videouploadList.add(s);
//         print('added${s.videopath}');
//       });
//       print('Video list${videouploadList.length}');
//       setState(() {
//
//       });
//       print(videouploadList.length);
//       length=videouploadList.length;
//     }
//     else
//       throw Exception('Failed to load data');
//
//     return videouploadList;
//   }
//
//   String _location(dynamic media) {
//     return media;
//
//   }
//
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//       'http://192.168.43.49/Invigilation/Content/Videoupload/imran.mp4',
//
//       //'http://'+MyApp.ip+Uri.parse(videouploadList[0].videopath.toString()).toString()
//     );
//
//
//     // Create and store the VideoPlayerController. The VideoPlayerController
//     // offers several different constructors to play videos from assets, files,
//     // or the internet.
//
//     // Initialize the controller and store the Future for later use.
//     _initializeVideoPlayerFuture = _controller.initialize();
//
//     // Use the controller to loop the video.
//     _controller.setLooping(true);
//   }
//
//   @override
//   void dispose() {
//     // Ensure disposing of the VideoPlayerController to free up resources.
//     _controller.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('invigilator'),
//         ),
//         // Use a FutureBuilder to display a loading spinner while waiting for the
//         // VideoPlayerController to finish initializing.
//         body: Column(
//
//             children: <Widget>[
//               Container(
//                   margin: EdgeInsets.only(top: 5),
//                   width: 410,
//                   height: 30,
//                   color: Colors.white,
//                   child: Row(
//                       children: [
//
//                         Container(
//                             margin: EdgeInsets.only(left: 0),
//                             width: 350,
//                             height: 30,
//
//                             child: Row(
//                                 children: [
//                                   Container(
//
//                                     child: Row(
//                                         children: [
//                                           Container(
//                                             margin: EdgeInsets.only(
//                                               left: 0,),
//
//
//                                             width: 40,
//                                             height: 50,
//                                             child: Icon(
//                                               Icons.watch_later_outlined,
//                                               color: Colors.red,
//                                               size: 25.0,
//                                             ),
//                                           ),
//                                           Container(
//                                             margin: EdgeInsets.only(
//                                                 left: 0, right: 0),
//                                             width: 250,
//                                             height: 50,
//                                             child: Text(
//                                               "Remaining Time : 00:00 ",
//                                               style: TextStyle(fontSize: 20,
//                                                   fontWeight: FontWeight
//                                                       .bold,
//                                                   color: Colors.red),
//                                             ),
//                                           ),
//
//
//                                         ]),
//                                   ),
//
//
//                                   Container(
//
//                                     margin: EdgeInsets.only(
//                                       right: 0,),
//                                     width: 10,
//                                     height: 50,
//                                     child: Icon(
//
//                                       Icons.autorenew_rounded,
//                                       color: Colors.red,
//                                       size: 25.0,
//                                     ),
//                                   )
//
//                                 ]
//                             )
//                         )
//                       ])),
//
//               Expanded(
//                   child: Container(
//                       child: FutureBuilder<List<SavePython>>(
//                           future: getVideo(),
//                           builder: (context, snapshot) {
//                             print('snap${snapshot.hasData.toString()}');
//                             if (!snapshot.hasData) {
//                               return const Center(child: CircularProgressIndicator());
//                             } else {
//                               List<SavePython> data=snapshot.data!;
//                               print('snap data: ${data}');
//                               return ListView.builder(
//
//
//                                   itemCount: data.length,
//                                   itemBuilder: (context, index) {
//
//                                     SavePython sp=data[index];
//                                     print('SP:: ${sp.videopath}');
//                                     String url='http://'+MyApp.ip+sp.videopath.toString();
//                                     print('url:: $url');
//                                     // new Chewie(
//                                     //   VideoPlayerController.network(url),
//                                     //   aspectrRatio:3/2,
//                                     //   autoplay: false,
//                                     //   looping : false,
//                                     // ),
//                                     VideoPlayerController mycontroller=VideoPlayerController.network(url);
//                                     return AspectRatio(
//                                       aspectRatio: mycontroller.value.aspectRatio,
//                                       // Use the VideoPlayer widget to display the video.
//                                       child: VideoPlayer(mycontroller),
//                                     );
//                                   }
//                               );
//                             }
//                           }
//                       ))),
//               SizedBox(
//                 height: 15,
//               ),
//               Container(
//                   color: Colors.black,
//                   width: 120,
//                   height: 50,
//                   child: ElevatedButton(
//
//
//                       child: Text("Pause", style: TextStyle(fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white),),
//                       onPressed: () {
//                         //   Navigator.push(
//                         // context,
//                         //   MaterialPageRoute(
//                         //       builder: (context) => new invigilatorpg2(
//                         //         id: widget.id,)),
//                         // );
//                         setState(() {
//                           // If the video is playing, pause it.
//                           if (_controller.value.isPlaying) {
//                             _controller.pause();
//                           } else {
//                             // If the video is paused, play it.
//                             _controller.play();
//                           }
//                         });
//                       })),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 width: 120,
//                 height: 50,
//
//                 child: ElevatedButton(
//
//
//                   child: Text(
//                     "Back", style: TextStyle(fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),),
//                   onPressed: () {
//                     print('Vid Page ${widget.id}');
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                           new invigilatorpg2(
//                             id: widget.id,)),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.blue,
//
//                   ),
//                 ),
//               ),
//
//             ]));
//
//   }
// }
// class SavePython
// {
//   late String? videoname, videopath;
//   late int id;
//   SavePython(
//       {
//         required this.id,
//         required this.videoname,
//         required this.videopath,
//
//       });
//   factory SavePython.fromJson(Map<String,dynamic>json)
//   {
//     return SavePython(
//       id: json['id'],
//       videoname: json['videoname'],
//       videopath: json['videopath'],
//
//     );
//   }
// }
//
//
//
//
