import 'package:flutter/material.dart';

class FormEdit extends StatefulWidget {
  final Key fieldKey;
  final String hintText;
  final FormFieldValidator<String> validator;
  final TextEditingController fieldcontroller;
  final TextInputType inputType;
  final bool obscureText;

  const FormEdit(
      {Key key,
      this.fieldKey,
      this.hintText,
      this.inputType,
      this.obscureText,
      this.validator,
      this.fieldcontroller})
      : super(key: key);

  @override
  _FormEdit createState() => new _FormEdit();
}

class _FormEdit extends State<FormEdit> {
  @override
  void dispose() {
    widget.fieldcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        key: widget.fieldKey,
        child: TextFormField(
          controller: widget.fieldcontroller,
          obscureText: widget.obscureText == null ? false : widget.obscureText,
          keyboardType: widget.inputType,
          decoration: InputDecoration(labelText: widget.hintText),
          validator: widget.validator,
        ));
  }
}
