import 'package:dogru_cevap/Sorular.dart';
import 'package:dogru_cevap/VeritabaniYardimcisi.dart';

class Sorulardao {
  Future<List<Sorular>> rasgele15Getir() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db
        .rawQuery("SELECT * FROM dogru_cevap ORDER BY RANDOM() LIMIT 15");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Sorular(
          satir["soru_id"],
          satir["soru"],
          satir["secenek_1"],
          satir["secenek_2"],
          satir["secenek_3"],
          satir["secenek_4"],
          satir["dogru_secenek"]);
    });
  }

  /*Future<List<Sorular>> rasgele3YanlisGetir(int soru_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM dogru_cevap WHERE soru_id != $soru_id ORDER BY RANDOM() LIMIT 3");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Sorular(
          satir["soru_id"],
          satir["soru"],
          satir["sorunun_dogru_cevabi"],
          satir["sorunun_yanlis_cevabi_1"],
          satir["sorunun_yanlis_cevabi_2"],
          satir["sorunun_yanlis_cevabi_3"]);
    });
  }*/
}
