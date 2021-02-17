import 'package:flutter/material.dart';
import 'package:secret_messeging_service/Global.dart';
import 'handlePermission.dart';
import 'graphics.dart';
import 'widgetLib.dart';
void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  DateTime now = new DateTime.now();
  final Expire = DateTime(2020, 12, 31);

  @override
  Widget build(BuildContext context) {
    //if (Expire.difference(now).inDays >= 0) {
      return MaterialApp(
        home: Handle(),
        theme: ThemeData(
            primaryColor: BaseColor,
            accentColor: SecColor,
            fontFamily: 'Breeserif',
            inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.white),
            )),
      );
    /*}else{
      return MaterialApp(
        home: Error('This version of app is expired'),
      );
    }*/
  }
}
///test
class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Error('hllo'),
    );
  }
}