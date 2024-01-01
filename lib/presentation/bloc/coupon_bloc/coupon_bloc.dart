import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'coupon_event.dart';
part 'coupon_state.dart';

class CouponBloc extends Bloc<CouponEvent, CouponState> {
  CouponBloc() : super(CouponInitial()) {
    on<CouponSelectEvent>(couponSelectEvent);
  }

  FutureOr<void> couponSelectEvent(
      CouponSelectEvent event, Emitter<CouponState> emit) {
    emit(CouponSelectedState(select:event.select,index: event.index));
  }
}
