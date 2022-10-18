import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'invigilatorpage2.dart';
class invigilatorpgds extends StatefulWidget {
  var id;
  invigilatorpgds({Key? key,required this.id}) : super(key: key);

  @override
  _invigilatorpg1State createState() => _invigilatorpg1State();
}

class _invigilatorpg1State extends State<invigilatorpgds> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(

          backgroundColor: Colors.blue,
          title: Text('Student', style: TextStyle(
              color: Colors.white,

              fontWeight: FontWeight.bold
          ),),
        ),
        body: SingleChildScrollView(

            child: Column(

                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10,left: 10,right: 10),

                    width: 500,
                    height: 680,


                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5,right: 5,top: 10, ),
                          width: 500,
                          height:640,
                          color: Colors.pink,
                          child: Image.asset('image/datesheet.PNG',

                            fit:BoxFit.fill,),

                        ),

                      ],

                    ),
                  ),

                ])) );


  }
}
