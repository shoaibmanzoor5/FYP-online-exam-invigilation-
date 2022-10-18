import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mainpage.dart';
import 'main.dart';
class Admin2pg extends StatefulWidget {
  const Admin2pg({Key? key}) : super(key: key);

  @override
  _Admin2pgState createState() => _Admin2pgState();
}

class _Admin2pgState extends State<Admin2pg> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('image/login.png'), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor:Colors.black,
          body: Stack(
            children:<Widget>[
              Container(
                child: Container(
                  margin: EdgeInsets.only(left: 95,top: 260),
                  child: Text('Admin API',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 50.0,

                  )),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top:MediaQuery.of(context).size.height*0.5,
                      right:35.0,
                      left: 60.0),

                  child: Column(
                      children:<Widget> [
                        SizedBox(
                          height: 1,
                        ),
                        SizedBox(

                          width:300,
                          height: 50,
                          child:ElevatedButton(

                            child: Text("Student",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                            onPressed:() {


                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                )
                            ),
                          ),

                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(

                          width:300,
                          height: 50,
                          child:ElevatedButton(

                            child: Text("Invigilator",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                            onPressed:() {


                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                )
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(

                          width:300,
                          height: 50,
                          child:ElevatedButton(

                            child: Text("Paper",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                            onPressed:() {


                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                )
                            ),
                          ),
                        ),
                        SizedBox(


                          height: 50,),
                        SizedBox(

                          width:150,
                          height: 50,
                          child:ElevatedButton(

                            child: Text("Logout",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                            onPressed:() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new mainpage(id: null,)),
                              );

                            },
                          ),
                        ),
                      ]


                  ),
                ),
              ),
            ],
          ),
        )

    );





  }
}



