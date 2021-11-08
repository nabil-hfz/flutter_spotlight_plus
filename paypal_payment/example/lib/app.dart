import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paypal_payment/paypal_payment.dart';

import 'package:http/http.dart';
import 'package:http/io_client.dart';

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PayPalRestApi payPalRestApi;

  @override
  void initState() {
    super.initState();
    payPalRestApi = PayPalRestApi(PayPalClient(IOClient(), "", ""));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Paypal Api'),
        ),
        body: Center(
          child: Text(
            'Hello world',
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          payPalRestApi.payments.createPayment(Payment());
        },),
      ),
    );
  }
}
