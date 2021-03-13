//görsel düzeni görebilmeniz için debugPaintSizeEnabled öğesi true olarak ayarlanmış olarak görüntülenir
import 'package:flutter/material.dart';


class OrnekPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          
          "INFO",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 6,
          child:
        
        Column(children: <Widget>[
         Image.asset("images/yeeeY.png", width: 230, height: 230),
         Text("Neden Yapdoy?",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 16),),
          Text("Çünkü Yapdoy, geliştirdiğimiz nesne tanıma algoritmaları sayesinde yemek malzemelerini tanımakta ve bu sayede kullanıcıya kolay bir ortam hazırlamaktadır.",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
             Text("\nNasıl Kullanılır?",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 16),),
           Text("Yapmanız gereken ilk adım, elinizdeki bütün yemek malzemelerini bir tezgahın üzerine dizmektir. Daha sonra anasayfadaki kamera butonuna basıp malzemelerin bir fotoğrafını çekmelisiniz. Sonrasında sistem tarafından bulunan malzemeler otomatik olarak işaretli gelecektir. Tabii ki güncelleme yaparak malzeme durumunuzu güncelleyebilirsiniz.Sonra gelelim KARIŞTIR butonuna; malzemelerinizi dilediğiniz gibi güncelledikten sonra bu butona basmalısınız ki karşınıza elinizdeki malzemelerle yapabileceğiniz yemek tarifleri listesi gelsin! Gerisi sizde, yemek tarifini seçin, yapın, doyun. \nŞimdiden Afiyet Olsun! :)",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold))
        ],)
        
        ),)
      ),


    );
  }
}
