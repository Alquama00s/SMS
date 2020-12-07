import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'algorithms.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'Global.dart';
import 'graphics.dart';
import 'intro.dart';
///sets the key
Future<String> setKey(String keypass,String num)async{
  String status;
  if(keypass==null||num==null){
    status='Enter a valid key and number';
  }else if(num.length<10||keypass.length<0){
    status='Enter a valid key and number';
  }else {
    String temp = 'my 32 length key................';
    keypass = keypass + temp;
    keypass = keypass.substring(0, 32);
    final dir = await getApplicationDocumentsDirectory();
    final path = '${dir.path}/key.dll';
    print(path);
    File key = new File(path);
    bool exist = await key.exists();
    List<int> _bytedata;
    String _enenkey;
    try {
      _bytedata = writeKey(keypass, num);
      _enenkey = writeEncryptedkey(_bytedata);
      status = 'Saved Successfully';
    } catch (_) {
      status = 'Failed!';
    }
    if (exist) {
      key.writeAsString(_enenkey);
    } else {
      await key.create(recursive: true);
      key.writeAsString(_enenkey);
    }
  }
  return status;
}
///savekey
Future<String> saveKey()async{
  final dir=await getApplicationDocumentsDirectory();
  final path='${dir.path}/key.dll';
  File key=new File(path);
  bool exist=await key.exists();
  String result;
  if(exist) {
    final data = await key.readAsBytes();
    //print(data);
    final params = SaveFileDialogParams(
        sourceFilePath: key.path,
        data: null,
        localOnly: true,
        fileName: "key.dll");
    await FlutterFileDialog.saveFile(params: params);
    result ='Saved successfully';
  }else{
    result='Key doesnot exist';
  }

  return result;
}
///select key from file
Future<String> selectKey()async{
  String result;
    final params = OpenFileDialogParams(
      dialogType: OpenFileDialogType.document,
      sourceType: null,
      allowEditing: false,
      localOnly: true,
    );
    result=await FlutterFileDialog.pickFile(params: params);
    //print(result+' /here');
  //final dir=await getTemporaryDirectory();
  //final path='${dir.path}/key.dll';
  File key=new File(result);
  bool exist=await key.exists();
  if(exist){
    result=await key.readAsString();
  }else{
    result='not found';
  }
  return result;
}
///fetches the key
Future<String> getKey(String num)async{
  final dir=await getApplicationDocumentsDirectory();
  final path='${dir.path}/key.dll';
  File key=new File(path);
  bool exist=await key.exists();
  List<int> _bytedata;
  String _enenkey,keypass;
  if(exist){
    _enenkey=await key.readAsString();
  }else{
    await key.create(recursive: true);
    _enenkey=await key.readAsString();
  }
  try {
    _bytedata=readEncryptedkey(_enenkey);
    keypass=retrievePass(_bytedata, num);
  }catch(_){
    keypass=null;
  }
  return keypass;
}
///encrypt msg
Future<String> encrypt(String msg,String num,{String type='Default'})async{
  String key;
  print('Cycle ... encrption');
  if(type=='Default'){
    num=num+GUserMap['number'];
    print(num+'encrypt');
    key=dllKey(num);
    print(key+' encrypt');
  }else {
    key = await getKey(num);
  }
  String res;
  if(key!=null){
    List<int> _bytedata=Encrypt(msg,key);
    print(_bytedata);
    res=writeEncrypted(_bytedata);
  }
  print(GUserMap);
  return res;
}
///decrypt msg
Future<String> decrypt(String _enenkey,String enmsg,String num,{String type='Default'})async{
  //String _enenkey=await selectKey();
  print('Cycle ... decryption');
  String keyPass;
  if(type=='Default'){
    num=GUserMap['number']+num;
    print(num+'decrypt');
    keyPass=dllKey(num);
    print(keyPass+' decrypt');
  }else{
    List<int> _keybyte=readEncryptedkey(_enenkey);
    keyPass=retrievePass(_keybyte, num);
  }
  print(enmsg);
  List<int> _msgbyte=readEncrypted(enmsg);
  print(_msgbyte);
  String fmsg=Decrypt(_msgbyte, keyPass);
  print(fmsg);
  return fmsg;
}
///licenses
void License(context){
  showAboutDialog(context: context,
    applicationName: 'Dots and Dashes',
    applicationVersion: 'Version: 1.0.0',
    applicationLegalese:'The project is open source\n'
        'Available at: https://github.com/Alquama00s/SMS\n'
        'Some features of the app are currently on development\n'
        'Please give your valuable feedback to the developer.',
    applicationIcon: MainIcon(size: 50),
    children: [
      RaisedButton(
          child: Text('Confused how to use ?',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: BaseColor,
          onPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Intro()), (route) => false);
          }
          ),
    ],
  );
}
///check for user initiation
Future<bool> checkUser()async{
  Map<String,dynamic> UserMap;
  final dir = await getApplicationDocumentsDirectory();
  final path = '${dir.path}/User.json';
  File User=new File(path);
  if(User.existsSync()){
    UserMap=json.decode(await User.readAsString());
  }else{
    await User.create(recursive: true);
  }
  try {
    if (UserMap['number'].length >= 10){
      GUserMap=UserMap;
      return true;
    }
    else
      return false;
  }catch(_){
    return false;
  }
}
///write user initiation
Future<void> writeUser(Map<String,dynamic> UserMap)async{
  final dir = await getApplicationDocumentsDirectory();
  final path = '${dir.path}/User.json';
  File User=new File(path);
  if(User.existsSync()){
    User.writeAsString(json.encode(UserMap));
  }else{
    await User.create(recursive: true);
  }
  await User.writeAsString(json.encode(UserMap));
}
///read user initiation
Future<String> readUser()async{
  String res='';
  Map<String,dynamic> UserMap;
  final dir = await getApplicationDocumentsDirectory();
  final path = '${dir.path}/User.json';
  File User=new File(path);
  if(User.existsSync()){
    UserMap=json.decode(await User.readAsString());
  }else{
    await User.create(recursive: true);
  }
  GUserMap=UserMap;
  return UserMap['number'];
}