import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yapdoyproject/model/user.dart';
import 'package:yapdoyproject/services/auth_base.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User> currentUser() async {
    try {
      FirebaseUser user = await _firebaseAuth.currentUser();
      return _userFromFirebase(user);
    } catch (e) {
      print("HATA CURRENT USER" + e.toString());
      return null;
    }
  }

  User _userFromFirebase(FirebaseUser user) {
    if (user == null) return null;
    return User(userID: user.uid,email: user.email);
  }

  @override
  Future<User> signInAnonymously() async {
    try {
      AuthResult sonuc = await _firebaseAuth.signInAnonymously();
      return _userFromFirebase(sonuc.user);
    } catch (e) {
      print("Misafir Girişi HATA" + e.toString());
      return null;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      final _googleSignIn = GoogleSignIn();
      await _googleSignIn.signOut();
      await _firebaseAuth.signOut(); // Geriye bir şey döndürmez.
      return true;
    } catch (e) {
      print("HATA SIGNOUT USER" + e.toString());
      return false;
    }
  }

  @override
  Future<User> signInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount _googleUser = await _googleSignIn.signIn();

    if (_googleUser != null) {
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      if (_googleAuth.idToken != null && _googleAuth.accessToken != null) {
        AuthResult sonuc = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.getCredential(
                idToken: _googleAuth.idToken,
                accessToken: _googleAuth.accessToken));
        FirebaseUser _user = sonuc.user;
        return _userFromFirebase(_user);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<User> createUserWithEmailAndPassword(String email, String sifre) async {
    
      AuthResult sonuc = (await _firebaseAuth.createUserWithEmailAndPassword(email: email.trim(),password: sifre));
      return _userFromFirebase(sonuc.user);
    
   
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String sifre) async {

  
      AuthResult sonuc = await _firebaseAuth.signInWithEmailAndPassword(email: email.trim(),password: sifre);
      return _userFromFirebase(sonuc.user); // Firebase user döndürüyor kendi metodumuzla kendi user nesnemize dönüştürüyoruz.
    
  }
}
