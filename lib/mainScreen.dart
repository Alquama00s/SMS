import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secret_messeging_service/initiateUser.dart';
import 'package:secret_messeging_service/widgetLib.dart';
import 'graphics.dart';
import 'decrypt.dart';
import 'commonfunctions.dart';
import 'encrypt.dart';
import 'Global.dart';
import 'Keymanager.dart';
class Mainscreen extends StatefulWidget{
  @override
  _MainscreenState createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  Widget _switch = Decrypt();
  bool _Switch_ = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColor,
      body: Container(
        child: Stack(
          children: [
            Stack(
              children: [
                TweenAnimationBuilder(
                  tween: Tween(begin: -700.0, end: -MediaQuery.of(context).size.height*0.77),
                  duration: Duration(seconds: 1),
                  curve: Curves.easeOut,
                  builder: (context, value, Widget) {
                    return Stack(
                      children: [
                        Positioned(
                          top: value,
                          child: DarkCurvedBar(),
                        ),
                      ],
                    );
                  },
                ),
                AnimatedPositioned(
                    duration: Duration(seconds: 1),
                    curve: Curves.ease,
                    top: 75,
                    right: _Switch_
                        ? -MediaQuery.of(context).size.width * 0.5
                        : MediaQuery.of(context).size.width * 0.0,
                    child: Container(
                      width: MediaQuery.of(context).size.width *1.5,
                      height: 35,
                      child: Stack(
                        children: [
                          Positioned(
                            right: -15,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2+15,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                color: BaseColor),
                          ),
                        ),
                          Positioned(
                            left: -15,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2+15,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                  color: BaseColor),
                            ),
                          ),
                        ],
                      ),
                    ),),
                Positioned(
                  top: 28,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                            child: Icon(
                              Icons.vpn_key,
                              color: Colors.white,
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>KeyManager()));
                            },
                          ),
                            SizedBox(width: 10,),
                            GestureDetector(
                              child: Icon(
                                Icons.supervised_user_circle,
                                color: Colors.white,
                              ),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Showinfo()));
                              },
                            ),

                          ],
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.info,
                            color: Colors.white,
                          ),
                          onTap: (){
                            License(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 73,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                          GestureDetector(
                            child: Container(
                              child: Text(
                                'Decrypt',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                _switch = Decrypt();
                                _Switch_ = true;
                              });
                            },
                          ),
                          //SizedBox(width: MediaQuery.of(context).size.width*0.15,),
                          GestureDetector(
                            child: Container(
                              child: Text(
                                'Encrypt',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                _switch = Encrypt();
                                _Switch_ = false;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 130,
              child: GestureDetector(
                child: _switch,
                onHorizontalDragUpdate: (data) {
                  if (data.delta.dx > 0) {
                    setState(() {
                      _switch = Decrypt();
                      _Switch_ = true;
                    });
                  } else {
                    setState(() {
                      _switch = Encrypt();
                      _Switch_ = false;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Launcher extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkUser(),
        builder: (context,snap){
          if(snap.connectionState==ConnectionState.done){
            if(snap.data==true){
              return Mainscreen();
            }else{
              return Initiate();
            }
          }
      return Loading();
    });
  }
}

