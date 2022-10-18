import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'invigilatorpage2.dart';
class invigilatorpg156 extends StatefulWidget {
  var id;
  invigilatorpg156({Key? key,required this.id}) : super(key: key);

  @override
  _invigilatorpg1State createState() => _invigilatorpg1State();
}

class _invigilatorpg1State extends State<invigilatorpg156> {
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

                  width: 400,
                  height: 740,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey),
                  child: Column(
                    children: [
                      Container(
                        padding:EdgeInsets.only(left: 20,top:10,right: 20,),
                        child:Text("Rules ",style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),
                      ),
                      Container(
                        padding:EdgeInsets.only(left: 10,top:10,right: 10,),
                        child:Text("1- There will be only 3 Warnings in case of any Mischief. ",style:TextStyle(fontSize: 20,),),
                      ),
                      Container(
                        padding:EdgeInsets.only(left: 10,top:5,right: 10,),
                        child:Text("2- Invigilator Can send Text Message, send Warnings and can Remove you from the Exam.",style:TextStyle(fontSize: 20,),),
                      ),
                      Container(
                        padding:EdgeInsets.only(left: 10,top:5,right: 10,),
                        child:Text("3- If you move your head left,right above,bottom system will detect the movements and alert Invigilatoof your Mischief.",style:TextStyle(fontSize: 20,),),
                      ),
                      Container(
                        padding:EdgeInsets.only(left: 10,top:5,right: 10,),
                        child:Text("4-Short Video will be recorded and will be sent to Invigilator, so He/She can overview the video and act accordingly.",style:TextStyle(fontSize: 20,),),
                      ),
                      Container(
                        padding:EdgeInsets.only(left: 10,top:5,right: 10,),
                        child:Text("5-If any another Device e.g Mobile, Tablet, Laptop detected in camera view, Invigilator will be notified of your act and He/She can take serious actions. IT'S STRICTLY NOT ALLOWED.",style:TextStyle(fontSize: 20,),),
                      ),
                      Container(
                        padding:EdgeInsets.only(left: 10,top:5,right: 10,),
                        child:Text("6-This System can detect voice/noise, so avoid speaking.Serious actions can be taken.",style:TextStyle(fontSize: 20,),),
                      ),
                      Container(
                        padding:EdgeInsets.only(left: 10,top:5,right: 10,),
                        child:Text("7-Your camera will be monitering you the whole time during the Exam, And System will make sure it's you and if it's not you in the Exam, your paper will be cancelled and you will removed from Exam.",style:TextStyle(fontSize: 20,),),
                      ),

                    ],

        ),
      ),

   ])) );


  }
}
