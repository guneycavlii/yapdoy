import 'package:flutter/material.dart';
import 'package:yapdoyproject/common_widget/social_sign_in_button.dart';
import 'package:yapdoyproject/sign_in/emailsifregirisvekayit.dart';
import 'package:yapdoyproject/viewmodel/usermodel.dart';
import 'package:provider/provider.dart';
import 'model/user.dart';

class SignInPage extends StatelessWidget {
  void _emailVeSifreIleGiris(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => EmailSifreGirisSayfasi(),
      ),
    );
  }

  void _googleIleGiris(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    User _user = await _userModel.signInWithGoogle();
    if (_user != null) {
      print("Oturum açan user Id:" + _user.userID.toString());
    } else {
      print("Google ile giriş yapılamadı.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Uygulamanın üst kısmı
        backgroundColor: Colors.red,
        title: Text("GİRİŞ / KAYIT"),

        elevation: 5,
      ),
      backgroundColor: Colors.white,
      body: Center(child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(40),
          child: Column(
          
             crossAxisAlignment: CrossAxisAlignment.stretch,
            //  mainAxisAlignment: MainAxisAlignment.start,
            // Ortadan yazmaya başlar, yazdıkça yukarı kaydırır.
            children: <Widget>[
              // Yukarıdan aşağı doğru elemanlar sıralanıyor.
  Image.asset("images/yeeeY.png", width: 350, height: 350),

              // Text(
              //   "YAPDOY",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 32,
              //       color: Colors.red.shade700),
              // ),
              
             Container(child: SocialLogInButton(
                buttonText: "Email ve Şifre ile Oturum Aç",
                textColor: Colors.red,
                buttonColor: Colors.white,
                buttonIcon: Image.asset("images/C.png"),
                onPressed: () => _emailVeSifreIleGiris(context),
                radius: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(24)),
                boxShadow: [ BoxShadow(color: Colors.red,spreadRadius: 0,blurRadius: 3,offset: Offset(0,0))]),),
 
              Container(child: SocialLogInButton(
                buttonText: "Gmail ile Oturum Aç",
                textColor: Colors.red,
                buttonColor: Colors.white,
                buttonIcon: Image.asset("images/G.png"),
                onPressed: () => _googleIleGiris(context),
                radius: 16,
              ),
              decoration: BoxDecoration(color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(24)),
                boxShadow: [ BoxShadow(color: Colors.red,spreadRadius: 0,blurRadius: 3,offset: Offset(0,0))]),),
              //  Text(
              //     "mmm nefis...",textAlign: TextAlign.center,
              //     style: TextStyle(fontFamily: "yazim",color: Colors.red),
              //   ),

            ],
          ))),
    );
  }

  void oturumac() {}

  void misafirgirisi(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context);
    User _user = await _userModel.signInAnonymously();

    print("Oturum açan user Id:" + _user.userID.toString());
  }
}
