import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Global.dart';
import 'widgetLib.dart';
///individual contact
class Contact_ extends StatelessWidget {
  final Contact view;
  final save;
  Contact_(this.view,this.save);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        save('',view.displayName),
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Numbers(view.phones,save)),
        ),
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 5,
            color: BaseColor,
          ),
          color: SecColor,
        ),
        child: Text(view.displayName,
        style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
    );
  }
}
///individual number
class Number_ extends StatelessWidget {
  final save;
  final Item view;
  Number_(this.view,this.save);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        save(view.value,''),
        Navigator.pop(context),
        Navigator.pop(context),
        /*Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>Encrypt()),
        ),*/
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 5,
            color: BaseColor,
          ),
          color: SecColor,
        ),
        child: Text(view.value,
        style: TextStyle(
          color: Colors.white
        ),
        ),
      ),
    );
  }
}

///a list of numbers
class Numbers extends StatelessWidget {
  final save;
  final Iterable<Item> list;
  Numbers(this.list,this.save);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColor,
      body: ListView.builder(
      itemCount:list.length,
      itemBuilder: (context, i) {
        return Number_(list.elementAt(i),save);
      },
    ),
    );
  }
}
///lodes the whole thing
class ContactLoader extends StatefulWidget{
  final save;
  ContactLoader(this.save);
  @override
  _ContactLoaderState createState()=> _ContactLoaderState();
}
class _ContactLoaderState extends State<ContactLoader> {
  Iterable<Contact> list;
  String search='';
  var toload=ContactsService.getContacts(withThumbnails: false);
  void setLoad(){
    if(search==''){
      setState(() {
        toload=ContactsService.getContacts(withThumbnails: false);
      });
    }else{
      setState(() {
        toload=ContactsService.getContacts(withThumbnails:false,query : search);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColor,
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
        width: MediaQuery.of(context).size.width,
        child:SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                color: BaseColor,
                child: TextFormField(
                  //controller: controller==null?TextEditingController():controller,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  cursorColor: Colors.white,
                  onChanged:(value)=>{search=value,setLoad(),},
                  style: TextStyle(fontSize: 20,
                      color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search',
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
              ),
              SizedBox(height: 10,),
              Container(
                height: MediaQuery.of(context).size.height-110,
                child: FutureBuilder(
                  future: toload,
                  builder: (context, snap) {
                    if (snap.hasError) {
                      return Error('Something Went wrong');
                    }
                    if (snap.connectionState == ConnectionState.done) {
                      list=snap.data;
                      return ListView.builder(
                        itemCount:list.length,
                        itemBuilder: (context, i) {
                          return Contact_(list.elementAt(i),widget.save);
                        },
                      );
                    }
                    return Loading();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
