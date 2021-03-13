// Kullanıcı ile işlemlerin yapılacağı yer, gerekli mantıklar burada kurulacak.
// Firebase a mi gideyim yoksa fake'e mi gideyim.. aynı metotlar olması lazım
import 'dart:io';

import 'package:yapdoyproject/locator.dart';
import 'package:yapdoyproject/model/user.dart';
import 'package:yapdoyproject/services/auth_base.dart';
import 'package:yapdoyproject/services/fake_auth_service.dart';
import 'package:yapdoyproject/services/firebase_auth_service.dart';
import 'package:yapdoyproject/services/firebase_storage_service.dart';
import 'package:yapdoyproject/services/firestore_db_service.dart';

enum AppMode { DEBUG, RELEASE }

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FakeAuthenticationService _fakeAuthenticationService =
      locator<FakeAuthenticationService>();
  FireStoreDBService _fireStoreDBService = locator<FireStoreDBService>();
  FirebaseStorageService _firebaseStorageService =
      locator<FirebaseStorageService>();
  AppMode appMode = AppMode
      .RELEASE; // Sadece burayı değiştirerek FAKE-FİREBASE SEÇİMİ YAPABİLİRİZ.

  @override
  Future<User> currentUser() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.currentUser();
    } else {
      User _user = await _firebaseAuthService.currentUser();
      bool _sonuc = await _fireStoreDBService.saveUser(_user);
      if (_sonuc) {
        return await _fireStoreDBService.readUser(_user.userID);
      } else {
        return null;
      }
    }
  }

  @override
  Future<User> signInAnonymously() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signInAnonymously();
    } else {
      return await _firebaseAuthService.signInAnonymously();
    }
  }

  @override
  Future<bool> signOut() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signOut();
    } else {
      return await _firebaseAuthService.signOut();
    }
  }

  @override
  Future<User> signInWithGoogle() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signInWithGoogle();
    } else {
      User _user = await _firebaseAuthService.signInWithGoogle();
      bool _sonuc = await _fireStoreDBService.saveUser(_user);
      if (_sonuc) {
        return await _fireStoreDBService.readUser(_user.userID);
      } else {
        return null;
      }
    }
  }

  @override
  Future<User> createUserWithEmailAndPassword(
      String email, String sifre) async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.createUserWithEmailAndPassword(
          email, sifre);
    } else {
      User _user = await _firebaseAuthService.createUserWithEmailAndPassword(
          email, sifre);
      bool _sonuc = await _fireStoreDBService.saveUser(_user);
      if (_sonuc) {
        return await _fireStoreDBService.readUser(_user.userID);
      } else {
        return null;
      }
    }
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String sifre) async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signInWithEmailAndPassword(
          email, sifre);
    } else {
      User _user =
          await _firebaseAuthService.signInWithEmailAndPassword(email, sifre);
      return await _fireStoreDBService.readUser(_user.userID);
    }
  }

  Future<bool> updateUserName(String userID, String yeniUserName) async {
    if (appMode == AppMode.DEBUG) {
      return false;
    } else {
      return await _fireStoreDBService.updateUserName(userID, yeniUserName);
    }
  }

  Future<String> uploadFile(
      String userID, String fileType, File profilFoto) async {
    if (appMode == AppMode.DEBUG) {
      return "dosya_indirme_linki";
    } else {
      var profilFotoURL = await _firebaseStorageService.uploadFile(
          userID, fileType, profilFoto);
      await _fireStoreDBService.updateProfilFoto(userID, profilFotoURL);
      return profilFotoURL;
    }
  }

  Future<List<User>> getAllUser() async {
    if (appMode == AppMode.DEBUG) {
      return [];
    } else {
      var tumKullaniciListesi = await _fireStoreDBService.getAllUser();
      return tumKullaniciListesi;
    }
  }


}
