import 'package:flutter/material.dart';
import 'package:khalticlone/res/typography.dart';
import 'package:khalticlone/services/enpoint.dart';
import 'package:dio/dio.dart';
import 'form_edit.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidget createState() => _LoginWidget();
}

class _LoginWidget extends State<LoginWidget> {
  bool _obscureText = true;
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Container container = Container(
      margin: const EdgeInsets.only(top: 70),
      padding: const EdgeInsets.only(top: 80.0, left: 16.0, right: 16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0), color: Colors.white),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.person),
                const SizedBox(width: 10.0),
                Expanded(
                    child: FormEdit(
                        fieldKey: _formKey,
                        hintText: 'Email:',
                        inputType: TextInputType.emailAddress,
                        validator: validateEmail,
                        fieldcontroller: emailController)),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Icon(Icons.lock),
                const SizedBox(width: 10.0),
                Expanded(
                  child: FormEdit(
                      hintText: 'Password:',
                      obscureText: true,
                      fieldcontroller: passwordController),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                width: double.infinity,
                child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: Text("Iniciar Session".toUpperCase()),
                    onPressed: () {
                      loginEvent();
//                    Navigator.pushReplacementNamed(context, 'home');
                    })),
            const SizedBox(height: 20.0),
            GestureDetector(
              child: Text(
                "Olvido su Contraseña".toUpperCase(),
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'recover');
              },
            ),
            const SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Expanded(
                    child: Divider(
                  color: Colors.grey.shade600,
                )),
                const SizedBox(width: 10.0),
                Text(
                  "No es un miembro?",
                  style: smallText,
                ),
                const SizedBox(width: 10.0),
                Expanded(
                    child: Divider(
                  color: Colors.grey.shade600,
                )),
              ],
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              child: Text(
                "Crear una Cuenta".toUpperCase(),
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'register');
              },
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
    return container;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Email invalido!';
    else
      return null;
  }

  callAPI() {
    createPost(emailController.text, passwordController.text).then((response) {
      if (response.statusCode == 200) {
        print(response.data);
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('OK!!')));
      }else {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text(response.data['error'])));
        print(response.statusCode);
      }
    });
  }

  loginEvent() {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a snackbar. In the real world, you'd
      // often want to call a server or save the information in a database
//      Scaffold.of(context)
//          .showSnackBar(SnackBar(content: Text('Processing Data')));
      callAPI();
    }
  }
}
