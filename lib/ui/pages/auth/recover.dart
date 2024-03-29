import 'package:flutter/material.dart';
import 'package:khalticlone/res/colors.dart';
import 'package:khalticlone/res/constants.dart';
import 'package:khalticlone/res/typography.dart';

class RecoverPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: mainBg,
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10, left: 16.0,right: 16.0, bottom: 10.0),
        child: Stack(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 70),
              padding: const EdgeInsets.only(top: 80.0,left: 16.0,right: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                color: Colors.white
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text("Recuperar Contraseña",style: TextStyle(
                      fontSize: 20.0
                    ),),
                    const SizedBox(height: 10.0),
                    Text("Enviaremos el código de confirmación a través del email. Escriba su email a continuación."),
                    const SizedBox(height: 20.0),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Email"
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      width:double.infinity,
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Text("Recuperar".toUpperCase()),
                        onPressed: (){},
                      )
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: <Widget>[
                        Expanded(child: Divider(color: Colors.grey.shade600,)),
                        const SizedBox(width: 10.0),
                        Text("Algun problema?", style: smallText,),
                        const SizedBox(width: 10.0),
                        Expanded(child: Divider(color: Colors.grey.shade600,)),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    GestureDetector(
                      child: Text("Contactenos".toUpperCase(), style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600
                      ),),
                      onTap: (){},
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
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