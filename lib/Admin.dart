import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlineexaminvigilation0001/rules.dart';

import 'Admin2pg.dart';
import 'allpapershow.dart';
import 'datepaper.dart';
import 'datesheet.dart';
import 'faceerror.dart';
import 'list.dart';
import 'main.dart';
import 'mainpage.dart';


class MyAdmin extends StatefulWidget {
  var id;

  MyAdmin({Key? key,required this.id}) : super(key: key);


  @override
  _MyAdminState createState() => _MyAdminState();
}

class _MyAdminState extends State<MyAdmin> {

  get length => null;

  @override
  Widget build(BuildContext context) {
    return Container(


        child: Scaffold(

          backgroundColor: Colors.white,
          appBar: AppBar(

            backgroundColor: Colors.blue,

            title: Text('Admin', style: TextStyle(
                color:Colors.white ,
                fontSize: 25,

                fontWeight: FontWeight.bold
            ),),
            actions:<Widget> [

              ElevatedButton(

                child: Text("Logout",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white,),),
                onPressed:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new mainpage(id: widget.id,)),
                  );

                },
                style: ElevatedButton.styleFrom(

                  primary: Colors.blue,

                ),

              ),
            ],
          ),

          body: Stack(
            children:<Widget>[
              Container(
                padding: EdgeInsets.only(left:0,top: 5),
                margin: EdgeInsets.only(top:30,left: 10),
                width:200,
                height: 50,

                child:ElevatedButton(


                  child: Text("Search History",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                  onPressed:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => new allpaper(id: widget.id,)),
                    );


                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,

                  ),
                ),
              ),


              Container(
                padding: EdgeInsets.only(left:0,top: 5),
                margin: EdgeInsets.only(top:100,left: 10),
                width:200,
                height: 50,

                child:ElevatedButton(


                  child: Text("Next",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                  onPressed:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => new datepaper(id: widget.id,)),
                    );


                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,

                  ),
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(left: 115,top: 130),
              //
              //   width: 140,
              //   height: 140,
              //   child: CircleAvatar(
              //     radius: 45,
              //     child: ClipOval(
              //       child: Image.asset('image/logonlineexam.jpg',
              //         fit: BoxFit.cover,
              //         width: 140,
              //         height: 140,
              //       ),
              //     ),
              //   ),
              // ),
              // Container(
              //   child: Container(
              //
              //     alignment: Alignment.topCenter,
              //
              //     margin: EdgeInsets.only(left: 5,top: 280),
              //
              //     child: Text('OEIS',style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       color: Colors.white,
              //       fontSize: 45.0,
              //
              //     )),
              //   ),
              // ),

            ],
          ),
        )

    );
    throw UnimplementedError();
  }
}


//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage('image/login.png'), fit: BoxFit.cover)),
//         child: Scaffold(
//           backgroundColor:Colors.black,
//           body: Stack(
//             children:<Widget>[
//               Container(
//                 child: Container(
//                   margin: EdgeInsets.only(left: 110,top: 330),
//                   child: Text('Admin',style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     fontSize: 60.0,
//
//                   )),
//                 ),
//               ),
//               SingleChildScrollView(
//                 child: Container(
//                   padding: EdgeInsets.only(
//                       top:MediaQuery.of(context).size.height*0.5,
//                       right:35.0,
//                       left: 60.0),
//
//                   child: Column(
//                       children:<Widget> [
//                         SizedBox(
//                           height: 70,
//                         ),
//                         SizedBox(
//
//                           width:300,
//                           height: 50,
//                           child:ElevatedButton(
//
//                             child: Text("Customize API",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
//                             onPressed:() {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => new Admin2pg()),
//                               );
//
//                             },
//                             style: ElevatedButton.styleFrom(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(20)
//                                 )
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//
//
//                           height: 70,),
//                         SizedBox(
//
//                           width:150,
//                           height: 50,
//                           child:ElevatedButton(
//
//                             child: Text("Logout",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
//                             onPressed:() {
//
//
//                             },
//                           ),
//                         ),
//                       ]
//
//
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )
//
//     );
//
//
//
//
//
//   }
// }






