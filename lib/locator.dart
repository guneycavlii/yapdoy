import 'package:get_it/get_it.dart';
import 'package:yapdoyproject/repository/user_repository.dart';
import 'package:yapdoyproject/services/fake_auth_service.dart';
import 'package:yapdoyproject/services/firebase_auth_service.dart';
import 'package:yapdoyproject/services/firebase_storage_service.dart';
import 'package:yapdoyproject/services/firestore_db_service.dart';


GetIt locator = GetIt.instance;

void setupLocator(){ 
locator.registerSingleton<FireStoreDBService>(FireStoreDBService());
locator.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
locator.registerSingleton<FakeAuthenticationService>(FakeAuthenticationService());
locator.registerSingleton<FirebaseStorageService>(FirebaseStorageService());
locator.registerSingleton<UserRepository>(UserRepository());

}