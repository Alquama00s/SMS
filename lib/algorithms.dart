import 'dart:io';
import 'dart:math';
import 'package:encrypt/encrypt.dart';
import 'dart:typed_data';
/*
* For security of encryption some code has been
* ommited mentioned below
* the app must build without them but may not work properly
*/
/*todo:
    writeEncrypted
    readEncrypted
    writeEncryptedkey
    readEncryptedkey
 */
///decrypts msg
String Decrypt(List<int> _bytedata,String _key){
  final iv = IV.fromLength(16);
  final key = Key.fromUtf8(_key);
  final encrypter = Encrypter(AES(key));
  Encrypted a = Encrypted(Uint8List.fromList(_bytedata));
  try {
    final decrypted = encrypter.decrypt(a, iv: iv);
    return decrypted;
  } catch (_) {
    print(_);
    return 'some error';
  }
}
///encrypts msg
List<int> Encrypt(String msg,String key){
  final pass = Key.fromUtf8(key);
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(pass));
  final encrypted = encrypter.encrypt(msg, iv: iv);
  List<int> _bytedata = encrypted.bytes;
  return _bytedata;
}
///gives a unique 16 digit key for a phone no
String dllKey(String num) {
  String _finalKey='some key........';
  return _finalKey;
}

///gives bytedata from key and num --implements dllKey above
writeKey(String key, String num) {
  final pass = Key.fromUtf8(dllKey(num));
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(pass));
  final encrypted = encrypter.encrypt(key, iv: iv);
  List<int> _bytedata = encrypted.bytes;
  //print(encrypted.bytes);
  return _bytedata;
}

///given a byte data and correct number gives the key back
String retrievePass(List<int> _bytekey, String num) {
  final iv = IV.fromLength(16);
  final key = Key.fromUtf8(dllKey(num));
  final encrypter = Encrypter(AES(key));
  Encrypted a = Encrypted(Uint8List.fromList(_bytekey));
  try {
    final decrypted = encrypter.decrypt(a, iv: iv);
    return decrypted;
  } catch (_) {
    return 'some error';
  }
}

///given a bytedata encrypt it for righting in text format securly
String writeEncrypted(List<int> _data) {
  String code = 'some conversion to string';
  return code;
}

///given the text format gives back the bytecode
List<int> readEncrypted(String _data) {
  String temp = '', code = '';

  List<int> _bytedata = [];
  ///convert back to byte data
  //print(_bytedata);
  return _bytedata;
}

///these function are only for keys
///given a bytedata encrypt it for righting in text format securly
String writeEncryptedkey(List<int> _data) {
  String mixedcode = 'Some string conversion';

  return mixedcode;
}

///given the text format gives back the bytecode
List<int> readEncryptedkey(String _data) {
  String temp = '', code = '', clean = '';

  List<int> _bytedata = [];
  ///reconvert back to byte data
  //print(_bytedata);
  return _bytedata;
}
