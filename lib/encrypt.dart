import 'package:flutter/material.dart';
import 'package:secret_messeging_service/commonfunctions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgetLib.dart';
import 'getContacts.dart';
import'package:flutter/services.dart';
import 'setkey.dart';
import 'external.dart';
class Encrypt extends StatefulWidget {
  @override
  _EncryptState createState() => _EncryptState();
}

class _EncryptState extends State<Encrypt> {
  String dropdownValue = 'Default';
  String name='Reciever\'s no.',number='',msg='Your Message',temp='';
  Function save(String value,String valname){
    if(value!='')
      number=value;
    if(valname!='') {
      setState(() {
        name = valname;
      });
    }
  }
  final snackBar = SnackBar(
    content: Text('Encrypted message copied to Clipboard'),
    backgroundColor: Color(0xFF2a3950),
  );
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
                    dropdownColor: Color(0xFF2a3950),
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
                  function: (v)=>{number=v},
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
                  'Encrypt',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            onTap: ()async=>{
              temp=await encrypt(msg, number),
              setState((){
                msgController.clear();
                msg=temp;
                Clipboard.setData(new ClipboardData(text: msg));

              }),

    Scaffold.of(context).showSnackBar(snackBar),
            },
          ),
        ],
      ),
    );
  }
}
