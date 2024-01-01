import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class RazorPay {
  
  final Razorpay _razorpay = Razorpay();
  razorPay(String amount) {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    // final amountTemp = event.totalAmount;
    // final amount = int.parse(amountTemp);
    // final String propertyName = propertyName;
    // final String mobileNumber = mobNumber;
    // print(
    //     '------------------------------------------------------------------total price new -------------');
    // print(amount);
    // print(propertyName);
    // print(mobileNumber);

    var options = {
      'key': 'rzp_test_aPzemyrqsHf1Vf',
      'amount': amount,
      'name': 'Quick Book',
      'description': "anshif Lenged iconic",
      'prefill': {'contact': "755894320", 'email': 'testRazorPay@gmail.com'}
    };

    _razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response)async {
    Fluttertoast.showToast(
        msg: "Success Payment :${response.paymentId}", timeInSecForIosWeb: 4);
    // add(PaymentSuccessEvent());
    // await Repo.updatePaymentStatus(userId, driverId, "Paid");
  }

  void _handlePaymentError(PaymentFailureResponse response) async{
    Fluttertoast.showToast(
        msg: "Error Here :${response.code}", timeInSecForIosWeb: 4);
    // add(PaymentFailedEvent());
    //  await Repo.updatePaymentStatus(userId, driverId, "UnPaid");
  }
}
