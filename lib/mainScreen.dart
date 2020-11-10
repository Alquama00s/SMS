import 'package:flutter/material.dart';
import 'encrypt.dart';
import 'decrypt.dart';
import 'commonfunctions.dart';
class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(0,25, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: ()=>{
                    License(context),
                  },
                  child:Icon(
                    Icons.info,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width-70,),
              ],
            ),
            SizedBox(height: 280,),
            RaisedButton(onPressed:()=>{
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=>Encrypt())
              ),
            },
              child: Text('Encrypt'),
            ),
            RaisedButton(onPressed: ()=>{
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Decrypt())
              ),
            },
              child: Text('Decrypt'),
            ),
          ],
        ),
      ),
    );
  }
}