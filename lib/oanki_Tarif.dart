import 'package:flutter/material.dart';

class TiklanilanYemekTarifi extends StatefulWidget {
  final String oAnkiYemekTarifiAdi;
  final List oAnkiYemekTarifininIcerdigiMalzemeler;
  final String oAnkiYemekTarifi;
  final String oAnkiPisirmeSuresi;
  final String oAnkiYemekTarifiResimURL;

  TiklanilanYemekTarifi(
      {this.oAnkiYemekTarifiAdi,
      this.oAnkiYemekTarifininIcerdigiMalzemeler,
      this.oAnkiPisirmeSuresi,
      this.oAnkiYemekTarifi,
      this.oAnkiYemekTarifiResimURL});

  @override
  _TiklanilanYemekTarifiState createState() => _TiklanilanYemekTarifiState();
}

class _TiklanilanYemekTarifiState extends State<TiklanilanYemekTarifi> {
  @override
  Widget build(BuildContext context) {
    String oAnkiYemekTarifiAdi = widget.oAnkiYemekTarifiAdi;
    List oAnkiYemekTarifininIcerdigiMalzemeler =
        widget.oAnkiYemekTarifininIcerdigiMalzemeler;
    String oAnkiYemekTarifi = widget.oAnkiYemekTarifi;
    String oAnkiPisirmeSuresi = widget.oAnkiPisirmeSuresi;
    String oAnkiYemekTarifiResimURL = widget.oAnkiYemekTarifiResimURL;

    return Scaffold(
     
        appBar: AppBar(
          actions: <Widget>[
            Image.asset("images/yeeeY.png", width: 48, height: 48),
          ],
          title: Text(oAnkiYemekTarifiAdi),
          centerTitle: true,
        ),
        body: ListView(children: <Widget>[
Center(
            child: Container(
                child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[400],
                                  blurRadius: 10.0,
                                  offset: Offset(0.0, 10.0))
                            ], borderRadius: BorderRadius.circular(90)),
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(oAnkiYemekTarifiResimURL),
                              backgroundColor: Colors.white,
                              maxRadius: 100,
                            )),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Tarif",
                          style: TextStyle(
                            fontFamily: "yazim",
                            fontSize: 30,
                            color: Colors.red,
                          ),
                        ),
                         SizedBox(
                          height: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.red),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(oAnkiYemekTarifi
                                .replaceAll(".", ".\n")
                                .replaceAll("\\n", "").replaceAll(".", ".\n"),style: TextStyle(fontWeight:FontWeight.bold )),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.red),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Text("Malzemeler: " +
                                oAnkiYemekTarifininIcerdigiMalzemeler
                                    .toString()
                                    .replaceAll("[", "")
                                    .replaceAll("]", ""),style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold )),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.red),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child:
                                Text("Pişirme Süresi: " + oAnkiPisirmeSuresi,style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),),
                          ),
                        ),
                      ],
                    ))))
        ],) );
  }
}
