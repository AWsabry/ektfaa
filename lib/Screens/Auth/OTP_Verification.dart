import 'package:ektfaa/Theme.dart';
import 'package:ektfaa/features/SignUp/sign_up_cubit.dart';
import 'package:ektfaa/features/Verification/verification_cubit.dart';
import 'package:ektfaa/features/Verification/verification_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OTP_Verification extends StatefulWidget {
  OTP_Verification(
      {Key? key,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.age,
      this.countryName,
      this.gender,
      this.city,
      this.phoneNumber,
      this.isSignedIn = false})
      : super(key: key);
  bool? isSignedIn;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? countryName;
  final String? age;
  final String? gender;
  final String? city;
  final String? phoneNumber;

  @override
  State<OTP_Verification> createState() => _OTP_VerificationState();
}

class _OTP_VerificationState extends State<OTP_Verification> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationCubit, InitialVerificationState>(
        builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.black, //change your color here
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Center(
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage("assets/Images/arab.png"),
                    ),
                    const Text(
                      "Enter Code",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "*  *  *  *  *",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      " 6 digit verification code ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Pinput(
                      controller:
                          VerificationCubit.get(context).pinPutController,
                      length: 6,
                      onCompleted: (value) {
                        if (widget.isSignedIn == true) {
                          VerificationCubit.get(context).signInOtp(
                              context,
                              VerificationCubit.get(context)
                                  .pinPutController
                                  .text);
                        } else {
                          VerificationCubit.get(context).checkOtp(
                            context,
                            VerificationCubit.get(context)
                                .pinPutController
                                .text,
                          );
                        }
                      },
                      animationCurve: Curves.easeOut,
                      androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.smsRetrieverApi,
                      focusedPinTheme: PinTheme(
                          height: 62,
                          width: 62,
                          textStyle: GoogleFonts.poppins(
                              fontSize: 23,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(9.6)))),
                      defaultPinTheme: PinTheme(
                          height: 62,
                          width: 62,
                          textStyle: GoogleFonts.poppins(
                              fontSize: 23,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.grey),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(9.6)))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Did not receive the code?",
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        VerificationCubit.get(context).reSendOtp(
                          SignUpCubit.get(context).countryCode,
                          SignUpCubit.get(context).phoneController.text,
                          context,
                        );
                      },
                      child: const Text(
                        "Re-Send",
                        style: TextStyle(
                            color: AppColors.redAccent,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
