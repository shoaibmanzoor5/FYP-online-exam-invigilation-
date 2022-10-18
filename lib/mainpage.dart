

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlineexaminvigilation0001/main.dart';

import 'Admin.dart';
import 'Student.dart';
import 'invigilaterhomepage.dart';




class mainpage extends StatefulWidget {
  var id;
  mainpage({Key? key,required this.id}) : super(key: key);

  



  @override
  State<mainpage> createState() => _MymainpageState();
}

class _MymainpageState extends State<mainpage> {
  String UserNameField = "No Value Entered";
  late SnackBar sb;
  final idd = TextEditingController();

  final password = TextEditingController();


  var _msg;



  Future<void> Post() async {
    MyApp.Username=idd.text.toString();
    print("g");
    print("logincalling");
    var response = await http.post(
       // Uri.parse('http://'+MyApp.ip+'/FYPInvigilation/api/fyp/Login'),
        Uri.parse('http://'+MyApp.ipaddress+'/login'),
        body: {
          "email": idd.text.toString(),
          "password": password.text.toString(),
        }).timeout(const Duration(seconds: 60));
    print("111111");
    print(response.body.toString());
       print("11223");
      _msg = response.body.toString();
      print("11231");
      print(_msg);
      if (_msg == "STUDENT") {
        print("abc");
         Navigator.push(context, MaterialPageRoute(builder:(context)=>Studentpage(id:idd.text)));

      }

      if (_msg == "admin") {
        print("xyz");
        Navigator.push(context, MaterialPageRoute(builder:(context)=>MyAdmin(id: idd.text.toString(),)));
      }
      if (_msg == "INVIGILATOR") {
        print('invid:${idd.text.toString()}');
        Navigator.push(context, MaterialPageRoute(builder:(context)=>invigilater(id: idd.text.toString(),)));
      }
    // } else {
    //   print(response.body.toString());
    //   setState(() {
    //     _msg = response.body.toString();
    //     print(_msg);
    //
    //     sb = SnackBar(content: Text('Plzz Enter Correct Email And Password'));
    //     ScaffoldMessenger.of(context).showSnackBar(sb);
    //   });
    // }
  }
  //  checkData() async {
  //   var _message;
  //   var response = await http.post(
  //       Uri.parse('http://'+MyApp.ip+'/invigilation/api/std/login12'),
  //       body: {
  //         "sID": id.text,
  //         "sPassword": password.text,
  //       });
  //   print (response.statusCode);
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     _message = response.body.toString();
  //     //obj
  //
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => Studentpage(id: id.text,)),
  //     );}
  //   else {
  //     sb = SnackBar(content: Text('Plzz Enter Correct Email And Password'));
  //     ScaffoldMessenger.of(context).showSnackBar(sb);
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(


        child: Scaffold(
          backgroundColor:Colors.black,
          body: Stack(
            children:<Widget>[
              Container(
                margin: EdgeInsets.only(left: 115,top: 130),

                width: 140,
                height: 140,
                child: CircleAvatar(
                  radius: 45,
                  child: ClipOval(
                    child: Image.asset('image/logonlineexam.jpg',
                      fit: BoxFit.cover,
                      width: 140,
                      height: 140,
                    ),
                  ),
                ),
            ),
              Container(
                child: Container(

                  alignment: Alignment.topCenter,

                  margin: EdgeInsets.only(left: 5,top: 280),

                  child: Text('OEIS',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 45.0,

                  )),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top:MediaQuery.of(context).size.height*0.5,
                      right:35.0,
                      left: 35.0),

                  child: Column(
                      children:<Widget> [
                        TextField(
                          controller: idd,

                          //onChanged: (value) => UserNameField = value,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'Username',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        TextField(
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,

                              filled: true,
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),),
                        SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:<Widget> [
                            Text(
                              'Login',style: TextStyle(
                              color:Colors.white,
                              fontSize: 27.0,fontWeight: FontWeight.w700,),
                            ),
                            CircleAvatar(
                              radius: 30.0,
                              backgroundColor:Colors.white,
                              child: IconButton(
                                color: Colors.black,
                                onPressed:() {
                                  Post();
                                  /*if(UserNameField=="A") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => new MyAdmin()),
                                    );
                                  } else if(UserNameField=="S") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => new Studentpage()),
                                    );
                                  }

                                  else if(UserNameField=="I") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => new invigilater()),
                                    );
                                  }
                                  else
                                  {
                                    showDialog(context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(

                                            title: Center(
                                              child: Text("Error",style: TextStyle(color: Colors.red,fontSize: 50),),),
                                            content:  Text(" \n Somethings Wrong \n\n  Check Login details \n Or \n Check Internet Connection \n",textAlign: TextAlign.center,style: TextStyle(fontSize: 30)),


                                          );
                                        }
                                    );
                                  }*/

                                },
                                icon: Icon(Icons.arrow_forward),
                              ),
                            )

                          ],
                        )

                      ]
                  ),
                ),
              ),
            ],
          ),
        )

    );
    throw UnimplementedError();
  }
}
/*void OnLogin(context,String UserNameField)
{



  if(UserNameField=="A") {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new MyAdmin()),
    );
  }
  else
  if(UserNameField=="S") {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new Studentpage()),
    );
  }
  else
  if(UserNameField=="I") {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new invigilater()),
    );
  }
  else {
    showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(

            title: Center(
              child: Text("Error",style: TextStyle(color: Colors.red,fontSize: 50),),),
            content:  Text(" \n Somethings Wrong \n\n  Check Login details \n Or \n Check Internet Connection \n",textAlign: TextAlign.center,style: TextStyle(fontSize: 30)),


          );
        }
    );
  }
}*/


