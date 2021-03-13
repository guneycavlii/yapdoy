import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:yapdoyproject/common_widget/platform_duyarli_alert_dialog.dart';
import 'package:yapdoyproject/common_widget/social_sign_in_button.dart';
import 'package:yapdoyproject/model/user.dart';
import 'package:yapdoyproject/sign_in/hata_exception.dart';
import 'package:yapdoyproject/viewmodel/usermodel.dart';
import 'package:provider/provider.dart';

enum FormType { Register, LogIn }

class EmailSifreGirisSayfasi extends StatefulWidget {
  @override
  _EmailSifreGirisSayfasiState createState() => _EmailSifreGirisSayfasiState();
}

class _EmailSifreGirisSayfasiState extends State<EmailSifreGirisSayfasi> {
  String _email, _sifre;
  String _butonText, _linkText;

  var _formType = FormType.Register;
  final _formKey = GlobalKey<FormState>();

  void _formSubmit(BuildContext context) async {
    _formKey.currentState.save();
    debugPrint("Email ve Şifre " + _email + "  " + _sifre);

    final _userModel = Provider.of<UserModel>(context, listen: false);

    if (_formType == FormType.LogIn) {
      try {
        User _girisYapanUser =
            await _userModel.signInWithEmailAndPassword(_email, _sifre);
        if (_girisYapanUser != null)
          print(
              "Oturum açan kullanıcı ID: " + _girisYapanUser.userID.toString());
      } on PlatformException catch (e) {
        PlatformDuyarliAlertDialog(
          baslik: "Oturum Açma Hata",
          icerik: Hatalar.goster(e.code),
          anaButonYazisi: "Tamam",
        ).goster(context);
      }
    } else {
      try {
        User _kayitOlanUser =
            await _userModel.createUserWithEmailAndPassword(_email, _sifre);
        if (_kayitOlanUser != null)
          print("Kayıt olan kullanıcı ID: " + _kayitOlanUser.userID.toString());
      } on PlatformException catch (e) {
        // Hatanın cinsini yazmak detay verir.
        PlatformDuyarliAlertDialog(
          baslik: "Kullanıcı Oluşturma Hata",
          icerik: Hatalar.goster(e.code),
          anaButonYazisi: "Tamam",
        ).goster(context);
        // Dışarıya basınca kaybolup kaybolmayacağı true-false
      }
    }
  }

  void _degistir() {
    // Formun tipini değiştirmek istiyorum.
    setState(() {
      _formType =
          _formType == FormType.LogIn ? FormType.Register : FormType.LogIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context, listen: true);

    if (_userModel.user != null) {
      Future.delayed(Duration(milliseconds: 80), () {
        Navigator.of(context).pop();
      });
      // Gösterdiğimiz diyalogu göstermememizi sağlıyor.
    }

    _butonText = _formType == FormType.LogIn ? "Giriş Yap" : "Kayıt Ol";
    _linkText = _formType == FormType.LogIn
        ? "Hesabınız yok mu? Kayıt Olun."
        : "Hesabınız var mı? Giriş Yapın.";

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Giriş / Kayıt"),
        ),
        //SingleChildScrollView eğer fazla ekleme yaparsam kaymalar olmasın diye.
        body: _userModel.state == ViewState.Idle
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: Column(children: <Widget>[ SizedBox(
                          height: 200,
                        ),
                        TextFormField(
                          // Kullanıcıdan veri alma işlemleri burada yapılır.
                          keyboardType: TextInputType
                              .emailAddress, //@ işareti gibi .. lazım olan klavyeyeyi getirir.
                          decoration: InputDecoration(
                            errorText: _userModel.emailHataMesaji != null
                                ? _userModel.emailHataMesaji
                                : _userModel.emailHataMesaji = null,
                            prefixIcon: Icon(Icons.mail),
                            hintText: "E-mail",
                            labelText: "E-mail",
                            border: OutlineInputBorder(),
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          ),
                          onSaved: (String girilenEmail) {
                            _email = girilenEmail;
                          },
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          // Kullanıcıdan veri alma işlemleri burada yapılır.
                          obscureText:
                              true, //Şifre alanının gizli olmasını sağlar.
                          decoration: InputDecoration(
                            errorText: _userModel.sifreHataMesaji != null
                                ? _userModel.sifreHataMesaji
                                : _userModel.sifreHataMesaji = null,
                            prefixIcon: Icon(Icons.lock),
                            hintText: "Şifre",
                            labelText: "Şifre",
                            border: OutlineInputBorder(),
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          ),
                          onSaved: (String girilenSifre) {
                            _sifre = girilenSifre;
                          },
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SocialLogInButton(
                          buttonText: _butonText,
                          buttonColor: Theme.of(context).primaryColor,
                          onPressed: () => _formSubmit(context),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //FLATBUTTON TIKLANILABİLİR YAZI
                        FlatButton(
                            onPressed: () => _degistir(),
                            child: Text(_linkText)),
                      ]),
                    ),
                  ),
                ),
              )
            : Center(child: CircularProgressIndicator()));
  }
}
