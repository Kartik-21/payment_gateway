import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.button;
    int total;
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: true,
      title: "Payment Gateway",
      theme: ThemeData(
          primaryColor: Colors.blue,
          accentColor: Colors.blueAccent,
          brightness: Brightness.dark),
      home: Scaffold(
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
                  height: 200.0,
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
                RaisedButton(
                  child: Text(
                    "Pay",
                    style: textStyle,
                  ),
                  color: Theme.of(context).accentColor,
                  textColor: Theme.of(context).primaryColorDark,
                  onPressed: () {
                    Fluttertoast.showToast(msg: "ok " + total.toString());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
