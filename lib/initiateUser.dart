
import 'package:flutter/material.dart';
import 'package:secret_messeging_service/Global.dart';
import 'package:secret_messeging_service/intro.dart';
import 'package:secret_messeging_service/widgetLib.dart';
import 'commonfunctions.dart';
import 'external.dart';
import 'getContacts.dart';
import 'mainScreen.dart';
class Initiate extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:checkUser() ,
        builder: (context,snap){
        if(snap.connectionState==ConnectionState.done){
          if(snap.data==true){
            return Intro();
          }else{
            return Showinfo();
          }
        }
        return Loading();
        }
    );
  }
}
///Get user no
class Showinfo extends StatefulWidget{
  @override
  _ShowinfoState createState() => _ShowinfoState();
}

class _ShowinfoState extends State<Showinfo> {
  String num='',name='Your Phone Number';

  Function save(String value,String valname){
    if(value!='')
      num=value;
    if(valname!='') {
      setState(() {
        name = valname;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2a3950),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 5),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[ Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 52,
                  color: Color(0xFF009393),
                  child: Field(
                    hint: name,
                    type: TextInputType.number,
                    function:(v)=>num=v,
                  ),),
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
            SizedBox(height: 10,),
            FutureBuilder(
              future: readUser(),
              builder: (context,snap){
                if(snap.connectionState==ConnectionState.done){
                  if(snap!=''){
                    return Container(
                      width: MediaQuery.of(context).size.width-50,
                      child: Text(
                        'Current number: ${snap.data}\n',
                        style: TextStyle(
                          fontSize: 25,
                          color: DeepBase,
                        ),
                      ),
                    );
                  }
                }
                return Container();
              },
            ),
            SizedBox(height: 40,),
            MediaQuery.of(context).viewInsets.bottom==0?
            Container(
              width: MediaQuery.of(context).size.width-50,
              child: Text(
                'your phone number is required to generate a key'
                    ' which is then combined with the key generated'
                    ' from the receiver\'s number, So that a key unique to'
                    ' You and the receiver is created automatically.',
                style: TextStyle(
                  fontSize: 30,
                  color: DeepBase,
                ),
              ),
            ):Container(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.update,
          color: Colors.white,
        ),
        backgroundColor:SecColor ,
        onPressed: ()=>{
          if(num.length>=10){
            num=num.replaceAll(new RegExp(r"\s+"), "").split('').reversed.join().substring(0,10)
                .split('').reversed.join(),
            writeUser({'number':num}),
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context)=>Launcher()), (route) => false)
          }else{
            setState((){
       name='Invalid number !';
    }),
          }
          },
      ),
    );
  }
}