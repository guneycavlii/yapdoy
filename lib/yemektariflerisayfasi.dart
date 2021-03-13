import 'package:flutter/material.dart';
import 'package:yapdoyproject/model/yemektarifleri.dart';

import 'oanki_Tarif.dart';

class YemekTarifleriPage extends StatefulWidget {
  final List<Tarif> yemektarifleri;
  YemekTarifleriPage(this.yemektarifleri);

  @override
  _YemekTarifleriPageState createState() =>
      _YemekTarifleriPageState(yemektarifleri);
}

class _YemekTarifleriPageState extends State<YemekTarifleriPage> {
  List<Tarif> yemektarifleri;
  _YemekTarifleriPageState(this.yemektarifleri);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text("Yemek Tarifleri Sayfası"),
        backgroundColor: Colors.red,
      ),
      body: 
   
      yemektarifleri.length != 0 ? ListView.builder(
        itemCount: yemektarifleri.length,
        itemBuilder: (context, index) {
          
            Tarif oanKiTarif = yemektarifleri[index];

            return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (context) => TiklanilanYemekTarifi(
                                    oAnkiYemekTarifi: oanKiTarif.tarif,
                                    oAnkiPisirmeSuresi: oanKiTarif.pisirmesuresi,
                                      oAnkiYemekTarifiAdi: oanKiTarif.name,
                                      oAnkiYemekTarifiResimURL : oanKiTarif.resimURL,
                                      oAnkiYemekTarifininIcerdigiMalzemeler:
                                          oanKiTarif.items)));
                        },
                        
                        subtitle: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: <Widget>[
                               Container(child: Padding(padding: const EdgeInsets.all(2),child: Text(
                          oanKiTarif.name,
                          style: TextStyle(color: Colors.white,fontSize: 16),
                        ),),
                        decoration: BoxDecoration(color: Colors.red.shade700,borderRadius: BorderRadius.circular(10)),),
                              ],
                            ),
                             SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.timer,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                Text(oanKiTarif.pisirmesuresi,style: TextStyle(color: Colors.white),)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  oanKiTarif.items
                                      .toString()
                                      .replaceAll("[", "")
                                      .replaceAll("]", ""),
                                  style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        leading: Container(
                          
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(oanKiTarif.resimURL),
                            backgroundColor: Colors.white,
                            maxRadius: 30,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                             boxShadow: [BoxShadow(color: Colors.black,blurRadius: 10.0,offset: Offset(0.0,10.0))],
                              borderRadius: BorderRadius.circular(30)),
                         
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          size: 32,
                        ),
                      ),
                      height: 68.0,
              
                      margin: const EdgeInsets.only(left: 4.0),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10.0,
                                offset: Offset(0.0, 10.0))
                          ]),
                    )
                  ],
                ),
              ),
            );
          
        },
      ) :  Center(
              child: Card(
                elevation: 4,
                child: Text("Hiç malzemeniz yok ! Markete gitmelisin :)",style: TextStyle(color: Colors.red,fontFamily: "yazim"),),
            )
         
    ));
  }
}
