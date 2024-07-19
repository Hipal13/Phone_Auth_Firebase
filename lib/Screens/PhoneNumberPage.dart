import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:phone_auth/Controller/auth_controller.dart';
import 'package:phone_auth/Screens/verifyOtpPage.dart';

class Phonenumberpage extends StatefulWidget {
  const Phonenumberpage({super.key});

  @override
  State<Phonenumberpage> createState() => _PhonenumberpageState();
}

class _PhonenumberpageState extends State<Phonenumberpage> {
  bool enableOtpBtn = false;
  String phoneNymaber = "";

  getotp() {
    PhoneAuthController.sendotp(context, phoneNymaber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Enter the Number",
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              const Text(
                "Needs to verify your phone number, carrier changes may apply",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 50,
              ),
              InternationalPhoneNumberInput(
                onInputValidated: (value) {
                  setState(() {
                    enableOtpBtn = value;
                  });
                },
                onInputChanged: (value) {
                  setState(() {
                    phoneNymaber = value.phoneNumber!;
                  });
                },
                autoFocus: true,
                formatInput: true,
                keyboardType: TextInputType.number,
                selectorConfig: const SelectorConfig(
                    useEmoji: true,
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET),
                inputDecoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    border: OutlineInputBorder()),
              ),
              Spacer(),
              SizedBox(
                width: 300,
                child: FilledButton(
                  onPressed: getotp,
                  child: Text("Get OTP"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
