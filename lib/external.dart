import 'package:flutter/material.dart';
void nothing(){
}
class Field extends StatelessWidget {
  final String hint;
  final bool active;
  final TextInputType type;
  final TextEditingController controller;
  final function;
  final int max;
  Field({this.controller,this.type=TextInputType.text,this.hint='',this.function,this.active=true,this.max=1});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            active
                ? Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              color: Color(0xFF009393),
              child: TextFormField(
                controller: controller==null?TextEditingController():controller,
                keyboardType: type,
                maxLines: max,
                cursorColor: Colors.white,
                onChanged: (value)=>{
                  function(value),
                },
                style: TextStyle(fontSize: 20,
                color: Colors.white
                ),
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
              color: Color(0xFF009393),
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
///
