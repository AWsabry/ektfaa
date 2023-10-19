import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/Features/SignUp/signUp_cubit.dart';
import 'package:ektfaa/Features/Verification/verification_cubit.dart';
import 'package:ektfaa/Presentations/Verification/verification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class Verification extends StatelessWidget {
  const Verification(
      {super.key,
      required this.userEmail,
      required this.userPassword,
      required this.countryCode,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber});
  final String userEmail;
  final String userPassword;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String countryCode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationCubit, InitialVerificationState>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 16, right: 16),
            child: Column(
              children: [
                Text(EktfaaConstants.phoneVerification,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        color: Colors.white)),
                const SizedBox(height: 16),
                Text(EktfaaConstants.sentCode,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.grey)),
                const SizedBox(height: 8),
                const SizedBox(height: 23),
                Pinput(
                  controller: VerificationCubit.get(context).pinPutController,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  length: 6,
                  onCompleted: (value) {
                    VerificationCubit.get(context).checkOtp(
                        context,
                        VerificationCubit.get(context).pinPutController.text,
                        SignUpCubit.get(context).emailController.text,
                        SignUpCubit.get(context).passwordController.text,
                        SignUpCubit.get(context).countryCode,
                        SignUpCubit.get(context).phoneController.text);
                  },
                  animationCurve: Curves.easeOut,
                  focusedPinTheme: PinTheme(
                      width: 62.55,
                      height: 62.55,
                      textStyle: GoogleFonts.poppins(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(9.6)))),
                  defaultPinTheme: PinTheme(
                      width: 62.55,
                      height: 62.55,
                      textStyle: GoogleFonts.poppins(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(9.6)))),
                ),
                const SizedBox(height: 23),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      EktfaaConstants.dontReceiveCode,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.grey),
                    ),
                    InkWell(
                      onTap: () {
                        VerificationCubit.get(context).reSendOtp(
                          SignUpCubit.get(context).countryCode,
                          SignUpCubit.get(context).phoneController.text,
                          context,
                        );
                      },
                      child: Text(
                        EktfaaConstants.resend,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
