import 'package:flutter/material.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayDemo extends StatefulWidget {
  const RazorPayDemo({super.key});

  @override
  State<RazorPayDemo> createState() => _RazorPayDemoState();
}

class _RazorPayDemoState extends State<RazorPayDemo> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openCheckout() {
    var options = {
      'key': 'rzp_live_VUHG1603ofFkWt',
      'amount': 100,
      'name': 'Mediezy Technologies',
      'description': 'Platform fee',
      'prefill': {'contact': '9744887799', 'email': 'mediezytech@gmail.com'},
      'external': {
        'wallets': ['paytm']
      },
      'theme': {'color': '#595DE50'},
      'modal': {'backdropclose': true, 'confirm_close': true},
      'retry': {'enabled': true, 'max_count': 4},
      'timeout': 300
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    GeneralServices.instance
        .showToastMessage("Payment succesfull${response.paymentId}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    GeneralServices.instance
        .showToastMessage("Payment failed${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    GeneralServices.instance
        .showToastMessage("External wallet${response.walletName}");
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Razor Pay"),
        centerTitle: true,
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            openCheckout();
          },
          child: const Text("Pay 10 rupees"),
        ),
      ),
    );
  }
}
