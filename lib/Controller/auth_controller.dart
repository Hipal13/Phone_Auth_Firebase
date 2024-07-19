import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:phone_auth/Screens/Homepage.dart';
import 'package:phone_auth/Screens/verifyOtpPage.dart';

class PhoneAuthController {
  static final _auth = FirebaseAuth.instance;


  //sentOtp
  static Future<void> sendotp(BuildContext context, String phoneNumber) async {
    try {
      context.loaderOverlay.show();
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (phoneAuthCredential) {},
          verificationFailed: (error) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  content: Text(error.message ?? "Something went wrong")));
          },
          codeSent: (verificationId, forceResendingtoken) {
            context.loaderOverlay.hide();
              Navigator.push(
                context,
                  MaterialPageRoute(
                    builder: (context) => Verifyotp(
                          phoneNumber: phoneNumber,
                          verificationId: verificationId,
                        )));
           },
              codeAutoRetrievalTimeout: (verificationId) {});
                  } on FirebaseAuthException catch (error) {
                      ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                             SnackBar(
                                 content: Text(error.message ?? "Something went wrong")
                             )
                          );
                  } catch (e) {
                    print(e);
                       } finally {
                           context.loaderOverlay.hide();
                          }
                        }

   //VerifyOtp
  static Future<void> verifyOtp(
      BuildContext context, String verificationId, String smsCode) async {
    try {
      context.loaderOverlay.show();
      final credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      await _auth.signInWithCredential(credential);
      if (!context.mounted) return;
      context.loaderOverlay.hide();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
            SnackBar(content: Text(error.message ?? "Something went wrong")));
    } catch (e) {
      print(e);
    } finally {
      context.loaderOverlay.hide();
    }
  }


//SignOut
  static Future<void> signOut() async {
    await _auth.signOut();
  }
}
