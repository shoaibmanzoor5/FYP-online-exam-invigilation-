import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class insert extends StatefulWidget {
  var id;
   insert({Key? key, required this.id })
       : super(key: key);

  @override
  _Signup createState() => _Signup();
}

class _Signup extends State<insert> {
  final left = TextEditingController();
  final right = TextEditingController();
  final up = TextEditingController();
  final down = TextEditingController();


  var _message;
  postData() async {
    {
      var response = await http.post(
          Uri.parse('http://' + MyApp.ipaddress + '/setthreshold'),
          body: {
            "lookingleft": left.text,
            "lookingright": right.text,
            "lookingup": up.text,
            "lookingdown": down.text,

          });

      if (response.statusCode == 200) {
        _message = response.body.toString();
        var sb = SnackBar(content: Text('Data Inserted'));
        ScaffoldMessenger.of(context).showSnackBar(sb);
      } else {
        var sb = SnackBar(content: Text('Something Went Wrong'));
        ScaffoldMessenger.of(context).showSnackBar(sb);
      }
    }
  }
  // postData() async {
  //   {
  //     var response = await http.post(
  //         Uri.parse('http://' + MyApp.ip + '/invigilation/api/std/InsertLogin'),
  //         body: {
  //           "lookingleft": left.text,
  //           "lookingright": right.text,
  //           "lookingup": up.text,
  //           "lookingdown": down.text,
  //         });

  //     if (response.statusCode == 200) {
  //       _message = response.body.toString();
  //       var sb = SnackBar(content: Text('Data Inserted'));
  //       ScaffoldMessenger.of(context).showSnackBar(sb);
  //     } else {
  //       var sb = SnackBar(content: Text('Something Went Wrong'));
  //       ScaffoldMessenger.of(context).showSnackBar(sb);
  //     }
  //   }
  // }
  //

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text(
                'Invigilator',
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 5, right: 10.0, left: 30.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 140),
                        padding: EdgeInsets.only(
                          top: 5,
                        ),
                        width: 160,
                        height: 60,
                        child: TextField(
                          controller: left,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'looking left',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 140),
                        padding: EdgeInsets.only(
                          top: 5,
                        ),
                        width: 160,
                        height: 60,
                        child: TextField(
                          controller: right,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'looking right',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 140),
                        padding: EdgeInsets.only(
                          top: 5,
                        ),
                        width: 160,
                        height: 60,
                        child: TextField(
                          controller: up,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'looking up',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 140),
                        padding: EdgeInsets.only(
                          top: 5,
                        ),
                        width: 160,
                        height: 60,
                        child: TextField(
                          controller: down,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'looking down',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                      Container(
                        width: 600,
                        height: 70,
                        child: Row(
                          children: [


                            Container(
                              margin: EdgeInsets.only(top: 10, left: 10, ),
                              width: 100,
                              height: 50,
                              child: ElevatedButton(
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                onPressed: () {
                                  postData();
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => new CameraPage(id: widget.id,)),
                                  // );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),

                    ],
                  ),
                )])))));
  }
}
