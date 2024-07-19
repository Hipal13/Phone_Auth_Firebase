import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth/Screens/PhoneNumberPage.dart';

class Onboadingpage extends StatefulWidget {
  const Onboadingpage({super.key});

  @override
  State<Onboadingpage> createState() => _OnboadingpageState();
}

class _OnboadingpageState extends State<Onboadingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: AssetImage(
                "asset/images.png",
              ),
            ),
            SizedBox(
              height: 100,
            ),
            const Text("Welcome to Phone Auth Firebase"),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 25, right: 25),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Phonenumberpage()));
                  },
                  label: const Text('Continue with Phone'),
                  icon: const Icon(CupertinoIcons.phone_fill),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
