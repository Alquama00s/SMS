import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'handlePermission.dart';
import 'intro.dart';

class Field extends StatelessWidget {
  final String hint, label;
  final bool active;
  final TextInputType type;
  final execute;

  Field(this.type, this.hint, this.label, this.active, this.execute);

  @override
  Widget build(BuildContext context) {
    return Container(
        //height: 60,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          //color: Colors.grey[350],
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              alignment: Alignment.topLeft,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            active
                ? Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              color: Colors.grey[350],
              child: TextFormField(
                keyboardType: type,
                onChanged: (value)=>{
                  execute(value),
                },
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: hint,
                  border: InputBorder.none,
                  //labelText: hint[0].toUpperCase()+hint.substring(1),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            )
                : Container(
              color: Colors.grey[350],
              constraints: BoxConstraints(minWidth: double.infinity),
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                hint,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[500],
                ),
              ),
            ),
          ],
        )
    );
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
///success page
class Success extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.done,
              color: Colors.green[700],
              size: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'Appointment was fixed Successfully',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 150,
            ),
            RaisedButton(
              padding: EdgeInsets.all(20),
              onPressed: () => {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Intro()),
                        (Route<dynamic> route) => false),
              },
              color: Colors.green[600],
              child: Text(
                'Home',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'This is only the test version of App\n'
                    'we are not yet operational!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.warning,
              color: Colors.orange,
              size: 100,
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'Loading',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            SizedBox(
              child: CircularProgressIndicator(
                strokeWidth: 5,
              ),
              width: 60,
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}