
import 'package:yapdoyproject/model/user.dart';

abstract class DBbase {
// Yarın öbür gün firebase yerine baska bir şey kullanırsak buradan türeteceğimiz için kodlarımızda eksiklik  oluyor, burası önemli.
  Future<bool> saveUser(User user);
  Future<User> readUser(String userID);
  Future<bool> updateUserName(String userID, String yeniUserName);
  Future<bool> updateProfilFoto(String userID, String profilFotoURL);
  Future<List<User>> getAllUser();

 

}
