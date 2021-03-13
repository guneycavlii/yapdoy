import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:yapdoyproject/malzemeler.dart';

import 'package:yapdoyproject/sign_in/ornek.dart';
import 'package:yapdoyproject/viewmodel/usermodel.dart';
import 'package:provider/provider.dart';

class KullanicilarPage extends StatefulWidget {
  @override
  _KullanicilarPageState createState() => _KullanicilarPageState();
}

class _KullanicilarPageState extends State<KullanicilarPage> {
  File _image;
  String _model = "SSD MobileNet";
  bool _busy = false;
  List _recognitions;
  List<String> sonListe = [];
  List<String> cekmedenListe = [];
  

  bool resimsecilmismi = false;

  @override
  void initState() {
    super.initState();
    _busy = true;

    loadModel().then((val) {
      setState(() {
        _busy = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    UserModel _userModel = Provider.of<UserModel>(context, listen: false);
    _userModel.getAllUser();

    if (resimsecilmismi == false) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Anasayfa"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                onPressed: () {
                  Navigator.of(
                          context) //contextin yanına rootNavigator: true dersem tab bar gözükmez.
                      .push(MaterialPageRoute(
                          // fullscreenDialog: true,
                          builder: (context) =>
                              OrnekPage())); // builderin yanına fullscreenDialog: true (bilgisayyfası gibi)
                },
              )
            ],
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Image.asset("images/yeeeY.png", width: 400, height: 400),
                Text(
                  "Elinizde hangi malzemeler var?",
                  style: TextStyle(fontFamily: "yazim"),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Malzemelerinizi tezgaha koyun ve",
                  style: TextStyle(fontFamily: "yazim"),
                ),
                Text(
                  "fotoğrafını çekin.",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  child: Icon(
                    Icons.camera,
                    size: 50,
                    color: Colors.red,
                  ),
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.red,
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 160,
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(
                                    Icons.camera,
                                    color: Colors.black,
                                  ),
                                  title: Text("Kameradan çek",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  onTap: () {
                                    _kameradanFotoCek();
                                  },
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.image,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    "Galeriden seç",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    _galeridenResimSec();
                                  },
                                )
                              ],
                            ),
                          );
                        });
                  },
                ),
                FlatButton(
                    child: Text("Fotoğraf çekmeden devam et.",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      YemekMalzemeleriSayfasi(cekmedenListe)))
                        }),
              ],
            ),
          ));
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  void _kameradanFotoCek() async {
    // var profilfoto =
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image == null) return;
    setState(() {
      _busy = true;
      resimsecilmismi = true;
    });
    tahminImage(image);
    Navigator.of(context).pop();

    // if(_girdiresmi != null){
    //   return MeyveSebzeSayfasi();
    // }
    // setState(() {
    //   _profilFoto = profilfoto;
    //   Navigator.of(context).pop();
    // });
  }

  _galeridenResimSec() async {
    // var profilfoto =
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      _busy = true;
      resimsecilmismi = true;
    });
    tahminImage(image);

    // setState(() {
    //   _profilFoto = profilfoto;
    Navigator.of(context).pop();

    // });
  }

  loadModel() async {
    Tflite.close();

    String res;
    if (_model == "SSD MobileNet") {
      res = await Tflite.loadModel(
        model: "assets/tflite/adetect.tflite",
        labels: "assets/tflite/adetect.txt",
      );
    }
    print(res);
  }

  void tahminImage(File image) async {
    if (image == null) return;
    await ssdMobileNet(image);

    setState(() {
      _image = image;
      _busy = false;
    });
  }

  ssdMobileNet(File image) async {
    var recognitions = await Tflite.detectObjectOnImage(
        path: image.path, numResultsPerClass: 1);

    setState(() {
      _recognitions = recognitions;
    });

    List<String> _sonListe = [];
    int i = 0;
    // Bulunan malzemeler burada yeni güncel
    for (var u in _recognitions) {
      String malzemeismi = u["detectedClass"];
      print(malzemeismi);
      _sonListe.add(malzemeismi);
      i++;
    }

//  bool _checkBelirle;

    // if (_sonListe.contains("pumpkin") == true) {
    //   print("EVET DOMATESE SAHİPSİN.");
    // }

    // print("MALZEME SAYINIZ:" + i.toString());
    // print(_sonListe.toList());

    if (_recognitions != null) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => YemekMalzemeleriSayfasi(_sonListe),
        ),
      );
      setState(() {
        resimsecilmismi = false;
      });
    }
  }
}
