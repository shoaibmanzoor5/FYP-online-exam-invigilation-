import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart';

import 'camera_page.dart';

class VideoPage extends StatefulWidget {
  final String filePath;

  const VideoPage({Key? key, required this.filePath}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _videoPlayerController;

  //static get videoPath => null;

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.filePath));
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
        elevation: 0,
        backgroundColor: Colors.black26,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              videoupload(context:context,fpath:widget.filePath);
              print('do something with the file');
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: _initVideoPlayer(),
        builder: (context, state) {

          if (state.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return VideoPlayer(_videoPlayerController);
          }
        },
      ),
    );
  }
  // void uploadvideo(context) async {
  //   final ImagePicker _picker = ImagePicker();
  //   var video =await  _picker.pickImage(source: ImageSource.camera);
  //
  //   var postUri = Uri.parse("http://10.0.2.2:5000/getVideoFile");
  //   http.MultipartRequest request = new http.MultipartRequest("POST", postUri);
  //   request.files.add(
  //       await http.MultipartFile.fromPath(
  //           'video',
  //           video!.path)
  //   );
  //
  //   http.Response response = await http.Response.fromStream(
  //       await request.send());
  //   String _msg = response.body.toString().replaceAll("'", "").replaceAll(
  //       "[", "").replaceAll("]", "");
  //   print(_msg);
    // if (_msg!='') {
    //   createAlerDialog(context);
    // }
    // else  {
    //   CreateAlerDialog(context);
    // }

  //}

    }





