import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlineexaminvigilation0001/rules.dart';
import 'package:http/http.dart' as http;
import 'Admin2pg.dart';
import 'datesheet.dart';
import 'faceerror.dart';
import 'list.dart';
import 'main.dart';
import 'mainpage.dart';
import"dart:convert" as convert;


class warning extends StatefulWidget {
  String studentid;

  warning({Key? key,required this.studentid })
  {
    print('studentsss=${studentid}');
}


  @override
  _MyAdminState createState() => _MyAdminState();
}

class _MyAdminState extends State<warning> {
  Future<List<dynamic>> showData() async {
    print("w");
    var _message;
    var response = await http.post(
        Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/studentmischeflist'),
        body: {
      "sRegNo":widget.studentid.toString()
        }
    );

    if (response.statusCode == 200) {
      _message = response.body.toString();
      print('mischef'+_message);
      var jsonResult=convert.jsonDecode(response.body) as List<dynamic>;
      var extra=jsonResult;
      length=jsonResult.length;
      print(length);


      return jsonResult;


      //obj

      //
    }
    else
    {
      var sb = SnackBar(content: Text('Plzz Enter Correct Data'));
      ScaffoldMessenger.of(context).showSnackBar(sb);
    }
    return[];
  }

  int length=0;

  @override
  Widget build(BuildContext context) {
    return Container(


        child: Scaffold(

          backgroundColor: Colors.white,
          appBar: AppBar(

            backgroundColor: Colors.blue,

            title: Text('Invigilator', style: TextStyle(
                color:Colors.white ,
                fontSize: 25,

                fontWeight: FontWeight.bold
            ),),

          ),

          body:Column(
            children: [

              Container(
                color: Colors.grey,
                width: 300,
                height: 560,
                margin: EdgeInsets.only(top: 20,left:5,right: 5,bottom: 0),
                child: FutureBuilder<List<dynamic>>(
                  future: showData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(

                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {

                            return Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 240,
                                    height: 50,

                                    padding: EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 10),
                                    margin: EdgeInsets.only(top: 0,left:5,right: 5,bottom: 0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25.0),
                                        color: Colors.white),

                                    child: Row(
                                      children:<Widget> [

                                        Text(
                                          snapshot.data![index].toString(),
                                          //snapshot.data![index].toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),



                                      ],
                                    ),
                                  ),

                                ]);


                          });
                    }
                  },
                ),
              ),



            ],
          ),
        )

    );
    throw UnimplementedError();
  }
}

