import 'dart:async';

import 'package:bloc/bloc.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<DatePickedEvent>(datePickedEvent);
    on<GenderPickEvent>(genderPickEvent);
  }

  FutureOr<void> datePickedEvent(
      DatePickedEvent event, Emitter<ProfileState> emit) {
    emit(DatePickedState(pickedDate: event.pickedDate));
  }

  FutureOr<void> genderPickEvent(
      GenderPickEvent event, Emitter<ProfileState> emit) {
    emit(GenderPickState(selectGender: event.selectGender));
  }
}
