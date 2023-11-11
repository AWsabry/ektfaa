import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/Components/Navigation/custom_navigate.dart';
import 'package:ektfaa/Screens/Auth/SignIn.dart';
import 'package:ektfaa/Screens/Auth/completeProfile.dart';
import 'package:ektfaa/Theme.dart';
import 'package:ektfaa/features/SignUp/sign_up_cubit.dart';
import 'package:ektfaa/features/Verification/verification_cubit.dart';
import 'package:ektfaa/features/Verification/verification_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool agree = false;

  // This function is triggered when the button is clicked

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationCubit, InitialVerificationState>(
        builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          body: Form(
            key: SignUpCubit.get(context).formkey,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        EktfaaConstants.registration,
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        EktfaaConstants.welcome,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.redAccent),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: SignUpCubit.get(context).emailController,
                        decoration: InputDecoration(
                          labelText: EktfaaConstants.email,
                          labelStyle: const TextStyle(color: AppColors.grey),
                          hintText: EktfaaConstants.emailHint,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.black,
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
                            return EktfaaConstants.emailHint;
                          }
                          // Check if the entered email has the right format
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return EktfaaConstants.emailValidation;
                          }
                          // Return null if the entered email is valid
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: SignUpCubit.get(context).passwordController,
                        obscureText: VerificationCubit.get(context).isPassword,
                        decoration: InputDecoration(
                          suffixIcon: VerificationCubit.get(context).isPassword
                              ? IconButton(
                                  onPressed: () {
                                    VerificationCubit.get(context)
                                        .showPassword(context);
                                  },
                                  icon: const Icon(Icons.visibility))
                              : IconButton(
                                  onPressed: () {
                                    VerificationCubit.get(context)
                                        .showPassword(context);
                                  },
                                  icon: const Icon(Icons.visibility_off)),
                          labelText: EktfaaConstants.password,
                          labelStyle: const TextStyle(color: AppColors.grey),
                          hintText: EktfaaConstants.passwordHint,
                          prefixIcon: const Icon(
                            Icons.lock_open_outlined,
                            color: Colors.black,
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
                            return EktfaaConstants.passwordHint;
                          }
                          if (SignUpCubit.get(context)
                                  .passwordController
                                  .text
                                  .length <
                              8) {
                            return EktfaaConstants.passwordValidation;
                          }
                          // Check if the entered email has the right format

                          // Return null if the entered email is valid
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText:
                            VerificationCubit.get(context).isConfirmPassword,
                        decoration: InputDecoration(
                          labelText: EktfaaConstants.confirmPassword,
                          labelStyle: const TextStyle(color: AppColors.grey),
                          hintText: EktfaaConstants.reEnterPassword,
                          suffixIcon:
                              VerificationCubit.get(context).isConfirmPassword
                                  ? IconButton(
                                      onPressed: () {
                                        VerificationCubit.get(context)
                                            .showConfirmPassword(context);
                                      },
                                      icon: const Icon(Icons.visibility))
                                  : IconButton(
                                      onPressed: () {
                                        VerificationCubit.get(context)
                                            .showConfirmPassword(context);
                                      },
                                      icon: const Icon(Icons.visibility_off)),
                          prefixIcon: const Icon(
                            Icons.lock_open_outlined,
                            color: Colors.black,
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
                            return EktfaaConstants.passwordHint;
                          }

                          if (value !=
                              SignUpCubit.get(context)
                                  .passwordController
                                  .text) {
                            return EktfaaConstants.confirmPasswordValidation;
                          }

                          // Return null if the entered email is valid
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 500,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (SignUpCubit.get(context)
                                .formkey
                                .currentState!
                                .validate()) {
                              pushScreen(
                                  context,
                                  CompleteProfile(
                                    email: SignUpCubit.get(context)
                                        .emailController
                                        .text,
                                    password: SignUpCubit.get(context)
                                        .passwordController
                                        .text,
                                  ));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.redAccent,
                          ),
                          child: Text(EktfaaConstants.signUp),
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
                            Text(
                              EktfaaConstants.alreadyHaveAnAccount,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignIn()));
                              },
                              child: Text(
                                " ${EktfaaConstants.signIn}",
                                style:
                                    const TextStyle(color: AppColors.redAccent),
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
        ),
      );
    });
  }
}
