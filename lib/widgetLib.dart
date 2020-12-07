import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'handlePermission.dart';
import 'intro.dart';
import 'Global.dart';
import 'package:url_launcher/url_launcher.dart';
import 'graphics.dart';

///error page
class Error extends StatelessWidget {
  final String data;
  Error(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColor,
      body: Container(
        child: Stack(
          children: <Widget>[
            /*TweenAnimationBuilder(
              tween: Tween(
                  begin: -700.0,
                  end: -MediaQuery.of(context).size.height * 0.77),
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
            ),*/
            Positioned(
              top: MediaQuery.of(context).size.height * 0.18,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      color: BaseColor,
                      padding: EdgeInsets.all(20),
                      child: Icon(
                        Icons.error,
                        color: SecColor,
                        size: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        'Error !',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: SecColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 110,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        data,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: Container(
                        color: DeepBase,
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width - 50,
                        child: Text(
                          'Project\'s Github page',
                          style: TextStyle(
                            fontSize: 20,
                            color: SecColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap: () => launch('https://github.com/Alquama00s/SMS'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///the loading page
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColor,
      body: Container(
        child: Stack(
          children: <Widget>[
            /*TweenAnimationBuilder(
              tween: Tween(
                  begin: -700.0,
                  end: -MediaQuery.of(context).size.height * 0.77),
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
            ),*/
            Positioned(
              top: MediaQuery.of(context).size.height * 0.18,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.all_inclusive,
                      color: SecColor,
                      size: 150,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        'Just a minute',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    SizedBox(
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        valueColor: AlwaysStoppedAnimation<Color>(SecColor),
                      ),
                      width: 60,
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
