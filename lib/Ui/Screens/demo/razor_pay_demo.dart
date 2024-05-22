import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayDemo extends StatefulWidget {
  const RazorPayDemo({super.key});

  @override
  State<RazorPayDemo> createState() => _RazorPayDemoState();
}

class _RazorPayDemoState extends State<RazorPayDemo> {
  Razorpay razorPay = Razorpay();
  @override
  Widget build(BuildContext context) {
    razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Razor Pay"),
        centerTitle: true,
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            var options = {
              'key': 'rzp_live_VUHG1603ofFkWt',
              'amount': 100,
              'name': 'Mahesh',
              'description': 'Platform fee',
              'prefill': {
                'contact': '9744887799',
                'email': 'mediezytech@gmail.com'
              }
            };
            razorPay.open(options);
          },
          child: const Text("Pay 10 rupees"),
        ),
      ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    GeneralServices.instance.showToastMessage("Payment success");
    log(response.paymentId.toString());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    GeneralServices.instance.showToastMessage("Payment failed");
    log(response.message.toString());
  }

  @override
  void dispose() {
    super.dispose();
    try {
      razorPay.clear();
    } catch (e) {
      log(e.toString());
    }
  }
}
