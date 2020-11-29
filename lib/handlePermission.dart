import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'intro.dart';
import 'widgetLib.dart';
import 'package:permission_handler/permission_handler.dart';
import 'mainScreen1.dart';

class Handle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: [
        Permission.contacts,
        Permission.storage,
      ].request(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          //print(snap.data);
          if (snap.data[Permission.contacts] == PermissionStatus.granted &&
              snap.data[Permission.storage] == PermissionStatus.granted) {
            return Intro();
          } else {
            if (snap.data[Permission.contacts] != PermissionStatus.granted)
              Permission.contacts.request();
            if (snap.data[Permission.storage] != PermissionStatus.granted)
              Permission.storage.request();
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
