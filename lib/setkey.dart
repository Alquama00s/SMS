import 'package:flutter/material.dart';
import 'widgetLib.dart';
import 'getContacts.dart';
import 'commonfunctions.dart';
class Setkey extends StatefulWidget{
  @override
  _SetkeyState createState()=> _SetkeyState();
}
class _SetkeyState extends State<Setkey>{
  String keypass,num='Type your number';
  Function save(String value,String valname){
    if(value!='')
      setState(() {
        num=value;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Builder(builder:(context)=> Container(
        padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 5, 0),
                alignment: Alignment.topLeft,
                child: Text(
                  'Enter Key',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 20,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                color: Colors.grey[350],
                child: TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) => {
                    keypass = value,
                  },
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    hintText: 'Key',
                    border: InputBorder.none,
                    //labelText: hint[0].toUpperCase()+hint.substring(1),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Field(TextInputType.number,num, 'number', true, (v){num=v;}),
              RaisedButton(onPressed: ()=>{
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>ContactLoader(save))
                ),
              },
                child: Text('Select from contacts'),
              ),
              RaisedButton(onPressed: ()async=>{
                Scaffold.of(context).showSnackBar(SnackBar(content: Text(await setKey(keypass,num)))),
              },
                child: Text('Set key'),
              ),
              RaisedButton(onPressed: ()async=>{
                Scaffold.of(context).showSnackBar(SnackBar(content: Text(await saveKey()))),
              },
                child: Text('Save key'),
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}