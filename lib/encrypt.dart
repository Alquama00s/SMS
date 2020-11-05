import 'package:flutter/material.dart';
import 'widgetLib.dart';
import 'getContacts.dart';
class Encrypt extends StatefulWidget{
  @override
  _EncryptState createState()=>_EncryptState();
}
class _EncryptState extends State<Encrypt>{
  String msg='';
  String number='';
  String name='';
  Function save(String value,String valname){
    if(value!='')
      number=value;
    if(valname!='') {
      setState(() {
        name = valname;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(0,30, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RaisedButton(onPressed: null,
                  child: Text('Set Key'),
                ),
                SizedBox(width: MediaQuery.of(context).size.width-120,),
              ],
            ),
            SizedBox(
              height: 200,
            ),
            Field(TextInputType.text, 'Your messege', 'Type in', true, (value){msg=value;}),
            RaisedButton(onPressed: ()=>{
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>ContactLoader(save))
              ),
            },
              child: Text('$number$name'),
            ),
            RaisedButton(onPressed: ()=>{
              print(name+'\n'+number),
            },
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}