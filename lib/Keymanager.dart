import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secret_messeging_service/Global.dart';
import 'commonfunctions.dart';
import 'package:url_launcher/url_launcher.dart';


///Get user no
class KeyManager extends StatefulWidget {
  @override
  _KeyManagerState createState() => _KeyManagerState();
}

class _KeyManagerState extends State<KeyManager> {
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
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      'Key Manager',
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
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
            SizedBox(
              height: 80,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              child: Text(
                'This section is currently under development.\n'
                    'Please give your valuable feedback to the developer\n'
                    'for more info head on to :',
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF1a2432),
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                color: DeepBase,
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width - 50,
                child: Text(
                  'Project\'s Github page',
                  style: TextStyle(
                    fontSize: 30,
                    color:SecColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              onTap: () => launch('https://github.com/Alquama00s/SMS'),
            ),
          ],
        ),
      ),
    );
  }
}
