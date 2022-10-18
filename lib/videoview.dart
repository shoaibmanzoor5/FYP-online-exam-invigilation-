import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:flutter_vlc_player/src/vlc_player_controller.dart';
import 'package:onlineexaminvigilation0001/Studentpaper3.dart';

import 'main.dart';
class video extends StatefulWidget {
  var id;
  String vname;
   video({Key? key, required this.id,required this.vname}) : super(key: key);

  @override
  State<video> createState() => _videoState();
}
class _videoState extends State<video> {
  @override
  Widget build(BuildContext context) {




    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'invigilator',vname: widget.vname,id: widget.id,),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title,required this.vname,required this.id}) : super(key: key);
  final String title;
  final String vname;
   var id;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  late VlcPlayerController _vlcViewController ;
  @override
  Widget build(BuildContext context) {

    _vlcViewController  = new VlcPlayerController.network(
    'http://' + MyApp.ipaddress + '/getMischief/${widget.vname}/${widget.id}',
    autoPlay: true,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 400,
           width: 400,
          margin: EdgeInsets.only(
              left: 20, right: 20, ),
           child: new VlcPlayer(
              controller: _vlcViewController,
              aspectRatio: 9/9,

            ),
            )],
        ),
      ),
    );
  }
}