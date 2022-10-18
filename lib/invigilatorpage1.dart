import 'dart:convert';
import"dart:convert" as convert;
import 'package:onlineexaminvigilation0001/sendvideoflutter.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'invigilatorpage2.dart';
import 'main.dart';

class VideoPlayerScreen extends StatefulWidget {
  String id;
  List<String> present_Students;

  VideoPlayerScreen(
      {Key? key, required this.id, required this.present_Students})
      : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  String? receivenotifiction = "";
  String? as = "";
  bool wrns = true;
  List<VideoPlayerController> video_controllers = [];
  int length = 0;
  List<SavePython> videouploadList = [];
  // String iid="2018-ARID-1122";
  String oldmsg="";
  Future<void> getImage() async {
for(int i=0;i<widget.present_Students.length;i++) {
  var response = await http.post(
      Uri.parse('http://' + MyApp.ip +
          '/invigilation/api/std/Showwarns?${widget.present_Students[i]}'));


  print("d2");
  print('arslan'+widget.id);
  print(response.statusCode);
  print('warningmsg' + response.body);

  if (response.statusCode == 200) {
    print(widget.id);


    var _message;
    _message = response.body.toString();
    print(_message);



    oldmsg = _message;
    print('massage' +oldmsg);


    //obj

    //
  }
  else {
    var sb = SnackBar(content: Text(
        'Plzz Enter Correct Email And Password'));
    ScaffoldMessenger.of(context).showSnackBar(sb);
  }
}
  }
  var msg;
  Future<void> warnswarning() async {
    while (wrns) {
      var _message;
      var response = await http.get(
        // Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/senddatanextpg'),
        Uri.parse(
            'http://' + MyApp.ipaddress + '/recieveWarnings/' + widget.id),
      );
      print("shoaib");
      print(response.body.toString());
      print("11223");
      msg = response.body.toString();
      print("11231");
      print(msg);
      await Future.delayed(Duration(seconds: 3));
    }
  }

