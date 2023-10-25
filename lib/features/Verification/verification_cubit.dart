import 'dart:async';

import 'package:ektfaa/Auth/OTP_Verification.dart';
import 'package:ektfaa/Auth/completeProfile.dart';
import 'package:ektfaa/Components/Navigation/custom_navigate.dart';
import 'package:ektfaa/Screens/HomeScreen.dart';
import 'package:ektfaa/features/SignUp/sign_up_cubit.dart';
import 'package:ektfaa/features/Verification/verification_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationCubit extends Cubit<InitialVerificationState> {
  VerificationCubit() : super(SuperVerificationState());
  static VerificationCubit get(context) => BlocProvider.of(context);
  final pinPutController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final String wrongOtpMessage = "This OTP isn't correct";
  Future<void> reSendOtp(
    String countryCode,
    String phoneNumber,
    context,
  ) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: countryCode + phoneNumber,
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
          verificationFailed: (FirebaseAuthException error) {},
          codeSent: (String verificationId, int? resendCode) {
            CompleteProfile.verify = verificationId;
            CompleteProfile.resendCode = resendCode;
          },
          forceResendingToken: CompleteProfile.resendCode,
          timeout: const Duration(seconds: 59),
          codeAutoRetrievalTimeout: (String verificationId) {
            verificationId = CompleteProfile.verify;
          });
    } on FirebaseAuthException catch (error) {
      emit(VerificationFailed(errpr: error.toString()));
    }
  }

  Future<void> verification(
    context, {
    required String? firstName,
    required String? lastName,
    required String? email,
    required String? password,
    required String? countryName,
    required String? city,
    required String? age,
    required String? gender,
    required String countryCode,
    required String phoneNumber,
  }) async {
    try {
      await FirebaseAuth.instance
          .verifyPhoneNumber(
              phoneNumber: countryCode + phoneNumber,
              verificationCompleted:
                  (PhoneAuthCredential phoneAuthCredential) {},
              verificationFailed: (FirebaseAuthException error) {},
              codeSent: (String verificationId, int? resendCode) {
                CompleteProfile.verify = verificationId;
                CompleteProfile.resendCode = resendCode;
              },
              forceResendingToken: CompleteProfile.resendCode,
              timeout: const Duration(seconds: 59),
              codeAutoRetrievalTimeout: (String verificationId) {
                verificationId = CompleteProfile.verify;
              })
          .then((value) {
        pushAndRemoved(
          context,
          OTP_Verification(
              firstName: firstName,
              lastName: lastName,
              email: email,
              password: password,
              age: age,
              countryName: countryName,
              gender: gender,
              city: city,
              phoneNumber: phoneNumber),
        );
        emit(VerificationSuccessfull());
      });
    } on FirebaseAuthException catch (error) {
      emit(VerificationFailed(errpr: error.toString()));
    }
  }

  Future<void> checkOtp(
    context,
    String smsCode,
  ) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: CompleteProfile.verify, smsCode: smsCode);
      await auth.signInWithCredential(credential);

      SignUpCubit.get(context).createUser(
        context,
        firstName: SignUpCubit.get(context).firstName.text,
        lastName: SignUpCubit.get(context).lastName.text,
        email: SignUpCubit.get(context).emailController.text,
        password: SignUpCubit.get(context).passwordController.text,
        countryName: SignUpCubit.get(context).countryName.text,
        city: SignUpCubit.get(context).city.text,
        age: SignUpCubit.get(context).age.text,
        gender: SignUpCubit.get(context).gender.text,
        PhoneNumber: SignUpCubit.get(context).phoneController.text,
      );
      emit(CheckOtpSuccessfull());
    } on FirebaseAuthException {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          wrongOtpMessage,
          style: GoogleFonts.poppins(
              fontSize: 14.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<void> sendSignInOtp(
      context, String countryCode, String phoneNumber) async {
    try {
      await FirebaseAuth.instance
          .verifyPhoneNumber(
              phoneNumber: countryCode + phoneNumber,
              verificationCompleted:
                  (PhoneAuthCredential phoneAuthCredential) {},
              verificationFailed: (FirebaseAuthException error) {},
              codeSent: (String verificationId, int? resendCode) {
                CompleteProfile.verify = verificationId;
                CompleteProfile.resendCode = resendCode;
              },
              forceResendingToken: CompleteProfile.resendCode,
              timeout: const Duration(seconds: 59),
              codeAutoRetrievalTimeout: (String verificationId) {
                verificationId = CompleteProfile.verify;
              })
          .then((value) {
        pushAndRemoved(
          context,
          OTP_Verification(
            isSignedIn: true,
          ),
        );
        emit(VerificationSuccessfull());
      });
    } on FirebaseAuthException catch (error) {
      emit(VerificationFailed(errpr: error.toString()));
    }
  }

  Future<void> signInOtp(
    context,
    String smsCode,
  ) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: CompleteProfile.verify, smsCode: smsCode);
      await auth.signInWithCredential(credential);
      pushAndRemoved(context, HomeScreen());
      emit(CheckOtpSuccessfull());
    } on FirebaseAuthException {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          wrongOtpMessage,
          style: GoogleFonts.poppins(
              fontSize: 14.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.red,
      ));
    }
  }
}
