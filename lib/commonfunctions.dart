import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';
import 'algorithms.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
///sets the key
Future<String> setKey(String keypass,String num)async{
  String temp='my 32 length key................';
  keypass=keypass+temp;
  keypass=keypass.substring(0,32);
  final dir=await getApplicationDocumentsDirectory();
  final path='${dir.path}/key.dll';
  File key=new File(path);
  bool exist=await key.exists();
  List<int> _bytedata;
  String _enenkey,status;
  try {
    _bytedata = writeKey(keypass, num);
    _enenkey = writeEncryptedkey(_bytedata);
    status='Saved Successfully';
  }catch(_){
    status='Failed!';
  }
  if(exist){
    key.writeAsString(_enenkey);
  }else{
    await key.create(recursive: true);
    key.writeAsString(_enenkey);
  }
  print(key.path);
  //print(key.uri);
  final data =await key.readAsBytes();
  print(data);
  final params = SaveFileDialogParams(
      sourceFilePath:key.path,
      data: null,
      localOnly: true,
      fileName:"untitled");
  var result = await FlutterFileDialog.saveFile(params: params);
  print(result);
  return status;
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
  String res;
  if(key!=null){
    List<int> _bytedata=Encrypt(msg,key);
    res=writeEncrypted(_bytedata);
  }
  return res;
}