import 'package:flutter/material.dart';

import 'Studentpaper1.dart';
class Facenoeror extends StatefulWidget {
  var id;


  Facenoeror({Key? key, required this.id}) : super(key: key);

  @override
  _FacenoerorState createState() => _FacenoerorState();
}

class _FacenoerorState extends State<Facenoeror> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.black,

        body:Column(
          children: [
            Container(
              width: 350,
              height: 450,

              margin: EdgeInsets.only(top: 70.0,left: 10.0,right: 0),
              padding: EdgeInsets.all(15.0),

              child:Row(
                children:[
                  Container(
                    margin: EdgeInsets.only(left: 15,right: 5,top: 10,bottom:70 ),
                    width: 280,
                    height:430,
                    color: Colors.pink,
                    child: Image.asset('image/UserLogo.PNG',

                      fit:BoxFit.fill,),

                  ),

                ],),),
            Container(

              padding:EdgeInsets.only(left: 40,top: 10.0,right: 5,),
              margin: EdgeInsets.only(top: 5.0,left: 30.0,right: 30.0,),
              width: 300,
              height:80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
                color: Colors.grey,
              ),

              child: Text('Face Successfully Recognize  ',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,

              ),


              ),

            ),
            SizedBox(
              height: 15,
            ),
            CircleAvatar(

              radius: 35.0,
              backgroundColor:Colors.white,
              child: IconButton(
                color: Colors.black,
                onPressed:() {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new StudentPaperpage(id: widget.id, time: null,)),
                  );
                },
                icon: Icon(Icons.arrow_forward ,size: 30,),
              ),
            ),
          ],),),

    );

  }
}


