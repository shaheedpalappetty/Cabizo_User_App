import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:taxi_app_user/razor_pay.dart';
import 'package:taxi_app_user/service/repository.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  RazorPay payment = RazorPay();

  PaymentBloc() : super(PaymentInitial()) {
    on<OpenPaymentEvent>(_paymentEvent);
    on<PaymentSuccessEvent>(_onPaymentSuccess);
    on<PaymentFailedEvent>(_onPaymentFailed);
  }
  late int userId;
  late int driverId;
  final _razorpay = Razorpay();
  _paymentEvent(OpenPaymentEvent event, Emitter<PaymentState> emit) {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    final total = event.total;
    final String propertyName = event.propertyName;
    final String mobileNumber = event.mobileNumber;
    userId = event.userId;
    driverId = event.driverId;
    var options = {
      'key': 'rzp_test_aPzemyrqsHf1Vf',
      'amount': total * 100,
      'name': 'East Stay',
      'description': propertyName,
      'prefill': {'contact': mobileNumber, 'email': 'test@razorpay.com'}
    };

    _razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    add(PaymentSuccessEvent());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    add(PaymentFailedEvent());
  }

  _onPaymentSuccess(
      PaymentSuccessEvent event, Emitter<PaymentState> emit) async {
    await Repo.updatePaymentStatus(userId, driverId, "Paid");
    emit(PaymentSuccessState());
     
  }

  _onPaymentFailed(PaymentFailedEvent event, Emitter<PaymentState> emit) async {
    await Repo.updatePaymentStatus(userId, driverId, "UnPaid");
    emit(PaymentFailedState());
  }

  @override
  Future<void> close() {
    _razorpay.clear();
    return super.close();
  }
}
