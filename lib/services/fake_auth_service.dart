import 'package:yapdoyproject/model/user.dart';
import 'package:yapdoyproject/services/auth_base.dart';

class FakeAuthenticationService implements AuthBase {
  String userID = "1231519812";

  @override
  Future<User> currentUser() async { // Future uzun sürecek işlem anlamına gelir.
    return await Future.value(User(userID: userID,email: 'FakeUser@fake.com'));
  }

  @override
  Future<User> signInAnonymously() async {
    return await Future.delayed(
        Duration(seconds: 2), () => User(userID: userID,email: 'FakeUser@fake.com'));
  }

  @override
  Future<bool> signOut() {
    return Future.value(true);
  }

  @override
  Future<User> signInWithGoogle() async {
     return await Future.delayed(
        Duration(seconds: 2), () => User(userID: "Google_user_ID_45455",email: 'FakeUser@fake.com'));
  }

  @override
  Future<User> createUserWithEmailAndPassword(String email, String sifre) async{
   return await Future.delayed(
        Duration(seconds: 2), () => User(userID: "created_user_ID_45455",email: 'FakeUser@fake.com'));
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String sifre) async {
      return await Future.delayed(
        Duration(seconds: 2), () => User(userID: "signin_user_ID_45455",email: 'FakeUser@fake.com'));
  }
}
