import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'algorithms.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
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
Future<String> encrypt(String msg,String num)async{
  String key=await getKey(num);
  print(key);
  String res;
  if(key!=null){
    List<int> _bytedata=Encrypt(msg,key);
    res=writeEncrypted(_bytedata);
  }
  return res;
}
///decrypt msg
Future<String> decrypt(String _enenkey,String enmsg,String num)async{
  //String _enenkey=await selectKey();
  List<int> _keybyte=readEncryptedkey(_enenkey);
  String keyPass=retrievePass(_keybyte, num);
  List<int> _msgbyte=readEncrypted(enmsg);
  String fmsg=Decrypt(_msgbyte, keyPass);
  return fmsg;
}
///licenses
void License(context){
  showAboutDialog(context: context,
    applicationName: 'Dots and Dashes',
    applicationVersion: 'Version: 0.0.1',
    applicationLegalese:'The project is open source\n'
        'Available at: https://github.com/Alquama00s/SMS\n'
        'This version of app is only for testing and will therefore be eventually deprecated.\n'
        'Please give your valuable feedback to the developer.',

  );
}