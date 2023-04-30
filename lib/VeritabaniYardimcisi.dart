import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';

class VeritabaniYardimcisi {
  static final String veritabaniAdi = "dogru_cevap.db";

  static Future<Database> veritabaniErisim() async {
    String veritabaniYolu = join(await getDatabasesPath(), veritabaniAdi);

    if (await databaseExists(veritabaniYolu)) {
      print("Veri tabanı bulundu. Kopyalamaya gerek yok.");
    } else {
      ByteData data = await rootBundle.load("db/$veritabaniAdi");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(veritabaniYolu).writeAsBytes(bytes, flush: true);
      print("Veri tabanı kopyalandı.");
    }
    return openDatabase(veritabaniYolu);
  }
}
