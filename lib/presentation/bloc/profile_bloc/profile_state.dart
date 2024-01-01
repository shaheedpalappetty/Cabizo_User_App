part of 'profile_bloc.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class DatePickedState extends ProfileState {
  final String pickedDate;
  DatePickedState({required this.pickedDate});
}

final class GenderPickState extends ProfileState {
  String selectGender;
  GenderPickState({required this.selectGender});
}
