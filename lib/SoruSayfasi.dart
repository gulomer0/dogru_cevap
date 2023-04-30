//import 'dart:collection';
//import 'dart:html';

import 'package:dogru_cevap/SonucSayfasi.dart';
import 'package:dogru_cevap/Sorular.dart';
import 'package:dogru_cevap/Sorulardao.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SoruSayfasi extends StatefulWidget {
  const SoruSayfasi({super.key});

  @override
  State<SoruSayfasi> createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  final player = AudioPlayer();

  bool isClickedA = false;
  bool isClickedB = false;
  bool isClickedC = false;
  bool isClickedD = false;

  bool isTrue = false;

  var sorular = <Sorular>[];
  late Sorular siradakiSoru;

  int soruSayac = 0;
  int dogruSayac = 0;
  int yanlisSayac = 0;

  String soru = "";
  String buttonAyazi = "";
  String buttonByazi = "";
  String buttonCyazi = "";
  String buttonDyazi = "";

  @override
  void initState() {
    super.initState();
    sorulariAl();
  }

  Future<void> sorulariAl() async {
    sorular = await Sorulardao().rasgele15Getir();
    soruYukle();
  }

  Future<void> soruYukle() async {
    siradakiSoru = sorular[soruSayac];
    soru = siradakiSoru.soru;
    buttonAyazi = siradakiSoru.secenek_1;
    buttonByazi = siradakiSoru.secenek_2;
    buttonCyazi = siradakiSoru.secenek_3;
    buttonDyazi = siradakiSoru.secenek_4;

    setState(() {});
  }

  void soruSayacKontrol() {
    if (soruSayac != 14) {
      soruSayac++;
      soruYukle();
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SonucSayfasi(
            dogruSayisi: dogruSayac,
            yanlisSayisi: yanlisSayac,
          ),
        ),
      );
    }
  }

  void dogruKontrol(String cevap) {
    if (cevap == siradakiSoru.dogru_secenek) {
      dogruSayac++;
    } else {
      yanlisSayac++;
    }
  }

  void buttonRenkKontrolA(String cevap) {
    if (cevap == siradakiSoru.dogru_secenek) {
      isClickedA = true;
      isTrue = true;
    } else {
      isClickedA = true;
      isTrue = false;
    }
  }

  void buttonRenkKontrolB(String cevap) {
    if (cevap == siradakiSoru.dogru_secenek) {
      isClickedB = true;
      isTrue = true;
    } else {
      isClickedB = true;
      isTrue = false;
    }
  }

  void buttonRenkKontrolC(String cevap) {
    if (cevap == siradakiSoru.dogru_secenek) {
      isClickedC = true;
      isTrue = true;
    } else {
      isClickedC = true;
      isTrue = false;
    }
  }

  void buttonRenkKontrolD(String cevap) {
    if (cevap == siradakiSoru.dogru_secenek) {
      isClickedD = true;
      isTrue = true;
    } else {
      isClickedD = true;
      isTrue = false;
    }
  }

  void buttonSesKontrol(String cevap) {
    if (cevap == siradakiSoru.dogru_secenek) {
      player.play(AssetSource("dogru_cevap_ses_efekti.mp3")); //dogruSes();
    } else {
      player.play(AssetSource("yanlis_cevap_ses_efekti.mp3")); //yanlisSes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        leading: Text(
          "",
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        /*title: Image.asset(
            "image/book.png",
            width: MediaQuery.of(context).size.width * 0.15,
          )*/
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${dogruSayac}",
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Text(
                    "${soruSayac + 1}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "/${sorular.length}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Text(
                    "${yanlisSayac}",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "${soru}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            buttonSesKontrol(buttonAyazi);
                          });
                          setState(() {
                            buttonRenkKontrolA(buttonAyazi);
                          });
                          Future.delayed(Duration(seconds: 1), () {
                            setState(() {
                              dogruKontrol(buttonAyazi);
                              soruSayacKontrol();
                            });
                            setState(() {
                              isClickedA = false;
                            });
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            color: isClickedA
                                ? isTrue
                                    ? Colors.greenAccent
                                    : Colors.redAccent
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "$buttonAyazi",
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            buttonSesKontrol(buttonByazi);
                          });
                          setState(() {
                            buttonRenkKontrolB(buttonByazi);
                          });
                          Future.delayed(Duration(seconds: 1), () {
                            setState(() {
                              dogruKontrol(buttonByazi);
                              soruSayacKontrol();
                            });
                            setState(() {
                              isClickedB = false;
                            });
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            color: isClickedB
                                ? isTrue
                                    ? Colors.greenAccent
                                    : Colors.redAccent
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "$buttonByazi",
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            buttonSesKontrol(buttonCyazi);
                          });
                          setState(() {
                            buttonRenkKontrolC(buttonCyazi);
                          });
                          Future.delayed(Duration(seconds: 1), () {
                            setState(() {
                              dogruKontrol(buttonCyazi);
                              soruSayacKontrol();
                            });
                            setState(() {
                              isClickedC = false;
                            });
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            color: isClickedC
                                ? isTrue
                                    ? Colors.greenAccent
                                    : Colors.redAccent
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "$buttonCyazi",
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            buttonSesKontrol(buttonDyazi);
                          });
                          setState(() {
                            buttonRenkKontrolD(buttonDyazi);
                          });
                          Future.delayed(Duration(seconds: 1), () {
                            setState(() {
                              dogruKontrol(buttonDyazi);
                              soruSayacKontrol();
                            });
                            setState(() {
                              isClickedD = false;
                            });
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            color: isClickedD
                                ? isTrue
                                    ? Colors.greenAccent
                                    : Colors.redAccent
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "$buttonDyazi",
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
