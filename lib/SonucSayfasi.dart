import 'package:dogru_cevap/SoruSayfasi.dart';
import 'package:dogru_cevap/main.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

class SonucSayfasi extends StatefulWidget {
  var dogruSayisi;
  var yanlisSayisi;

  SonucSayfasi({this.dogruSayisi, this.yanlisSayisi});

  @override
  State<SonucSayfasi> createState() => _SonucSayfasiState();
}

class _SonucSayfasiState extends State<SonucSayfasi> {
  final player = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player.play(AssetSource("kazanma_ses_efekti.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          leading: Text(""),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.deepPurple,
          /*title: Image.asset(
            "image/book.png",
            width: MediaQuery.of(context).size.width * 0.15,
          ),*/
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Lottie.asset(
                'lottie/win.json',
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              Text(
                "Tebrikler!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                "Doğru Cevap: ${widget.dogruSayisi}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.045,
                    width: MediaQuery.of(context).size.width * 0.30,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        elevation: MaterialStateProperty.all(0),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                      child: const Text('Tekrar Dene',
                          style: TextStyle(
                            color: Colors.greenAccent,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.045,
                    width: MediaQuery.of(context).size.width * 0.30,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        elevation: MaterialStateProperty.all(0),
                      ),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: const Text('Çıkış',
                          style: TextStyle(
                            color: Colors.redAccent,
                          )),
                    ),
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
