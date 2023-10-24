import 'package:ektfaa/Auth/SignIn.dart';
import 'package:ektfaa/Theme.dart';
import 'package:ektfaa/features/SignUp/sign_up_cubit.dart';
import 'package:ektfaa/features/SignUp/sign_up_states.dart';
import 'package:ektfaa/features/Verification/verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({Key? key, required this.email, required this.password})
      : super(key: key);
  static String verify = "";
  static int? resendCode;
  final String email;
  final String password;

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  bool agree = false;

  // This function is triggered when the button is clicked

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, InitialSignUpState>(
        builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Registration",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Form(
            key: SignUpCubit.get(context).completeFormKey,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Let's Get Started",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.redAccent),
                      ),
                      const Text(
                        "Create an account to get all features",
                        style: TextStyle(color: AppColors.grey),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: SignUpCubit.get(context).firstName,
                        decoration: InputDecoration(
                          labelText: "First Name",
                          labelStyle: const TextStyle(color: AppColors.grey),
                          hintText: "Enter your First Name",
                          prefixIcon: const Icon(
                            Icons.person_outline,
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
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your name';
                          }
                          // Check if the entered email has the right format
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid name';
                          }
                          // Return null if the entered email is valid
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: SignUpCubit.get(context).lastName,
                        decoration: InputDecoration(
                          labelText: "last Name",
                          labelStyle: const TextStyle(color: AppColors.grey),
                          hintText: "Enter your last Name",
                          prefixIcon: const Icon(
                            Icons.person_outline,
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
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your name';
                          }
                          // Check if the entered email has the right format
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid name';
                          }
                          // Return null if the entered email is valid
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: SignUpCubit.get(context).countryName,
                        decoration: InputDecoration(
                          labelText: "Country",
                          labelStyle: const TextStyle(color: AppColors.grey),
                          hintText: "Enter your Country",
                          prefixIcon: const Icon(
                            Icons.person_outline,
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
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your name';
                          }
                          // Check if the entered email has the right format
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid name';
                          }
                          // Return null if the entered email is valid
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: SignUpCubit.get(context).city,
                        decoration: InputDecoration(
                          labelText: "City",
                          labelStyle: const TextStyle(color: AppColors.grey),
                          hintText: "Enter your City",
                          prefixIcon: const Icon(
                            Icons.person_outline,
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
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your name';
                          }
                          // Check if the entered email has the right format
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid name';
                          }
                          // Return null if the entered email is valid
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: SignUpCubit.get(context).phoneController,
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          labelStyle: const TextStyle(color: AppColors.grey),
                          hintText: "Enter your Phone Number",
                          prefixIcon: const Icon(
                            Icons.person_outline,
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
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your name';
                          }
                          // Check if the entered email has the right format
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid name';
                          }
                          // Return null if the entered email is valid
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: SignUpCubit.get(context).age,
                        decoration: InputDecoration(
                          labelText: "age",
                          labelStyle: const TextStyle(color: AppColors.grey),
                          hintText: "Enter your Age",
                          prefixIcon: const Icon(
                            Icons.person_outline,
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
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your name';
                          }
                          // Check if the entered email has the right format
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid name';
                          }
                          // Return null if the entered email is valid
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: SignUpCubit.get(context).gender,
                        decoration: InputDecoration(
                          labelText: "Gender",
                          labelStyle: const TextStyle(color: AppColors.grey),
                          hintText: "Enter your Gender",
                          prefixIcon: const Icon(
                            Icons.person_outline,
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
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your name';
                          }
                          // Check if the entered email has the right format
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid name';
                          }
                          // Return null if the entered email is valid
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: agree,
                            onChanged: (value) {
                              setState(() {
                                agree = value ?? false;
                              });
                            },
                          ),
                          const Text(
                            'Agree to our privacy & policy',
                            overflow: TextOverflow.ellipsis,
                          ),
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
                            if (agree == true) {
                              VerificationCubit.get(context).verification(
                                context,
                                firstName:
                                    SignUpCubit.get(context).firstName.text,
                                lastName:
                                    SignUpCubit.get(context).lastName.text,
                                email: widget.email,
                                password: widget.password,
                                countryName:
                                    SignUpCubit.get(context).countryName.text,
                                city: SignUpCubit.get(context).city.text,
                                age: SignUpCubit.get(context).age.text,
                                gender: SignUpCubit.get(context).gender.text,
                                countryCode:
                                    SignUpCubit.get(context).countryCode,
                                phoneNumber: SignUpCubit.get(context)
                                    .phoneController
                                    .text,
                              );
                            } else {
                              return;
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.redAccent,
                          ),
                          child: const Text("Sign Up"),
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
                                        builder: (context) => const SignIn()));
                              },
                              child: const Text(
                                " Sign In",
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
        ),
      );
    });
  }
}
