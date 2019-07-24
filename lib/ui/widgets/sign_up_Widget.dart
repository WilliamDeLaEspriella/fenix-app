import 'package:flutter/material.dart';
import 'package:khalticlone/res/typography.dart';

class SignUpWidget extends StatefulWidget {
  _SignUpWidget createState() => _SignUpWidget();
}

class _SignUpWidget extends State<SignUpWidget> {
  bool _value1 = false;

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
            Text(
              "Full Name",
              style: smallText,
            ),
            _buildTextField(),
            const SizedBox(height: 20.0),
            Text(
              "Email",
              style: smallText,
            ),
            _buildTextField(),
            const SizedBox(height: 20.0),
            Text(
              "Compañia",
              style: smallText,
            ),
            _buildTextField(),
            const SizedBox(height: 10.0),
            Text(
              "Contraseña",
              style: smallText,
            ),
            _buildTextField(obscureText: true),
            const SizedBox(height: 20.0),
            Text(
              "Confirme Contraseña",
              style: smallText,
            ),
            _buildTextField(obscureText: true),
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
                  onPressed: () {},
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
                  "Ya posse una Cuenta?",
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
}
