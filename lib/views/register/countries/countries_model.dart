// lib/models/country_model.dart

class Country {
  final String nameAR;      // اسم الدولة (مثل "مصر")
  final String nameEN;      // اسم الدولة (مثل "مصر")
  final String flag;      // رمز العلم (يمكن استخدام Emoji أو مسار صورة)
  final String code;      // رمز الدولة (مثل "+20")
  final String isoCode;   // الكود المختصر (مثل "EG") - يمكن استخدامه للعلم إن وجد

  Country({
    required this.nameAR,
    required this.nameEN,
    required this.flag,
    required this.code,
    required this.isoCode,
  });
}



final List<Country> countries = [
  Country(nameAR: 'مصر', nameEN: 'Egypt', flag: '🇪🇬', code: '+20', isoCode: 'EG'),
  Country(nameAR: 'السعودية', nameEN: 'Saudi Arabia', flag: '🇸🇦', code: '+966', isoCode: 'SA'),
  Country(nameAR: 'الإمارات', nameEN: 'United Arab Emirates', flag: '🇦🇪', code: '+971', isoCode: 'AE'),
  Country(nameAR: 'الكويت', nameEN: 'Kuwait', flag: '🇰🇼', code: '+965', isoCode: 'KW'),
  Country(nameAR: 'قطر', nameEN: 'Qatar', flag: '🇶🇦', code: '+974', isoCode: 'QA'),
  Country(nameAR: 'البحرين', nameEN: 'Bahrain', flag: '🇧🇭', code: '+973', isoCode: 'BH'),
  Country(nameAR: 'عمان', nameEN: 'Oman', flag: '🇴🇲', code: '+968', isoCode: 'OM'),
  Country(nameAR: 'العراق', nameEN: 'Iraq', flag: '🇮🇶', code: '+964', isoCode: 'IQ'),
  Country(nameAR: 'الأردن', nameEN: 'Jordan', flag: '🇯🇴', code: '+962', isoCode: 'JO'),
  Country(nameAR: 'لبنان', nameEN: 'Lebanon', flag: '🇱🇧', code: '+961', isoCode: 'LB'),
  Country(nameAR: 'فلسطين', nameEN: 'Palestine', flag: '🇵🇸', code: '+970', isoCode: 'PS'),
  Country(nameAR: 'سوريا', nameEN: 'Syria', flag: '🇸🇾', code: '+963', isoCode: 'SY'),
  Country(nameAR: 'اليمن', nameEN: 'Yemen', flag: '🇾🇪', code: '+967', isoCode: 'YE'),
  Country(nameAR: 'السودان', nameEN: 'Sudan', flag: '🇸🇩', code: '+249', isoCode: 'SD'),
  Country(nameAR: 'المغرب', nameEN: 'Morocco', flag: '🇲🇦', code: '+212', isoCode: 'MA'),
  Country(nameAR: 'الجزائر', nameEN: 'Algeria', flag: '🇩🇿', code: '+213', isoCode: 'DZ'),
  Country(nameAR: 'تونس', nameEN: 'Tunisia', flag: '🇹🇳', code: '+216', isoCode: 'TN'),
  Country(nameAR: 'ليبيا', nameEN: 'Libya', flag: '🇱🇾', code: '+218', isoCode: 'LY'),
];















// class LoginView extends StatefulWidget {
//   const LoginView({super.key});

//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
//   Country? _selectedCountry;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(14.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
          
          

//             Row(
//               children: [
//                 Expanded(
//                   child: CountryPickerButton(
//                     onCountryChanged: (country) {
//                       setState(() {
//                         _selectedCountry = country;
//                       });
//                       print('تم اختيار: ${country.code}');
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }












// class CountryPickerButton extends StatefulWidget {
//   final Function(Country) onCountryChanged;
//   final Country? initialCountry;

//   const CountryPickerButton({
//     super.key,
//     required this.onCountryChanged,
//     this.initialCountry,
//   });

//   @override
//   _CountryPickerButtonState createState() => _CountryPickerButtonState();
// }

// class _CountryPickerButtonState extends State<CountryPickerButton> {
//   late Country _selectedCountry;

//   @override
//   void initState() {
//     super.initState();
//     _selectedCountry = widget.initialCountry ?? countries.first;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: DropdownButton<Country>(
//         value: _selectedCountry,
//         isExpanded: true,
//         underline: SizedBox(), // إزالة الخط السفلي الافتراضي
//         icon: Icon(Icons.arrow_drop_down),
//         items:
//             countries.map((Country country) {
//               return DropdownMenuItem<Country>(
//                 value: country,
//                 child: Row(
//                   children: [
//                     Text(country.flag, style: TextStyle(fontSize: 22)),
//                     SizedBox(width: 8),
//                     Text(country.code),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: Text(
//                         country.nameEN,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(fontSize: 14),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }).toList(),
//         onChanged: (Country? newValue) {
//           if (newValue != null) {
//             setState(() {
//               _selectedCountry = newValue;
//             });
//             widget.onCountryChanged(newValue);
//           }
//         },
//       ),
//     );
//   }
// }
