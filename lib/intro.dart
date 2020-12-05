import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secret_messeging_service/Global.dart';
import 'mainScreen.dart';
import 'graphics.dart';
import 'Global.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  var _animbeg = 0.0, _animend = -700.0, disp = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2a3950),
      body: Container(
        child: Stack(
          children: [
            disp
                ? Column(children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.fromLTRB(0, 250, 0, 10),
                        child: Container(
                          padding: EdgeInsets.all(30),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ])
                : Container(),
            TweenAnimationBuilder(
              tween: Tween(begin: _animbeg, end: _animend),
              duration: Duration(seconds: 1),
              curve: Curves.easeOut,
              builder: (context, value, Widget) {
                return Stack(
                  children: [
                    Positioned(
                      top: value,
                      child: CurvedBar(),
                    ),
                    disp
                        ? Positioned(
                            top: (value >
                                    -MediaQuery.of(context).size.height * 0.4)
                                ? (MediaQuery.of(context).size.height / 2 +
                                    value)
                                : (MediaQuery.of(context).size.height / 2 -
                                    MediaQuery.of(context).size.height * 0.4),
                            left: (MediaQuery.of(context).size.width / 2 - 50),
                            child: MainIcon(),
                          )
                        : Container(),
                  ],
                );
              },
              onEnd: () {
                if (disp == false) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Launcher()),
                      (Route<dynamic> route) => false);
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.navigate_next,
        color: Colors.white,
        ),
        backgroundColor: SecColor,
        onPressed: () {
          setState(() {
            disp = false;
            _animbeg = -700.0;
            _animend = -MediaQuery.of(context).size.height*0.77;
          });
        },
      ),
    );
  }
}
