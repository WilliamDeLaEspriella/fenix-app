import 'package:flutter/material.dart';
import 'package:khalticlone/res/colors.dart';
import 'package:khalticlone/ui/widgets/sign_up_Widget.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: mainBg,
      body: SignUpWidget(),
    );
  }


}