import 'package:flutter/material.dart';
import 'package:secret_messeging_service/commonfunctions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgetLib.dart';
import 'getContacts.dart';
import 'setkey.dart';
import 'external.dart';
import 'Global.dart';
class Decrypt1 extends StatefulWidget{
  @override
  _Decrypt1State createState()=>_Decrypt1State();
}
class _Decrypt1State extends State<Decrypt1>{
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
              Field(),
              RaisedButton(onPressed: ()=>{
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>ContactLoader(saveself))
                ),
              },
                child: Text('Select from contacts'),
              ),
              //Field(TextInputType.text, 'Encoded messege', 'Type in', true, (value){_enmsg=value;}),

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
class Decrypt extends StatefulWidget {
  @override
  _DecryptState createState() => _DecryptState();
}

class _DecryptState extends State<Decrypt> {
  String dropdownValue = 'Default';
  String name='Author\'s no.',number='',msg='Your Message',temp='';
  Function save(String value,String valname){
    if(value!='')
      number=value;
    if(valname!='') {
      setState(() {
        name = valname;
      });
    }
  }
  final msgController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 30,
          ),
          //drop down
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.7 + 72,
            height: 52,
            color: Color(0xFF009393),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.24,
                  child: Text(
                    'Key Type :',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.58,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    dropdownColor: BaseColor,
                    value: dropdownValue,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    iconSize: 30,
                    elevation: 16,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent.withOpacity(0),
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['Default']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontFamily: 'Breeserif'),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //row of contacts info
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 52,
                color: Color(0xFF009393),
                child: Field(
                  type: TextInputType.number,
                  hint: name,
                  function: (v)=>{
                    number=v,
                  },
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                child: Container(
                  width: 52,
                  height: 52,
                  color: Color(0xFF009393),
                  child: Icon(
                    Icons.contacts,
                    color: Colors.white,
                  ),
                ),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>ContactLoader(save))
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.7 + 72,
            height: 208,
            color: Color(0xFF009393),
            child: Field(
              type: TextInputType.text,
              max: 5,
              hint: msg,
              controller: msgController,
              function: (v)=>{msg=v,},
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7 + 72,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.all(Radius.circular(50)),
                color: Color(0xFF009393),
              ),
              child: Center(
                child: Text(
                  'Decrypt',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            onTap: ()async=>{
              if(msg!=''&& number!=''){
                temp=await decrypt('',msg,number),
                print(temp),
                setState((){
                  msgController.clear();
                  msg=temp;
                }),
              }
            },
          ),
        ],
      ),
    );
  }
}

