import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'invigilatorpage4.dart';




class invigilatorpg134 extends StatefulWidget {
  var id;
   invigilatorpg134({Key? key,required this.id}) : super(key: key);

  @override
  _invigilatorpg1State createState() => _invigilatorpg1State();
}

class _invigilatorpg1State extends State<invigilatorpg134> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        backgroundColor: Colors.blue,
        title: Text('Invigilator', style: TextStyle(
            color: Colors.white,

            fontWeight: FontWeight.bold
        ),),
      ),
      body: SingleChildScrollView(

        child: Column(

            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 5),
                  width: 410,
                  height: 30,
                  color: Colors.white,
                  child: Row(
                      children: [

                        Container(
                            margin: EdgeInsets.only(left: 10),
                            width: 340,
                            height: 30,

                            child: Row(
                                children: [



                                  Container(

                                    margin: EdgeInsets.only(
                                      left: 300, ),
                                    width: 30,
                                    height: 40,


                                    child: Icon(

                                      Icons.autorenew_rounded,
                                      color: Colors.red,
                                      size: 40.0,
                                    ),
                                  )

                                ]
                            )
                        )
                      ])
              ),
              SizedBox(
                height: 15,
              ),
              Container(

                width: 370,
                height: 280,
                margin: EdgeInsets.only(left: 10,right: 10,),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey),


                child: Column(
                  children: [
                    Container(

                      margin: EdgeInsets.only(top: 10,right: 110),
                      padding: EdgeInsets.only(left: 10),
                      width: 250,
                      height: 40,

                      child: Text('2018-Arid-1122',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30.0,


                      ),
                      ),
                    ),
                    Container(

                      margin: EdgeInsets.only(left: 240),
                      padding: EdgeInsets.only(bottom: 3),
                      width:70,
                      height: 50,
                      child: IconButton(
                        color: Colors.red,
                        onPressed:() {


                        },
                        icon: Icon(Icons.warning_amber_rounded ,size: 60,),
                      ),
                    ),
                  ],
                ),




              ),
              SizedBox(
                height: 7,
              ),
              Container(

                width: 370,
                height: 280,
                margin: EdgeInsets.only(left: 10,right: 10,),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey),


                child: Column(
                  children: [
                    Container(

                      margin: EdgeInsets.only(top: 10,right: 110),
                      padding: EdgeInsets.only(left: 10),
                      width: 250,
                      height: 40,
                      child: Text('2018-Arid-1001',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30.0,


                      ),
                      ),
                    ),
                    Container(

                      margin: EdgeInsets.only(left: 240),
                      padding: EdgeInsets.only(bottom: 3),
                      width:70,
                      height: 50,
                      child: IconButton(
                        color: Colors.red,
                        onPressed:() {


                        },
                        icon: Icon(Icons.warning_amber_rounded ,size: 60,),
                      ),
                    ),
                  ],
                ),




              ),



              Container(
                child:Row(
                  children: [
                    Container(

                      margin: EdgeInsets.only(
                        left: 35,),
                      padding: EdgeInsets.only(left: 30,top: 0),


                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.watch_later_outlined,
                        color: Colors.red,
                        size: 25.0,
                      ),
                    ),

                    Container(

                      margin: EdgeInsets.only(left: 0,  ),
                      padding: EdgeInsets.only(left: 10, right:10 ,top: 10),
                      width: 250,
                      height: 40,

                      child: Text(
                        "Remaining Time : 00:00 ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),

              Container(

                  width: 400,
                  height: 50,

                  child:Row(
                      children:[

                        Container(
                          width: 140,
                          height: 45,
                          margin: EdgeInsets.only(right: 20),
                          child:ElevatedButton(


                            child: Text("Previous",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                            onPressed:() {




                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue,

                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Container(
                          width: 140,
                          height: 45,

                          child:ElevatedButton(


                            child: Text("Next",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                            onPressed:() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => new invigilatorpg4(id: widget.id,)),
                              );



                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue,

                            ),
                          ),
                        ),
                      ]
                  )),

            ]
        ),
      ),

    );


  }
}
