import 'package:country_code_picker/country_code_picker.dart';
import 'package:ektfaa/Auth/SignUp.dart';
import 'package:ektfaa/features/SignIn/sign_in_cubit.dart';
import 'package:ektfaa/features/SignIn/sign_in_states.dart';
import 'package:ektfaa/features/SignUp/sign_up_cubit.dart';
import 'package:ektfaa/features/Verification/verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Theme.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, InitialSignInState>(
        builder: (context, state) {
      // var userInformation=SignInCubit
      return Scaffold(
        body: Form(
          key: formkey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Image(
                        image: AssetImage("assets/Images/1.png"),
                        height: 400,
                      ),
                    ),
                    TextFormField(
                      controller: SignUpCubit.get(context).phoneController,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        labelStyle: const TextStyle(color: AppColors.grey),
                        hintText: "Enter your Phone Number",
                        prefixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: CountryCodePicker(
                            textStyle: GoogleFonts.inter(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            onChanged: (value) {
                              SignUpCubit.get(context)
                                  .getCountryCode(value.toString());
                            },
                            initialSelection: 'EG',
                            favorite: const ['+20', 'EG'],
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: AppColors.redAccent),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone';
                        }

                        // Return null if the entered email is valid
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Text(
                        //   "Forgot password ?",
                        //   style: TextStyle(color: AppColors.grey),
                        // ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 500,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            // SignUpCubit.get(context)
                            VerificationCubit.get(context).sendSignInOtp(
                                context,
                                SignUpCubit.get(context).countryCode,
                                SignUpCubit.get(context).phoneController.text);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.redAccent,
                        ),
                        child: const Text("Sign In"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()));
                            },
                            child: const Text(
                              " Sign Up",
                              style: TextStyle(color: AppColors.redAccent),
                            ),
                          ),
                        ],
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
