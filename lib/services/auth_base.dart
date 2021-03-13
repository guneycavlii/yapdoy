import 'package:yapdoyproject/model/user.dart';

abstract class AuthBase{

Future<User> currentUser();
Future<User> signInAnonymously();
Future<bool> signOut();
Future<User> signInWithGoogle();
Future<User> signInWithEmailAndPassword(String email, String sifre);
Future<User> createUserWithEmailAndPassword(String email, String sifre);


}