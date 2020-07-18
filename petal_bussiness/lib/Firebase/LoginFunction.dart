import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petal_bussiness/Provider/LoginProvider.dart';
import 'package:provider/provider.dart';

void verifyPhoneNumber(String phone, BuildContext context) async {
  final provider = Provider.of<LoginProvider>(context, listen: false);
  var _verificationId;
  print(phone);

  final PhoneVerificationCompleted verificationCompleted =
      (AuthCredential phoneAuthCredential) {};

  final PhoneVerificationFailed verificationFailed =
      (AuthException authException) {};

  final PhoneCodeSent codeSent =
      (String verificationId, [int forceResendingToken]) async {
    _verificationId = verificationId;
    print("Code sent");
    print("Verification ID: " + verificationId);
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

Future<bool> signInWithPhoneNumber(
    String otp, String verificationId, BuildContext context) async {
  try {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: otp,
    );
    AuthResult authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
    final FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    assert(user.uid == currentUser.uid);
    if (user != null) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print(e);
    print('Failed');
    return false;
  }
}

Future<FirebaseUser> getUser() async {
  FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
  return firebaseUser;
}
