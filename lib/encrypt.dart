import 'package:flutter/material.dart';
import 'package:secret_messeging_service/commonfunctions.dart';
import 'widgetLib.dart';
import 'getContacts.dart';
import 'setkey.dart';
class Encrypt extends StatefulWidget{
  @override
  _EncryptState createState()=>_EncryptState();
}
class _EncryptState extends State<Encrypt>{
  String _enmsg,msg='';
  String selfnumber='',number='';
  String name='Example Sam';
  Function save(String value,String valname){
    if(value!='')
      number=value;
    if(valname!='') {
      setState(() {
        name = valname;
      });
    }
  }
  Function saveself(String value,String valname){
    if(value!='')
      setState(() {
        selfnumber=value;
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RaisedButton(onPressed: ()=>{
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Setkey())
                    ),
                  },
                    child: Text('Set Key'),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width-120,),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Field(TextInputType.number,'your number', 'number', true, (v){selfnumber=v;}),
              RaisedButton(onPressed: ()=>{
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>ContactLoader(saveself))
                ),
              },
                child: Text('Select from contacts'),
              ),
              Field(TextInputType.text, 'Your messege', 'Type in', true, (value){msg=value;}),
              GestureDetector(
                onTap: ()=>{
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>ContactLoader(save))
                  ),
                },
                child: Field(TextInputType.text, name, 'Select recipient', false, (value){}),
              ),
              RaisedButton(onPressed: ()async=>{
                _enmsg=await encrypt(msg,selfnumber),
                print(_enmsg),
              },
                child: Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}