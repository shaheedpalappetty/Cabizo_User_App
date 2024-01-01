// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/profile_bloc/profile_bloc.dart';

class DatePickerFun {
  List<String> items = ['None', 'Male', 'Female'];
  String selectGender = 'None';
  DateTime selectedDate = DateTime.now();
  getTimeFromUser(BuildContext context) async {
    final DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2004));

    if (pickerDate != null) {
      selectedDate = pickerDate;
      context.read<ProfileBloc>().add(
          DatePickedEvent(pickedDate: DateFormat.yMd().format(selectedDate)));
    } else {}
  }

  static getGender(String newValue, BuildContext context) {
    context.read<ProfileBloc>().add(GenderPickEvent(selectGender: newValue));
  }
}
