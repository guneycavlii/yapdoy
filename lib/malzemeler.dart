import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yapdoyproject/common_widget/checkbox.dart';
import 'package:yapdoyproject/yemektariflerisayfasi.dart';

import 'model/yemektarifleri.dart';

class YemekMalzemeleriSayfasi extends StatefulWidget {
  final List<String> lastList;

  YemekMalzemeleriSayfasi(this.lastList);

  @override
  _YemekMalzemeleriSayfasiState createState() =>
      _YemekMalzemeleriSayfasiState(lastList);
}

class _YemekMalzemeleriSayfasiState extends State<YemekMalzemeleriSayfasi> {
  List<String> lastList;
  _YemekMalzemeleriSayfasiState(this.lastList);

  final Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        // Uygulamanın üst kısmı
        backgroundColor: Colors.red,
        title: Text("Malzemeler"),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CustomCheckbox(
                      malzemeadi: "tomato",
                      lastList: lastList,
                      degerimne:
                          lastList.contains("tomato") == true ? true : false,
                      vegetablesicon: Image.asset("images/038-tomato-1.png",
                          width: 32, height: 32),
                      // vegetablestext: "Domates",
                    ),
                    CustomCheckbox(
                      malzemeadi: "potato",
                      lastList: lastList,
                      degerimne:
                          lastList.contains("potato") == true ? true : false,
                      vegetablesicon: Image.asset("images/032-potato.png",
                          width: 32, height: 32),
                      // vegetablestext: "Patates",
                    ),
                    CustomCheckbox(
                      malzemeadi: "onion",
                      lastList: lastList,
                      degerimne:
                          lastList.contains("onion") == true ? true : false,
                      vegetablesicon: Image.asset("images/025-onion.png",
                          width: 32, height: 32),
                      // vegetablestext: "Soğan",
                    ),
                    CustomCheckbox(
                      malzemeadi: "garlic",
                      lastList: lastList,
                      degerimne:
                          lastList.contains("garlic") == true ? true : false,
                      vegetablesicon: Image.asset("images/016-garlic.png",
                          width: 32, height: 32),
                      // vegetablestext: "Sarımsak",
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.all(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CustomCheckbox(
                      malzemeadi: "carrot",
                      lastList: lastList,
                      degerimne:
                          lastList.contains("carrot") == true ? true : false,
                      vegetablesicon: Image.asset("images/007-carrot.png",
                          width: 32, height: 32),

                      // vegetablestext: "Havuç",
                    ),
                    CustomCheckbox(
                      malzemeadi: "pumpkin",
                      lastList: lastList,
                      degerimne:
                          lastList.contains("pumpkin") == true ? true : false,

                      vegetablesicon: Image.asset("images/040-zucchini.png",
                          width: 32, height: 32),
                      // vegetablestext: "Kabak",
                    ),
                    CustomCheckbox(
                      malzemeadi: "pepper",
                      lastList: lastList,
                      degerimne:
                          lastList.contains("pepper") == true ? true : false,
                      vegetablesicon: Image.asset("images/peppergreen.png",
                          width: 32, height: 32),
                      // vegetablestext: "Yeşil Biber",
                    ),
                    CustomCheckbox(
                      malzemeadi: "pepper red",
                      lastList: lastList,
                      degerimne: lastList.contains("pepper red") == true
                          ? true
                          : false,
                      vegetablesicon: Image.asset("images/010-chili.png",
                          width: 32, height: 32),
                      // vegetablestext: "Kırmızı Biber",
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.all(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CustomCheckbox(
                      malzemeadi: "pepper green2",
                      lastList: lastList,
                      degerimne: lastList.contains("pepper green2") == true
                          ? true
                          : false,
                      vegetablesicon: Image.asset("images/peppertombik.png",
                          width: 32, height: 32),
                      // vegetablestext: "Dolmalık Biber",
                    ),
                    CustomCheckbox(
                      malzemeadi: "spinach",
                      lastList: lastList,
                      degerimne:
                          lastList.contains("spinach") == true ? true : false,
                      vegetablesicon: Image.asset("images/035-spinach.png",
                          width: 32, height: 32),
                      // vegetablestext: "Ispanak",
                    ),
                    CustomCheckbox(
                      malzemeadi: "patlican",
                      lastList: lastList,
                      degerimne:
                          lastList.contains("patlican") == true ? true : false,
                      vegetablesicon: Image.asset("images/014-eggplant.png",
                          width: 32, height: 32),
                      // vegetablestext: "Patlıcan",
                    ),
                    CustomCheckbox(
                      malzemeadi: "beangreen",
                      lastList: lastList,
                      degerimne:
                          lastList.contains("beangreen") == true ? true : false,
                      vegetablesicon: Image.asset("images/019-bean.png",
                          width: 32, height: 32),
                      // vegetablestext: "Yeşil Fasulye",
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.all(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CustomCheckbox(
                      malzemeadi: "egg",
                      lastList: lastList,
                      degerimne:
                          lastList.contains("egg") == true ? true : false,
                      vegetablesicon:
                          Image.asset("images/egg.png", width: 32, height: 32),
                      // vegetablestext: "Yumurta",
                    ),
                    CustomCheckbox(
                      malzemeadi: "meatmince",
                      lastList: lastList,
                      degerimne:
                          lastList.contains("meatmince") == true ? true : false,
                      vegetablesicon:
                          Image.asset("images/meat.png", width: 32, height: 32),
                      // vegetablestext: "Dana Kıyma",
                    ),
                    CustomCheckbox(
                      malzemeadi: "chickenbreast",
                      lastList: lastList,
                      degerimne: lastList.contains("chickenbreast") == true
                          ? true
                          : false,
                      vegetablesicon: Image.asset("images/chicken-breast.png",
                          width: 32, height: 32),
                      // vegetablestext: "Tavuk Göğsü",
                    ),
                    CustomCheckbox(
                      malzemeadi: "mushroom",
                      lastList: lastList,
                      degerimne:
                          lastList.contains("mushroom") == true ? true : false,
                      vegetablesicon: Image.asset("images/023-mushroom.png",
                          width: 32, height: 32),
                      // vegetablestext: "Mushroom",
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.all(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CustomCheckbox(
                      malzemeadi: "haricot bean",
                      lastList: lastList,
                      degerimne: lastList.contains("haricot bean") == true
                          ? true
                          : false,
                      vegetablesicon:
                          Image.asset("images/bean.png", width: 32, height: 32),
                      // vegetablestext: "Fasulye",
                    ),
                    CustomCheckbox(
                      malzemeadi: "chickpea",
                      lastList: lastList,
                      degerimne:
                          lastList.contains("chickpea") == true ? true : false,
                      vegetablesicon: Image.asset("images/chickpea.jpg",
                          width: 32, height: 32),
                      // vegetablestext: "Nohut",
                    ),
                    CustomCheckbox(
                      malzemeadi: "bulgur",
                      lastList: lastList,
                      degerimne:
                          lastList.contains("bulgur") == true ? true : false,
                      vegetablesicon: Image.asset("images/bulgur.jpg",
                          width: 32, height: 32),
                      // vegetablestext: "Bulgur",
                    ),
                    CustomCheckbox(
                      malzemeadi: "rice",
                      lastList: lastList,
                      degerimne:
                          lastList.contains("rice") == true ? true : false,
                      vegetablesicon:
                          Image.asset("images/rice.png", width: 32, height: 32),
                      // vegetablestext: "Pirinç",
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.all(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CustomCheckbox(
                      malzemeadi: "lentil green",
                      lastList: lastList,
                      degerimne: lastList.contains("lentil green") == true
                          ? true
                          : false,
                      vegetablesicon: Image.asset("images/yesilmercimek.png",
                          width: 32, height: 32),
                      // vegetablestext: "Yeşil Mercimek",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // SocialLogInButton(buttonText: "KARIŞTIR",buttonColor: Colors.red,onPressed: (){},),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        height: 70,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36)),
                          color: Colors.red,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset("images/mix.png"),
                            ],
                          ),
                          onPressed: () {
                            getAllYemekTarifleri(lastList);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomCheckbox(
                      malzemeadi: "lentil red",
                      lastList: lastList,
                      degerimne: lastList.contains("lentil red") == true
                          ? true
                          : false,
                      vegetablesicon: Image.asset("images/mercimekkirmizi.jpg",
                          width: 32, height: 32),
                      // vegetablestext: "Kırmızı Mercimek",
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
 
  }

  Future<List<Tarif>> getAllYemekTarifleri(List<String> lastList) async {
    QuerySnapshot querySnapshot =
        await _firestore.collection("yemektarifleri").getDocuments();

    List<Tarif> yemektarifleri = [];

    for (DocumentSnapshot tekTarif in querySnapshot.documents) {
      Tarif _tekTarif = Tarif.fromMap(tekTarif.data);
      // List<String> tekIcerdigiMalzeme;
   for(int i=0 ; i< _tekTarif.items.length ; i++){

      if (lastList.contains(_tekTarif.items[i])) {

        if(i==_tekTarif.items.length-1){
          print(_tekTarif.name);
      yemektarifleri.add(_tekTarif);

      }
      
      }else{
        i = _tekTarif.items.length;
      }
      
      }
     
      

// if(_firestore.collection("yemektarifleri").where("items",whereIn: lastList)
      // if(lastList.contains(_tekTarif.items.contains(element)) && lastList.contains(_tekTarif.items[1]))
      // if(lastList.contains('pepper green2'))

    }

    print(yemektarifleri.toList());

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => YemekTarifleriPage(yemektarifleri),
      ),
    );
    
    return yemektarifleri;
  }
}
