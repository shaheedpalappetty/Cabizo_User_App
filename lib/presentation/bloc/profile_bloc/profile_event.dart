part of 'profile_bloc.dart';

class ProfileEvent {}

class DatePickedEvent extends ProfileEvent {
  String pickedDate;
  DatePickedEvent({required this.pickedDate});
}

class GenderPickEvent extends ProfileEvent {
  String selectGender;
  GenderPickEvent({required this.selectGender});
}
