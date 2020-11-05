import 'package:flutter/material.dart';
import 'encrypt.dart';
class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(0,25, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(onPressed:()=>{
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=>Encrypt())
              ),
            },
              child: Text('Encrypt'),
            ),
            RaisedButton(onPressed: null,
              child: Text('Decrypt'),
            ),
          ],
        ),
      ),
    );
  }
}