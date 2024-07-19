import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth/Screens/OnBoadingPage.dart';
import 'package:phone_auth/Controller/auth_controller.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "HomePage",
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      centerTitle: true,),
      body: Center(
        child: SizedBox(
          width: 300,
          child: FilledButton.icon(
            onPressed:(){
              PhoneAuthController.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Onboadingpage()));
            },
            icon: Icon(Icons.logout),
            label: Text("LogOut"),
          style: FilledButton.styleFrom(
            backgroundColor: Colors.red
          ),),
        )
      ),
    );
  }
}