  Future<void> warns() async {
    while (wrns) {
      for(int i=0;i<widget.present_Students.length;i++){
      var response = await http.get(
        // Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/senddatanextpg'),
        //   Uri.parse('http://' + MyApp.ipaddress + '/getMischiefNotification/' +
        //       widget.id));

          Uri.parse('http://' + MyApp.ipaddress + '/getMischiefNotification/'+widget.present_Students[i]+''));
      print("Ao na");
      // print(widget.id);
      print(response.body.toString());

      print('line resp:${response.body.toString()}');

      receivenotifiction = response.body.toString();

      print('notification: $receivenotifiction');
    }

      await Future.delayed(Duration(seconds: 5));
    }
  }

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
      print('asdfghj');
      print(videouploadList.length);
      print('zxcvbn');
      length = videouploadList.length;
    } else
      throw Exception('Failed to load data');

    return videouploadList;
  }

  String _location(dynamic media) {
    return media;
  }

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    warns();
    getImage();
    warnswarning();
    super.initState();
    for (int i = 0; i < widget.present_Students.length; i++) {
      print('Initializing Videoplayers... ');
      VideoPlayerController cont = VideoPlayerController.network(
          'http://' + MyApp.ipaddress + '/getLiveVideo/${widget
              .present_Students[i]}/1.mp4');
      cont.addListener(() {
        setState(() {});
      });
      cont.setLooping(true);
      cont.initialize().then((_) => setState(() {}));
      cont.play();

      video_controllers.add(cont);
    }
    _controller = VideoPlayerController.network(
      'http://' + MyApp.ip + '/Invigilation/Content/Videoupload/imran.mp4',

      //'http://'+MyApp.ip+Uri.parse(videouploadList[0].videopath.toString()).toString()
    );

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('invigilator'),
        ),

        // Use a FutureBuilder to display a loading spinner while waiting for the
        // VideoPlayerController to finish initializing.
        // body: Column(
        //
        //     children: <Widget>[
        //       Container(
        //           margin: EdgeInsets.only(top: 5),
        //           width: 410,
        //           height: 30,
        //           color: Colors.white,
        //           child: Row(
        //               children: [
        //
        //                 Container(
        //                     margin: EdgeInsets.only(left: 0),
        //                     width: 350,
        //                     height: 30,
        //
        //                     child: Row(
        //                         children: [
        //                           Container(
        //
        //                             child: Row(
        //                                 children: [
        //                                   Container(
        //                                     margin: EdgeInsets.only(
        //                                       left: 0,),
        //
        //
        //                                     width: 40,
        //                                     height: 50,
        //                                     child: Icon(
        //                                       Icons.watch_later_outlined,
        //                                       color: Colors.red,
        //                                       size: 25.0,
        //                                     ),
        //                                   ),
        //                                   Container(
        //                                     margin: EdgeInsets.only(
        //                                         left: 0, right: 0),
        //                                     width: 250,
        //                                     height: 50,
        //                                     child: Text(
        //                                       "Remaining Time : 00:00 ",
        //                                       style: TextStyle(fontSize: 20,
        //                                           fontWeight: FontWeight
        //                                               .bold,
        //                                           color: Colors.red),
        //                                     ),
        //                                   ),
        //
        //
        //                                 ]),
        //                           ),
        //
        //
        //                           Container(
        //
        //                             margin: EdgeInsets.only(
        //                               right: 0,),
        //                             width: 10,
        //                             height: 50,
        //                             child: Icon(
        //
        //                               Icons.autorenew_rounded,
        //                               color: Colors.red,
        //                               size: 25.0,
        //                             ),
        //                           )
        //
        //                         ]
        //                     )
        //                 )
        //               ])),
        //
        //       Expanded(
        //           child: Container(
        //               child: FutureBuilder<List<SavePython>>(
        //                   future: getVideo(),
        //                   builder: (context, snapshot) {
        //                     print('snap${snapshot.hasData.toString()}');
        //                     if (!snapshot.hasData) {
        //                       return const Center(child: CircularProgressIndicator());
        //                     } else {
        //                       List<SavePython> data=snapshot.data!;
        //                       print('snap data: ${data}');
        //                       return ListView.builder(
        //
        //
        //                           itemCount: data.length,
        //                           itemBuilder: (context, index) {
        //
        //                             SavePython sp=data[index];
        //                             print('SP:: ${sp.videopath}');
        //                             String url='http://'+MyApp.ip+sp.videopath.toString();
        //                             print('url:: $url');
        //                             // new Chewie(
        //                             //   VideoPlayerController.network(url),
        //                             //   aspectrRatio:3/2,
        //                             //   autoplay: false,
        //                             //   looping : false,
        //                             // ),
        //                               VideoPlayerController mycontroller=VideoPlayerController.network(url);
        //                               return AspectRatio(
        //                                 aspectRatio: mycontroller.value.aspectRatio,
        //                                 // Use the VideoPlayer widget to display the video.
        //                                 child: VideoPlayer(mycontroller),
        //                               );
        //                           }
        //                       );
        //                     }
        //                   }
        //               ))),
        //       SizedBox(
        //         height: 15,
        //       ),
        //       Container(
        //           color: Colors.black,
        //           width: 120,
        //           height: 50,
        //           child: ElevatedButton(
        //
        //
        //               child: Text("Pause", style: TextStyle(fontSize: 20,
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.white),),
        //               onPressed: () {
        //                 //   Navigator.push(
        //                 // context,
        //                 //   MaterialPageRoute(
        //                 //       builder: (context) => new invigilatorpg2(
        //                 //         id: widget.id,)),
        //                 // );
        //                 setState(() {
        //                   // If the video is playing, pause it.
        //                   if (_controller.value.isPlaying) {
        //                     _controller.pause();
        //                   } else {
        //                     // If the video is paused, play it.
        //                     _controller.play();
        //                   }
        //                 });
        //               })),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       Container(
        //         width: 220,
        //         height: 50,
        //
        //         child: ElevatedButton(
        //
        //
        //           child: Text(
        //             "Paper Time Out", style: TextStyle(fontSize: 25,
        //               fontWeight: FontWeight.bold,
        //               color: Colors.white),),
        //           onPressed: () {
        //             print('Vid Page ${widget.id}');
        //             Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) =>
        //                   new invigilatorpg2(
        //                     id: widget.id,)),
        //             );
        //           },
        //           style: ElevatedButton.styleFrom(
        //             primary: Colors.blue,
        //
        //           ),
        //         ),
        //       ),
        //
        //     ])
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,

                childAspectRatio: 1 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: video_controllers.length,
            itemBuilder: (cont, index) {
              print('Building$index');
              VideoPlayerController controller = video_controllers[index];

              print('Playing..');

              print('Aspect Ratio${controller.value.aspectRatio}');


              return
                Container(
                    child: Column(
                    children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 15,
                    top: 15,
                    right: 15,
                  ),
                  height:150,
                  width: 300,
                  decoration: BoxDecoration(
                    border: receivenotifiction.toString().contains(widget.present_Students[index])
                        ? Border.all(
                      color: Colors.red,
                      width: 5,
                    )
                        : Border.all(
                      color: Colors.green,
                      width: 5,
                    ),
                  ),



                  child: GestureDetector(
                      onTap: () {
                        _controller.pause();

                        // setState(() {
                        //   _controller.pause();
                        // });
                        getImage();
                        String aridnumber = widget.present_Students[index];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              new invigilatorpg2(
                                id: aridnumber, receveoldmssg: oldmsg, tid: widget.id,
                              )),
                        );
                      },
//                   return InkWell(
// //                 onTap: (){},

                      child: AspectRatio(
                        aspectRatio: controller.value.aspectRatio,
                        child: VideoPlayer(controller),

                      ),

                  ),
                ),

              SizedBox(
                height: 4,
              ),
              Text(widget.present_Students[index],style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black),),
                       Container(
                         height: 30,
                         width: 100,

                         child: Row(
                           children: [
                             Text(
                               "Warns :",
                               style: TextStyle(
                                   color: Colors.red,
                                   fontSize: 15.0,
                                   fontWeight: FontWeight.bold),

                             ),
                             SizedBox(
                               width: 4.0,
                             ),
                             Text(
                               msg!,
                               style: TextStyle(
                                   color: Colors.red,
                                   fontSize: 17.0,
                                   fontWeight: FontWeight.bold),
                             ),
                           ],
                         ),
                       )


                    ])

              );

            }

    ));
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
