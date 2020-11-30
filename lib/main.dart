import 'package:flutter/material.dart';
import 'handlePermission.dart';
import 'graphics.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  DateTime now = new DateTime.now();
  final Expire = DateTime(2020, 12, 31);

  @override
  Widget build(BuildContext context) {
    if (Expire.difference(now).inDays >= 0) {
      return MaterialApp(
        home: Handle(),
        theme: ThemeData(
            primaryColor: Color(0xFF2a3950),
            fontFamily: 'Breeserif',
            inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.white),
            )),
      );
    }else{
      return MaterialApp(
        home: Error('This version of app is expired\n'
            'head to https://github.com/Alquama00s/SMS/release \nfor a newer version'),
      );
    }
  }
}
///error page
class Error extends StatelessWidget {
  final String data;
  Error(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'Error',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                data,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

///test
class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2a3950),
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.25,
        child: CurvedBar(),
      ),
    );
  }
}