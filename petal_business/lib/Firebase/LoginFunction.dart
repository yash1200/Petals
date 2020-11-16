import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petal_business/Provider/LoginProvider.dart';
import 'package:petal_business/views/login/Login.dart';
import 'package:provider/provider.dart';

void verifyPhoneNumber(String phone, BuildContext context) async {
  final provider = Provider.of<LoginProvider>(context, listen: false);
  var _verificationId;

  final PhoneVerificationCompleted verificationCompleted =
      (PhoneAuthCredential phoneAuthCredential) {};

  final PhoneVerificationFailed verificationFailed =
      (FirebaseAuthException firebaseAuthException) {};

  final PhoneCodeSent codeSent =
      (String verificationId, [int forceResendingToken]) async {
    _verificationId = verificationId;
    provider.setVerifyId(_verificationId);
  };

  final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
      (String verificationId) {
    _verificationId = verificationId;
  };

  print(_verificationId);
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: "+91" + phone,
    timeout: const Duration(seconds: 5),
    verificationCompleted: verificationCompleted,
    verificationFailed: verificationFailed,
    codeSent: codeSent,
    codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
  );
}

Future<bool> signInWithPhoneNumber(String otp, String verificationId) async {
  final AuthCredential credential = PhoneAuthProvider.credential(
    verificationId: verificationId,
    smsCode: otp,
  );
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
  User user = userCredential.user;
  if (user != null) return true;
  return false;
}

User getUser() {
  User firebaseUser = FirebaseAuth.instance.currentUser;
  return firebaseUser;
}

void firebaseLogOut(BuildContext context) {
  FirebaseAuth.instance.signOut();
  Navigator.pop(context);
  Navigator.pop(context);
  Navigator.pop(context);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return Login();
      },
    ),
  );
}
