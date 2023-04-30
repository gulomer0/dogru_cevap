// Yeni sorulara buradan > https://www.guncelakademi.com/g-20-ozel-sorular-t20374 < ekleme yapabilirsiniz.

import 'package:dogru_cevap/SoruSayfasi.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        title: Text("Doğru Cevap"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        //flutitle: Text("Doğru Cevap"),
                        content:
                            Text("15 genel kültür sorusu içerir. Başarılar :)"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Tamam",
                                style: TextStyle(color: Colors.deepPurple)),
                          ),
                        ],
                      ));
            },
            icon: Icon(Icons.info_outline),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Lottie.asset(
                'lottie/books.json',
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.045,
                width: MediaQuery.of(context).size.width * 0.28,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SoruSayfasi(),
                      ),
                    );
                  },
                  child: const Text('Başla',
                      style: TextStyle(
                        color: Colors.deepPurple,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
