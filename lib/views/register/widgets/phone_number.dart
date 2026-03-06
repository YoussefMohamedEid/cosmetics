
import 'package:cosmetics/core/logic/colors.dart';
import 'package:cosmetics/views/register/countries/countries_widget.dart';
import 'package:flutter/material.dart';

class PhoneNumberWidget extends StatelessWidget {
  const PhoneNumberWidget({super.key});
  @override
  Widget build(BuildContext context) {
    //  Country? selectedCountry;
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: CountryPickerButton(
            onCountryChanged: (country) {
              //  setState(() {
              // selectedCountry = country;
              //});
              print('تم اختيار: ${country.code}');
            },
          ),
        ),
        SizedBox(width: 6),
        Expanded(
          flex: 3,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: "Phone Number",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryLightBlue),
                borderRadius: BorderRadius.circular(8),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryLightBlue),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
