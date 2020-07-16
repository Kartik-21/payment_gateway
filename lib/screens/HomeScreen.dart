import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int total = 0;
  Razorpay _razorpay;
  var desc = "";

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlerPaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlerPaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handlerExternalWallet);
  }

  void openCheckout() async {
    var option = {
      'key': 'rzp_test_kL7iogucseOSgl',
      'amount': total * 100,
      'name': 'Kartikinfotech',
      'description': desc,
      'prefill': {'contact': '', 'email': ''},
      'external': {
        'wallets': ['']
      }
    };
    try {
      _razorpay.open(option);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlerPaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "SUCCESS: " + response.paymentId);
  }

  void _handlerPaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message);
  }

  void _handlerExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "EX WALLET: " + response.walletName);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.button;
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Gateway"),
        centerTitle: true,
        elevation: 6.0,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 150.0,
              ),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "Make Payment",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 26.0,
                        // color: Theme.of(context).primaryColorDark
                      ),
                    ),
                  )),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Enter Amount",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                // style: textStyle,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    total = num.parse(value);
                  });
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Enter Desc",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                // style: textStyle,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    this.desc = value;
                  });
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              RaisedButton(
                child: Text(
                  "Pay",
                  style: textStyle,
                ),
                color: Theme.of(context).accentColor,
                textColor: Theme.of(context).primaryColorDark,
                onPressed: () {
                  // Fluttertoast.showToast(msg: "ok " + total.toString());
                  openCheckout();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }
}
