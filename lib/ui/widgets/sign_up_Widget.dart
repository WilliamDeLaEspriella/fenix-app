import 'package:flutter/material.dart';
import 'package:khalticlone/res/typography.dart';
import 'package:khalticlone/services/enpoint.dart';

import 'form_edit.dart';

class SignUpWidget extends StatefulWidget {
  _SignUpWidget createState() => _SignUpWidget();
}

class _SignUpWidget extends State<SignUpWidget> {
  bool _value1 = false;
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final companiaController = TextEditingController();
  final passwordConController = TextEditingController();
  final toController = TextEditingController();
  final _formKeyFullName = GlobalKey<FormState>();
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPasswordCon = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();
  final _formKeyCompania = GlobalKey<FormState>();
  final _formKeyTo = GlobalKey<FormState>();

  //we omitted the brackets '{}' and are using fat arrow '=>' instead, this is dart syntax
  void _value1Changed(bool value) => setState(() => _value1 = value);
  @override
  Widget build(BuildContext context) {
    Container container = Container(
      margin: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0), color: Colors.white),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FormEdit(
                fieldKey: _formKeyFullName,
                hintText: 'Nombre Completo:',
                inputType: TextInputType.text,
                validator: validatePresencia,
                fieldcontroller: fullNameController),
            const SizedBox(height: 20.0),
            FormEdit(
                fieldKey: _formKeyEmail,
                hintText: 'Email:',
                inputType: TextInputType.emailAddress,
                validator: validateEmail,
                fieldcontroller: emailController),
            const SizedBox(height: 20.0),
            FormEdit(
                fieldKey: _formKeyCompania,
                hintText: 'Compañia:',
                inputType: TextInputType.text,
                validator: validatePresencia,
                fieldcontroller: companiaController),
            const SizedBox(height: 10.0),
            FormEdit(
                fieldKey: _formKeyPassword,
                hintText: 'Contraseña:',
                validator: validatePresencia,
                obscureText: true,
                fieldcontroller: passwordController),
            const SizedBox(height: 20.0),
            FormEdit(
                fieldKey: _formKeyPasswordCon,
                hintText: 'Comfirme Contraseña:',
                validator: validatePassword,
                obscureText: true,
                fieldcontroller: passwordConController),
            const SizedBox(height: 20.0),
            new Row(
              children: <Widget>[
                new Checkbox(value: _value1, onChanged: _value1Changed),
                Text(
                  "Terms & Conditions",
                  style: smallText,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text("Registrarse".toUpperCase()),
                  onPressed: () {
                    signUpEvent();
                  },
                )),
            const SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Expanded(
                    child: Divider(
                  color: Colors.grey.shade600,
                )),
                const SizedBox(width: 10.0),
                Text(
                  "Ya posee una cuenta?",
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
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  "Iniciar Session".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, 'login', (Route<dynamic> route) => false),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
    return container;
  }

  TextField _buildTextField({bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
    );
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

  String validatePassword(String value) {
    if (passwordController.text != value)
      return 'Contraseñas no son iguales';
    else
      return null;
  }

  String validatePresencia(String value) {
    if (value.isEmpty)
      return 'Campo requerido';
    else
      return null;
  }

  signUpEvent() {
    if (_formKeyFullName.currentState.validate() &&
        _formKeyEmail.currentState.validate() &&
        _formKeyCompania.currentState.validate() &&
        _formKeyPassword.currentState.validate() &&
        _formKeyPasswordCon.currentState.validate()) {
      callAPI();
    }
  }

  callAPI() {
    Map<String, dynamic> options = {
      'email': emailController.text,
      'password': passwordController.text,
      'compania': companiaController.text,
      'password_confirmation': passwordConController.text,
      'full_name': fullNameController.text,
      'tyc': _value1
    };
    sign_up(options).then((response) {
      if (response.statusCode == 200) {
        print(response.data);
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('OK!!')));
      } else {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text(response.data['error'])));
        print(response.statusCode);
      }
    });
  }
}
