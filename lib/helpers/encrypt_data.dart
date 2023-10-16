import 'package:encrypt/encrypt.dart';

class EncryptData {
  //for AES Algorithms

  static Encrypted? encrypted;
  // ignore: prefer_typing_uninitialized_variables
  static var decrypted;

  static encryptAES(plainText) {
    final key = Key.fromUtf8('my 32 length key................');
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    encrypted = encrypter.encrypt(plainText, iv: iv);
  }

  static decryptAES(plainText) {
    final key = Key.fromUtf8('my 32 length key................');
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    decrypted = encrypter.decrypt(Encrypted.fromBase64(plainText), iv: iv);
  }
}
