import 'package:cosmetics/core/logic/adaptive_text.dart';
import 'package:cosmetics/core/logic/colors.dart';
import 'package:cosmetics/views/register/countries/countries_model.dart';
import 'package:flutter/material.dart';

class CountryPickerButton extends StatefulWidget {
  final Function(Country) onCountryChanged;
  final Country? initialCountry;

  const CountryPickerButton({
    super.key,
    required this.onCountryChanged,
    this.initialCountry,
  });

  @override
  _CountryPickerButtonState createState() => _CountryPickerButtonState();
}

class _CountryPickerButtonState extends State<CountryPickerButton> {
  late Country _selectedCountry;

  @override
  void initState() {
    super.initState();
    _selectedCountry = widget.initialCountry ?? countries.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(color: kPrimaryLightBlue),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<Country>(
        value: _selectedCountry,
        isExpanded: true,
        underline: SizedBox(), // إزالة الخط السفلي الافتراضي
        icon: Icon(Icons.arrow_drop_down),
        items:
            countries.map((Country country) {
              return DropdownMenuItem<Country>(
                value: country,
                child: Row(
                  children: [
                    Text(
                      country.flag,
                      style: TextStyles.smallLightBlue.copyWith(fontSize: 22),
                    ),
                    SizedBox(width: 8),
                    Text(country.code),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        country.nameEN,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.smallLightBlue,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
        onChanged: (Country? newValue) {
          if (newValue != null) {
            setState(() {
              _selectedCountry = newValue;
            });
            widget.onCountryChanged(newValue);
          }
        },
      ),
    );
  }
}
