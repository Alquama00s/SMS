import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mainScreen.dart';
import 'widgetLib.dart';
import 'package:permission_handler/permission_handler.dart';
class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Permission.contacts.status.isGranted,
      builder: (context,snap){
        if(snap.connectionState == ConnectionState.done){
          if(snap.data==true) {
            return MainScreen();
          }
          else{
            Permission.contacts.request();
            return Error('Restart the app with storage permission\n'
                'This issue will be resolved in future release');
          }
        }else{
          return Loading();
        }
      },
    );
  }
}
