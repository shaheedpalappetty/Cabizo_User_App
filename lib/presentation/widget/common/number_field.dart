import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app_user/presentation/widget/common/textfield.dart';

class NumberField extends StatelessWidget {
  const NumberField({super.key, this.controller});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 232, 232, 232),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: CountryCodePicker(
            onChanged: (code) {
              // setState(() {
              //   _selectedCountry = code;
              // });
            },
            initialSelection: 'IN', // Set the initial selection
            favorite: const [
              'US',
              'IN'
            ], // Optionally, provide a list of favorite countries
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        // Phone number text field
        Expanded(
            child: CustomTextfield(
          keyboardType: TextInputType.number,
          hintText: 'Enter phone number',
          controller: controller,
        )),
      ],
    );
  }
}
