import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yapdoyproject/model/user.dart';
import 'package:yapdoyproject/model/yemektarifleri.dart';
import 'package:yapdoyproject/services/database_base.dart';

class FireStoreDBService implements DBbase {

  final Firestore _firestore = Firestore.instance;

  @override
  Future<bool> saveUser(User user) async {
    Map _eklenecekUserMap = user.toMap();
    _eklenecekUserMap['createdAt'] = FieldValue.serverTimestamp();
    _eklenecekUserMap['updatedAt'] = FieldValue.serverTimestamp();

    await _firestore
        .collection("users")
        .document(user.userID)
        .setData(_eklenecekUserMap);
//usersa gel ve oku.
    DocumentSnapshot _okunanUser =
        await Firestore.instance.document("users/${user.userID}").get();

    Map _okunanUserBilgileriMapi = _okunanUser.data;
    User _okunanUserBilgileriNesne = User.fromMap(_okunanUserBilgileriMapi);
    print("Okunan user nesnesi: " + _okunanUserBilgileriNesne.toString());

    return true;
  }

  @override
  Future<User> readUser(String userID) async {
    DocumentSnapshot _okunanUser =
        await _firestore.collection("users").document(userID).get();
    Map<String, dynamic> _okunanUserBilgileriMap = _okunanUser.data;

    User _okunanUserNesnesi = User.fromMap(_okunanUserBilgileriMap);
    print("Okunan User Nesnesi: " + _okunanUserNesnesi.toString());
    return _okunanUserNesnesi;
  }

  @override
  Future<bool> updateUserName(String userID, String yeniUserName) async {
    var users = await _firestore
        .collection("users")
        .where("userName", isEqualTo: yeniUserName)
        .getDocuments();
    if (users.documents.length >= 1) {
      return false;
    } else {
      await _firestore
          .collection("users")
          .document(userID)
          .updateData({'userName': yeniUserName});
      return true;
    }
  }

  Future<bool> updateProfilFoto(String userID, String profilFotoURL) async {
    await _firestore
        .collection("users")
        .document(userID)
        .updateData({'profilURL': profilFotoURL});
    return true;
  }

  @override
  Future<List<User>> getAllUser() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection("users").getDocuments();

    List<User> tumKullanicilar = [];
    for (DocumentSnapshot tekUser
        in querySnapshot.documents) // Users'a git tek tek gez..
    {
      User _tekUser = User.fromMap(tekUser
          .data); // Veritabanında map oalarak saklanan bu değerli alıp bir User nesnesine dönüştürücek.
      tumKullanicilar.add(_tekUser);
    }

    //MAP METODU İLE
    //tumKullanicilar = querySnapshot.documents.map((tekSatir)=>User.fromMap(tekSatir.data)).toList();
    return tumKullanicilar;
  }

 
}
