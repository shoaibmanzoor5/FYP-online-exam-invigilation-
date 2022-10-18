import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'mainpage.dart';
import"dart:convert" as convert;


class datepaper extends StatefulWidget {
  var id;

  datepaper({Key? key,required this.id}) : super(key: key);


  @override
  _MyAdminState createState() => _MyAdminState();
}

class _MyAdminState extends State<datepaper> {
  final question=TextEditingController();
  Future<List<dynamic>> showData() async {
    print("w");
    var _message;
    var response = await http.post(
        Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/datesearch'),
    body: {
      "papername": question.text,
    });

    if (response.statusCode == 200) {
      _message = response.body.toString();
      var jsonResult=convert.jsonDecode(response.body) as List<dynamic>;
      var extra=jsonResult;
      length=jsonResult.length;
      print(length);
      // for(int i =0 ; i < length;i++)
      // {
      //
      //   selectA.add(false);
      //   selectB.add(false);
      //   selectC.add(false);
      //   selectD.add(false);
      // }

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

          body:Column(
            children: [
              Container(
                width: 300,
                height: 100,
                margin: EdgeInsets.only(top:10,left: 10),

                child: TextField(
                  controller: question,

                  //onChanged: (value) => UserNameField = value,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Enter papername',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left:0,top: 5),
                margin: EdgeInsets.only(top:10,left: 10),
                width:200,
                height: 50,

                child:ElevatedButton(


                  child: Text("Search ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                  onPressed:() {
                    setState(() {
                      showData();
                    });

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => new allpaper(id: widget.id,)),
                    // );


                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,

                  ),
                ),
              ),
              // SizedBox(
              //   height: 40,
              // ),

              Container(
                color: Colors.grey,
                width: 300,
                height: 440,
                margin: EdgeInsets.only(top: 20,left:5,right: 5,bottom: 0),
                child: FutureBuilder<List<dynamic>>(
                  future: showData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(

                          itemCount: length,
                          itemBuilder: (context, index) {

                            return Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 200,
                                    height: 50,

                                    padding: EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 10),
                                    margin: EdgeInsets.only(top: 0,left:5,right: 5,bottom: 0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25.0),
                                        color: Colors.white),

                                    child: Row(
                                      children:<Widget> [

                                        Text(
                                          snapshot.data![index]["papername"].toString(),
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






