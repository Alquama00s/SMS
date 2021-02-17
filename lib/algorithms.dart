import 'dart:io';
import 'dart:math';
import 'package:encrypt/encrypt.dart';
import 'dart:typed_data';

/*void main() {
  String num = '9163520855';
  String key = 'somekey';
  // String num = stdin.readLineSync();
  // String key = stdin.readLineSync();
  List<int> _enkey = writeKey(key, num);
  print('$_enkey orignal');
  String _enenkey = writeEncryptedkey(_enkey);
  _enkey = readEncryptedkey(_enenkey);
  print('$_enkey after');
  String key1 = retrievePass(_enkey, num);
  print('$key1 here');
}
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
  final key = Key.fromUtf8('my 32 length key................');
  final iv = IV.fromLength(8);
  final encrypter = Encrypter(Salsa20(key));
  final dllKey = encrypter.encrypt(num, iv: iv);
  String _finalKey = dllKey.base64.toString();
  _finalKey = _finalKey + _finalKey;
  _finalKey=_finalKey.substring(0,32);
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
  String temp = '', code = '';
  for (int i in _data) {
    temp = i.toRadixString(3);
    temp = temp.replaceAll('1', '.');
    temp = temp.replaceAll('2', '_');
    temp = temp.replaceAll('0', ' ');
    code += temp;
    code = code + '-';
  }
  //print(code);
  return code;
}

///given the text format gives back the bytecode
List<int> readEncrypted(String _data) {
  String temp = '', code = '';
  _data = _data.replaceAll('.', '1');
  _data = _data.replaceAll('_', '2');
  _data = _data.replaceAll(' ', '0');
  _data = _data.replaceAll('-', ' ');
  List<String> res = _data.split(new RegExp('\\s+'));
  res.removeLast();
  List<int> _bytedata = [];
  for (String i in res) {
    _bytedata.add(int.parse(i, radix: 3));
  }
  //print(_bytedata);
  return _bytedata;
}

///these function are only for keys
///given a bytedata encrypt it for righting in text format securly
String writeEncryptedkey(List<int> _data) {
  String temp = '', code = '';
  for (int i in _data) {
    temp = i.toRadixString(3);
    temp = temp.replaceAll('1', 'L');
    temp = temp.replaceAll('2', 'Z');
    temp = temp.replaceAll('0', 'O');
    code += temp;
    code = code + 'X';
  }
  //print(code);
  String mixedcode = '';
  int n;
  var rand = Random();
  for (int i = 0; i < code.length; i++) {
    //print(code.substring(i, i + 1));
    n = rand.nextInt(code.length);
    mixedcode += getRandomString(n);
    mixedcode += code.substring(i, i + 1);
  }
  //print(mixedcode);
  return mixedcode;
}

///given the text format gives back the bytecode
List<int> readEncryptedkey(String _data) {
  String temp = '', code = '', clean = '';
  for (int i = 0; i < _data.length; i++) {
    if (_data.substring(i, i + 1) == 'L' ||
        _data.substring(i, i + 1) == 'Z' ||
        _data.substring(i, i + 1) == 'O' ||
        _data.substring(i, i + 1) == 'X') clean += _data.substring(i, i + 1);
  }
  clean = clean.replaceAll('L', '1');
  clean = clean.replaceAll('Z', '2');
  clean = clean.replaceAll('O', '0');
  clean = clean.replaceAll('X', ' ');
  List<String> res = clean.split(new RegExp('\\s+'));
  res.removeLast();
  List<int> _bytedata = [];
  for (String i in res) {
    _bytedata.add(int.parse(i, radix: 3));
  }
  //print(_bytedata);
  return _bytedata;
}

///random string generator
const _chars = 'AaBbCcDdEeFfGgHhIiJjKklMmNnoPpQqRrSsTtUuVvWwxYyz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
