import 'package:cosmetics/core/logic/colors.dart';
import 'package:flutter/material.dart';

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({super.key, this.hintText = "Your password"});

  final String hintText;

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter ${widget.hintText}';
        }
        return null;
      },
      obscureText: !_isPasswordVisible,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          icon:
              _isPasswordVisible
                  ? Icon(Icons.visibility_off_outlined)
                  : Icon(Icons.visibility_outlined),
          color: kPrimaryLightBlue,
        ),

        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryLightBlue),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryLightBlue),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
