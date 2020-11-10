import 'package:flutter/material.dart';
import 'package:secret_messeging_service/commonfunctions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgetLib.dart';
import 'getContacts.dart';
import 'setkey.dart';
class Decrypt extends StatefulWidget{
  @override
  _DecryptState createState()=>_DecryptState();
}
class _DecryptState extends State<Decrypt>{
  String _enmsg,msg='',local='',_enenkey;
  String sendnumber='';
  //String name='Example Sam';
  /*Function save(String value,String valname){
    if(value!='')
      number=value;
    if(valname!='') {
      setState(() {
        name = valname;
      });
    }
  }*/
  Function saveself(String value,String valname){
    if(value!='')
      setState(() {
        sendnumber=value;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(0,30, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              RaisedButton(onPressed: ()async=>{
                _enenkey=await selectKey(),
              },
                child: Text('Select sender\'s Key'),
              ),
              SizedBox(
                height: 20,
              ),
              Field(TextInputType.number,'sender\'s number', 'number', true, (v){sendnumber=v;}),
              RaisedButton(onPressed: ()=>{
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>ContactLoader(saveself))
                ),
              },
                child: Text('Select from contacts'),
              ),
              Field(TextInputType.text, 'Encoded messege', 'Type in', true, (value){_enmsg=value;}),

              RaisedButton(onPressed: ()async=>{
                local=await decrypt(_enenkey, _enmsg, sendnumber),
                setState(()=>{
                  msg=local,
                }),
              },
                child: Text('Decrypt'),
              ),
              Container(
                child: Text('$msg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}