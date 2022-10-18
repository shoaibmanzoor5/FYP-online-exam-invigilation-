import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlineexaminvigilation0001/recordingvideo/camera_page.dart';
import 'package:onlineexaminvigilation0001/recordingvideo/video_recording.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:video_player/video_player.dart';

import 'main.dart';



class fileview extends StatefulWidget {
  var file;
  var id;
  var paper;
  var timeget;
    fileview({Key? key,required this.paper,required this.id,required this.file,required this.timeget,}){
      print('timesss=${timeget}');
    }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<fileview> {
  bool wrns = true;
  List<VideoPlayerController> video_controllers = [];
  Timer? t;
  bool _isLoading = true;
  bool _isRecording = false;
  late CameraController _cameraController;

//List<String> MCQ=['Question Number 1', 'Question Number 2'];
  @override
  void initState() {

    _initCamera();
    displayVideo();
    super.initState();
    String s = widget.timeget;
    int tt = 0;
    if (s.isNotEmpty) {
      tt = int.parse(s);
    }
    print("tayyab"+widget.timeget);
    print("asim asim"+tt.toString());

    Timer.periodic(Duration(seconds: tt), (timer) async {
      print('inside timer.... ');

      if (_isRecording) {
        print('Uploading video.... ');
        final file = await _cameraController.stopVideoRecording();
        setState(() => _isRecording = false);

        videoupload(context: context, fpath: file.path);
        Future.delayed(const Duration(seconds: 1));
        await _cameraController.prepareForVideoRecording();
        await _cameraController.startVideoRecording();
        setState(() => _isRecording = true);
      } else {
        _isRecording = true;
        await _cameraController.prepareForVideoRecording();
        await _cameraController.startVideoRecording();
        setState(() => _isRecording = true);
      }
    });
  }

  // void initState() {
  //   _initCamera();
  //   super.initState();
  //
  // }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  _initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.front);
    _cameraController = CameraController(front, ResolutionPreset.max);
    await _cameraController.initialize();
    setState(() => _isLoading = false);
  }

  _recordVideo1() async {
    if (_isRecording) {
      final file = await _cameraController.stopVideoRecording();
      setState(() => _isRecording = false);
      final route = MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => VideoPage(filePath: file.path),
      );
      Navigator.push(context, route);
    } else {
      await _cameraController.prepareForVideoRecording();
      await _cameraController.startVideoRecording();
      setState(() => _isRecording = true);
    }
  }

  _recordVideo() async {
    if (_isRecording) {
      final file = await _cameraController.stopVideoRecording();
      setState(() => _isRecording = false);
      final route = MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => VideoPage(filePath: file.path),
      );
      Navigator.push(context, route);
    } else {
      await _cameraController.prepareForVideoRecording();
      await _cameraController.startVideoRecording();
      setState(() => _isRecording = true);
    }
  }



  void displayVideo() {
    super.initState();
    VideoPlayerController cont = VideoPlayerController.network(
        'http://' + MyApp.ipaddress + '/getLiveVideo/${widget.id}/1.mp4');
    cont.addListener(() {
      setState(() {});
    });
    cont.setLooping(true);
    cont.initialize().then((_) => setState(() {}));
    cont.play();
    video_controllers.add(cont);
  }








  final sampleUrl = 'http://' + MyApp.ipaddress + '/getpdf';

  String? pdfFlePath;

  Future<String> downloadAndSavePdf() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/papercg.pdf');
    if (await file.exists()) {
      return file.path;
    }
    final response = await http.get(Uri.parse(sampleUrl));
    await file.writeAsBytes(response.bodyBytes);
    return file.path;
  }

  void loadPdf() async {
    pdfFlePath = await downloadAndSavePdf();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(' Paper'),
          ),
          body: Column(
              children: <Widget>[
                Container(
                child:ElevatedButton(
                  child: Text("Load pdf"),
                  onPressed: loadPdf,
                ),
        ),
                if (pdfFlePath != null)


                  Expanded(
                    child:Stack(
                    alignment: Alignment.bottomCenter,
                     children: [
                        CameraPreview(_cameraController),
                    Container(
                      child: PdfView(path: pdfFlePath!),
                    ),
                 ] )
                    )
                else
                  Text("Pdf is not Loaded"),
              ],
            ),
        );
      }),
    );
  }
}



Future<void> videoupload({context, fpath}) async {
//  final cameras = await availableCameras();
  // final front = cameras.firstWhere((camera) =>
  // camera.lensDirection == CameraLensDirection.front);
  // final _cameraController = CameraController(front, ResolutionPreset.max);
  // var file = await _cameraController.stopVideoRecording();

  var postUri =
  Uri.parse("http://" + MyApp.ipaddress + "/getVideoFile/2018-ARID-1122");
  //var postUri = Uri.parse("http://192.168.43.49:5000/testCall/2018-ARID-01961");

  var request = http.MultipartRequest('POST', postUri);
  request.files.add(await http.MultipartFile.fromPath('video', fpath));
  request.files.add(await http.MultipartFile.fromPath('video2', fpath));
  request.headers.addAll({'Content-type': 'multipart/formdata'});

  print("fpath: $fpath");
  var res = await request.send();
  print('Status Code ${res.statusCode}');
  if (res.statusCode == 200) {
    print('uploaded...');
  } else {
    print('failed to upload...');
  }
}