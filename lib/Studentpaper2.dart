import 'package:flutter/material.dart';
import 'FaceNoError2.dart';
import 'Studentpaper1.dart';
import 'Studentpaper3.dart';


class Studentpapers2 extends StatefulWidget {
  var id;
   Studentpapers2({Key? key,required this.id}) : super(key: key);

  @override
  _Studentpapers2State createState() => _Studentpapers2State();
}

class _Studentpapers2State extends State<Studentpapers2> {
  String? role;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
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
                        width: 410,
                        height: 210,

                        child: Row(
                            children: [

                              Container(

                                  width: 170,
                                  height: 200,

                                  child: Row(
                                      children: [
                                        Container(
                                            width: 170,
                                            height: 180,
                                       child:Column(
                                                children: [


                                                  Container(
                                                    padding:EdgeInsets.only(left: 5,right: 0,top: 5,bottom: 0),
                                                    margin:EdgeInsets.only(left: 20,right: 30,top: 0),
                                                    width: 160,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                        color: Colors.grey),


                                                    child:Text(' Start \n Time:00:00 AM',style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors.black,

                                                    ),


                                                    ),),
                                                  SizedBox(

                                                    height: 5,
                                                  ),
                                                  Container(

                                                    padding:EdgeInsets.only(left: 5,right: 0,top: 5,bottom: 0),
                                                    margin:EdgeInsets.only(left: 20,right: 30,top: 10),
                                                    width: 160,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                        color: Colors.grey),
                                                    child:Text(' End \n Time:00:00 AM',style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors.black,

                                                    ),


                                                    ),),
                                                  SizedBox(

                                                    height: 1,
                                                  ),
                                                  Container(

                                                    padding:EdgeInsets.only(left: 5,right: 0,top: 5,bottom: 0),
                                                    margin:EdgeInsets.only(left: 20,right: 30,top: 10),
                                                    width: 160,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                        color: Colors.grey),
                                                    child:Text(' Remaining Time:00:00 AM',style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors.black,

                                                    ),


                                                    ),),


                                                ])),


                                      ]
                                  )


                              ),
                              Container(
                                padding: EdgeInsets.only(top: 0,bottom: 10),
                                margin: EdgeInsets.only(
                                    left: 20, right: 7, top: 0, bottom: 0),

                                width: 140,
                                height: 160,

                                child: GestureDetector(

                                  onTap: () {
                                    // LogOut(context);
                                  },


                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Image border
                                    child: SizedBox.fromSize(
                                      size: Size.fromRadius(48), // Image radius
                                      child: Image.asset('image/AHMED.jpg', fit: BoxFit.cover),
                                    ),
                                  )
                                ),
                              ),
                            ]
                        ),
                      ),
                      SizedBox(
                        height: 0.0,
                      ),
                      Container(
                        width: 380,
                        height: 50,

                        child: Row(
                          children: [
                            Container(

                              padding: EdgeInsets.only(left:4,top: 5,right: 10,bottom: 10),
                              margin: EdgeInsets.only(top: 0.0,left: 0.0,right: 0.0,bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.grey),
                              child: Row(
                                children:<Widget> [
                                  Icon(

                                    Icons.notifications,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                  SizedBox(
                                    width: 7.0,
                                  ),
                                  Text(
                                    "Sir Zahid: That's last warning after that you will be removed ",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Icon(

                                    Icons.warning_amber_rounded,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:EdgeInsets.only(left: 20,top:10,right: 10,bottom: 0),
                        margin: EdgeInsets.only(top: 0,right: 0,bottom: 10),

                        width: 180,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            color: Colors.grey),

                        child: Text(' Programming \n Fundamental',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,

                        ),


                        ),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Container(
                        width: 390,
                        height: 50,

                        padding: EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 10),
                        margin: EdgeInsets.only(top: 0,left:5,right: 5,bottom: 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Colors.grey),

                        child: Row(
                          children:<Widget> [
                            Text(
                              "Q#1",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "The escape sequence of carrige return is :",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),



                          ],
                        ),
                      ),


                      // Container(
                      //   margin: EdgeInsets.only(top: 0.0,left: 0.0,right: 0.0,bottom: 0),
                      //   color: Colors.white,
                      //   child:Row(
                      //       children: [
                      //
                      //         Radio(
                      //           value: 1,
                      //           groupValue:1,
                      //           onChanged: (value){},
                      //         ),
                      //
                      //
                      //
                      //         Container(
                      //           width: 300,
                      //           height: 30,
                      //
                      //           padding: EdgeInsets.only(left: 10,top: 0,right: 10,bottom: 5),
                      //           margin: EdgeInsets.only(top: 0.0,left: 0.0,right: 0.0,bottom: 20),
                      //           decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(20.0),
                      //               color: Colors.grey),
                      //           child: Row(
                      //             children:<Widget> [
                      //
                      //               Text(
                      //                 "A./M",
                      //                 style: TextStyle(
                      //                     color: Colors.black,
                      //                     fontSize: 23.0,
                      //                     fontWeight: FontWeight.bold
                      //                 ),
                      //               ),
                      //
                      //
                      //             ],
                      //           ) ,
                      //         )
                      //
                      //       ]),
                      // ),
                      Column(

                        children: <Widget>[
                          ListTile(

                            title: Text('A./M',style: TextStyle(fontSize: 20.0),),
                            leading: Radio(
                              value: 'FG',
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                   role = value.toString();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      Column(

                        children: <Widget>[
                          ListTile(

                            title: Text('B./S',style: TextStyle(fontSize: 20.0),),
                            leading: Radio(
                              value: 'WQ',
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                   role = value.toString();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      Column(

                        children: <Widget>[
                          ListTile(

                            title: Text('C./F',style: TextStyle(fontSize: 20.0),),
                            leading: Radio(
                              value: 'ER',
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                   role = value.toString();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      Column(

                        children: <Widget>[
                          ListTile(

                            title: Text('D./K',style: TextStyle(fontSize: 20.0),),
                            leading: Radio(
                              value: 'ZZ',
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                   role = value.toString();
                                });
                              },
                            ),
                          )
                        ],
                      ),

                      // Container(
                      //
                      //   child:Row(
                      //       children: [
                      //
                      //         Radio(
                      //           value: 1,
                      //           groupValue:1,
                      //           onChanged: (value){},
                      //         ),
                      //
                      //
                      //
                      //         Container(
                      //           width: 300,
                      //           height: 35,
                      //
                      //           padding: EdgeInsets.only(left: 10,top: 0,right: 10,bottom: 5),
                      //           margin: EdgeInsets.only(top: 0.0,left: 0.0,right: 0.0,bottom: 10),
                      //           decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(20.0),
                      //               color: Colors.grey),
                      //           child: Row(
                      //             children:<Widget> [
                      //
                      //               Text(
                      //                 "B./S",
                      //                 style: TextStyle(
                      //                     color: Colors.black,
                      //                     fontSize: 23.0,
                      //                     fontWeight: FontWeight.bold
                      //                 ),
                      //               ),
                      //
                      //
                      //             ],
                      //           ) ,
                      //         )
                      //
                      //       ]),
                      // Container(
                      //
                      //   child:Row(
                      //       children: [
                      //
                      //         Radio(
                      //           value: 1,
                      //           groupValue:1,
                      //           onChanged: (value){},
                      //         ),



                      //         Container(
                      //           width: 300,
                      //           height: 30,
                      //
                      //           padding: EdgeInsets.only(left: 10,top: 0,right: 10,bottom: 5),
                      //           margin: EdgeInsets.only(top: 0.0,left: 0.0,right: 0.0,bottom: 10),
                      //           decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(20.0),
                      //               color: Colors.grey),
                      //           child: Row(
                      //             children:<Widget> [
                      //
                      //               Text(
                      //                 "C./F",
                      //                 style: TextStyle(
                      //                     color: Colors.black,
                      //                     fontSize: 23.0,
                      //                     fontWeight: FontWeight.bold
                      //                 ),
                      //               ),
                      //
                      //
                      //             ],
                      //           ) ,
                      //         )
                      //
                      //       ]),
                      // ),
                      //Container(
                      //
                      //   child:Row(
                      //       children: [
                      //
                      //         Radio(
                      //           value: 1,
                      //           groupValue:1,
                      //           onChanged: (value){},
                      //         ),
                      //
                      //
                      //
                      //         Container(
                      //           width: 300,
                      //           height: 30,
                      //
                      //           padding: EdgeInsets.only(left: 10,top: 0,right: 10,bottom: 5),
                      //           margin: EdgeInsets.only(top: 0.0,left: .0,right: 0.0,bottom: 10),
                      //           decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(20.0),
                      //               color: Colors.grey),
                      //
                      //           child: Row(
                      //             children:<Widget> [
                      //
                      //               Text(
                      //                 "D./K",
                      //                 style: TextStyle(
                      //                     color: Colors.black,
                      //                     fontSize: 23.0,
                      //                     fontWeight: FontWeight.bold
                      //                 ),
                      //               ),
                      //
                      //
                      //             ],
                      //           ) ,
                      //         )
                      //
                      //       ]),
                      // ),
                      // Container(
                      //     width: 385,
                      //     height: 50,
                      //
                      //     padding: EdgeInsets.only(left: 1,top: 5,right: 0,bottom: 10),
                      //     margin: EdgeInsets.only(top: 0,right: 10,left:5,bottom: 0),
                      //
                      //     child: Row(
                      //       children:<Widget> [
                      //         Container(
                      //           margin: EdgeInsets.only(left:4),
                      //           width: 100,
                      //           height: 50,
                      //
                      //           child:ElevatedButton(
                      //
                      //
                      //             child: Text("Previous",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                      //             onPressed:() {
                      //               Navigator.push(
                      //                 context,
                      //                 MaterialPageRoute(builder: (context) => new StudentPaperpage(id: widget.id,)),
                      //               );
                      //
                      //
                      //             },
                      //             style: ElevatedButton.styleFrom(
                      //                 primary: Colors.blue,
                      //
                      //             ),
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           width: 10.0,
                      //         ),
                      //         Container(
                      //           width: 100,
                      //           height: 50,
                      //           color: Colors.white,
                      //           child:ElevatedButton(
                      //
                      //
                      //             child: Text("Submit",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                      //             onPressed:() {
                      //
                      //
                      //
                      //             },
                      //             style: ElevatedButton.styleFrom(
                      //                 primary: Colors.blue,
                      //
                      //             ),
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           width: 10.0,
                      //         ),
                      //         Container(
                      //
                      //           width: 100,
                      //           height: 50,
                      //           child:ElevatedButton(
                      //
                      //
                      //             child: Text("Next",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                      //             onPressed:() {
                      //               Navigator.push(
                      //                 context,
                      //                 MaterialPageRoute(builder: (context) => new studentpg3(id: widget.id,)),
                      //               );
                      //
                      //
                      //             },
                      //             style: ElevatedButton.styleFrom(
                      //                 primary: Colors.blue,
                      //
                      //             ),
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           width: 20.0,
                      //         ),
                      //

                              Container(
                                width: 390,
                                height: 50,

                                padding: EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 10),
                                margin: EdgeInsets.only(top: 0,left:5,right: 5,bottom: 0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Colors.grey),

                                child: Row(
                                  children:<Widget> [
                                    Text(
                                      "Q#2",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "In flowchart reactangle symbol indicates",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),



                                  ],
                                ),
                              ),

                              Column(

                                children: <Widget>[
                                  ListTile(

                                    title: Text('A.Input/Output',style: TextStyle(fontSize: 20.0),),
                                    leading: Radio(
                                      value: 'NH',
                                      groupValue: role,
                                      onChanged: (value) {
                                        setState(() {
                                          role = value.toString();
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),


                      Column(
                        children: <Widget>[
                          ListTile(

                            title: Text('B.Conector',style: TextStyle(fontSize: 20.0),),
                            leading: Radio(
                              value: 'ct',
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                role = value.toString();
                                });
                              },
                            ),
                          )
                        ],
                      ),

                              Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text('C.Proce',style: TextStyle(fontSize: 20.0),),
                                    leading: Radio(
                                      value: 'OO',
                                      groupValue: role,
                                      onChanged: (value) {
                                        setState(() {
                                        role = value.toString();
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text('D.Decision',style: TextStyle(fontSize: 20.0),),
                                    leading: Radio(
                                      value: 'CD',
                                      groupValue: role,
                                      onChanged: (value) {
                                        setState(() {
                                       role = value.toString();
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                      Container(
                        width: 390,
                        height: 50,

                        padding: EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 10),
                        margin: EdgeInsets.only(top: 0,left:5,right: 5,bottom: 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Colors.grey),

                        child: Row(
                          children:<Widget> [
                            Text(
                              "Q#3:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "In C++ function of a class are called:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),



                          ],
                        ),
                      ),
                      Column(

                        children: <Widget>[
                          ListTile(

                            title: Text('A./Attribute',style: TextStyle(fontSize: 20.0),),
                            leading: Radio(
                              value: 'TG',
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                  role = value.toString();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      Column(

                        children: <Widget>[
                          ListTile(

                            title: Text('B.Method',style: TextStyle(fontSize: 20.0),),
                            leading: Radio(
                              value: 'AS',
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                  role = value.toString();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      Column(

                        children: <Widget>[
                          ListTile(

                            title: Text('C.Member Function',style: TextStyle(fontSize: 20.0),),
                            leading: Radio(
                              value: 'VG',
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                  role = value.toString();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      Column(

                        children: <Widget>[
                          ListTile(

                            title: Text('D.Both A/B',style: TextStyle(fontSize: 20.0),),
                            leading: Radio(
                              value: 'XD',
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                  role = value.toString();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 390,
                        height: 50,

                        padding: EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 10),
                        margin: EdgeInsets.only(top: 0,left:5,right: 5,bottom: 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Colors.grey),

                        child: Row(
                          children:<Widget> [
                            Text(
                              "Q#4:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "The period from 1976 to present is known as?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),



                          ],
                        ),
                      ),
                      Column(

                        children: <Widget>[
                          ListTile(

                            title: Text('A.Third Gen Computer',style: TextStyle(fontSize: 20.0),),
                            leading: Radio(
                              value: 'Customer',
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                  role = value.toString();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      Column(

                        children: <Widget>[
                          ListTile(

                            title: Text('B.Sixth Gen Computer',style: TextStyle(fontSize: 20.0),),
                            leading: Radio(
                              value: 'bh',
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                  role = value.toString();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      Column(

                        children: <Widget>[
                          ListTile(

                            title: Text('C.Fourth Gen Computer',style: TextStyle(fontSize: 20.0),),
                            leading: Radio(
                              value: 'kl',
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                  role = value.toString();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      Column(

                        children: <Widget>[
                          ListTile(

                            title: Text('D.Fifth Gen Computer',style: TextStyle(fontSize: 20.0),),
                            leading: Radio(
                              value: 'gh',
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                  role = value.toString();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 390,
                        height: 50,

                        padding: EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 10),
                        margin: EdgeInsets.only(top: 0,left:5,right: 5,bottom: 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Colors.grey),

                        child: Row(
                          children:<Widget> [
                            Text(
                              "Q#5:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "Secondary memory is also know as?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),



                          ],
                        ),
                      ),
                      Column(

                        children: <Widget>[
                          ListTile(

                            title: Text('A./Auxiliary memory',style: TextStyle(fontSize: 20.0),),
                            leading: Radio(
                              value: 'UJ',
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                  role = value.toString();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      Column(

                        children: <Widget>[
                          ListTile(

                            title: Text('B.Primary memory',style: TextStyle(fontSize: 20.0),),
                            leading: Radio(
                              value: 'VF',
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                  role = value.toString();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      Column(

                        children: <Widget>[
                          ListTile(

                            title: Text('C.Secondary memory',style: TextStyle(fontSize: 20.0),),
                            leading: Radio(
                              value: 'GB',
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                  role = value.toString();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      Column(

                        children: <Widget>[
                          ListTile(

                            title: Text('D.None of above',style: TextStyle(fontSize: 20.0),),
                            leading: Radio(
                              value: 'gKM',
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                  role = value.toString();
                                });
                              },
                            ),
                          )
                        ],
                      ),




                    ],
                          )
                      ),



        )


    );


  }
}
