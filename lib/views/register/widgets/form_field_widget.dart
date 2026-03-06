import 'package:cosmetics/core/logic/colors.dart';
import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({super.key, required this.hintText});

final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the $hintText';
        }
        return null;
      },
      
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
       

        hintText: hintText,
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