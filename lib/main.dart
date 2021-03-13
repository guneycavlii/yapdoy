import 'package:flutter/material.dart';
import 'package:yapdoyproject/landing_page.dart';
import 'package:yapdoyproject/locator.dart';
import 'package:yapdoyproject/viewmodel/usermodel.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator(); // bu olmaazsa bütün sistem çöker
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.red,
            primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white))),
        home: LandingPage(),
      ),
      create: (BuildContext context) => UserModel(),
      // Uyguluma açıldığında ilk bu sayfa açılacaktır.
    );
  }
}
