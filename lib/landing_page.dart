import 'package:flutter/material.dart';
import 'package:yapdoyproject/home_page.dart';
import 'package:yapdoyproject/sign_in_page.dart';
import 'package:yapdoyproject/viewmodel/usermodel.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final _userModel = Provider.of<UserModel>(context);

    if (_userModel.state == ViewState.Idle) {
      if (_userModel.user != null) {
        return HomePage(
          user: _userModel.user,
        );
      } else {
        return SignInPage();
      }
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
