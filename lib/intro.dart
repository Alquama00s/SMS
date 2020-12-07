import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secret_messeging_service/Global.dart';
import 'mainScreen.dart';
import 'graphics.dart';
import 'Global.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  var _animbeg = 0.0, _animend = -700.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2a3950),
      body: Container(
        child: Stack(
          children: [
            Column(children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.fromLTRB(0, 250, 0, 10),
                        child: Container(
                          padding: EdgeInsets.all(30),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Ever faced security concerns while sending a personal '
                                'message like maybe a pin \n'
                                'No worries we got u covered Dots and dashes encrypts your '
                                'secret using AES'
                                ' algorithm which by the way is most trusted encryption algorithm'
                                ' as of now.\n\n'
                                'Just enter your message then enter the phone number of the intended'
                                ' receiver and encrypt your message into bunch of Dots & dashes.\n\n'
                                ' Send these dots and dashes to the receiver... No no they are no morse '
                                ' code and no computer can decrypt it except the intended user.\n\n'
                                ' Then while decrypting just paste those Dots & dashes then select'
                                ' the senders number and decrypt!\n\n'
                                ' The pair of phone number (your\'s and the receiver\'s)'
                                ' are used to generate unique key with which your secret is encrypted.\n\n'
                                'Tap the icon to go to project\'s github page',
                             style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
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
                     Positioned(
                            top: (value >
                                    -MediaQuery.of(context).size.height * 0.4)
                                ? (MediaQuery.of(context).size.height / 2 +
                                    value)
                                : (MediaQuery.of(context).size.height / 2 -
                                    MediaQuery.of(context).size.height * 0.4),
                            left: (MediaQuery.of(context).size.width / 2 - 50),
                            child: GestureDetector(child: MainIcon(),
                            onTap: () => launch('https://github.com/Alquama00s/SMS'),
                            ),
                          ),
                  ],
                );
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
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Launcher()),
                    (Route<dynamic> route) => false);
          });
        },
      ),
    );
  }
}
