import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth/Controller/auth_controller.dart';
import 'package:pinput/pinput.dart';

class Verifyotp extends StatefulWidget {
  const Verifyotp(
      {super.key, required this.phoneNumber, required this.verificationId});
  final String phoneNumber;
  final String verificationId;

  @override
  State<Verifyotp> createState() => _VerifyotpState();
}

class _VerifyotpState extends State<Verifyotp> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      margin: EdgeInsets.symmetric(horizontal: 4),
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(6),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
        border: Border.all(color: Colors.black));
    final submittedpinTheme = defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration
            ?.copyWith(color: Colors.green.withOpacity(0.1)));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          widget.phoneNumber,
          style: const TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            children: [
              const Text(
                "To complete your phone number verification , please enter the 6 digit code sent to your Phone Number",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 40,
              ),
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedpinTheme,
                onCompleted: (value) {
                  PhoneAuthController.verifyOtp(
                      context, widget.verificationId, value);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
