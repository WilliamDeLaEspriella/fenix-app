import 'package:flutter/material.dart';
import 'package:khalticlone/res/colors.dart';
import 'package:khalticlone/res/constants.dart';
import 'package:khalticlone/ui/widgets/login_widget.dart';

class LoginPage extends StatelessWidget {


  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: mainBg,
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10, left: 16.0,right: 16.0, bottom: 10.0),
        child: Stack(
          children: <Widget>[
            LoginWidget(),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              alignment: Alignment.center,
              height: 100,
              child: Image.asset(logo, fit: BoxFit.contain,)),
          ],
        ),
      ),
    );
  }
}