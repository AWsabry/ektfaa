import 'package:country_code_picker/country_code_picker.dart';
import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/Components/Navigation/custom_navigate.dart';
import 'package:ektfaa/Screens/Auth/SignUp.dart';
import 'package:ektfaa/Screens/DashBoard.dart';
import 'package:ektfaa/features/SignIn/sign_in_cubit.dart';
import 'package:ektfaa/features/SignIn/sign_in_states.dart';
import 'package:ektfaa/features/SignUp/sign_up_cubit.dart';
import 'package:ektfaa/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Theme.dart';

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
                      keyboardType: TextInputType.phone,
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
                          return EktfaaConstants.phoneNumberHint;
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
                        child: SignInCubit.get(context).isClicked == false
                            ? ElevatedButton(
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    SignInCubit.get(context).clicked();

                                    String phoneNumber =
                                        SignUpCubit.get(context)
                                            .phoneController
                                            .text;
                                    if (phoneNumber.startsWith('0')) {
                                      phoneNumber = phoneNumber.substring(1);
                                    }
                                    SignUpCubit.get(context)
                                        .phoneController
                                        .text = phoneNumber;

                                    SignInCubit.get(context)
                                        .checkUserByPhone(
                                            SignUpCubit.get(context)
                                                    .countryCode +
                                                SignUpCubit.get(context)
                                                    .phoneController
                                                    .text)
                                        .then((value) async {
                                      if (SignInCubit.get(context)
                                          .userInformation
                                          .isNotEmpty) {
                                        SharedPreferences sharedPreferences =
                                            await SharedPreferences
                                                .getInstance();
                                        sharedPreferences.setString(
                                            "PhoneNumber",
                                            SignUpCubit.get(context)
                                                    .countryCode +
                                                SignUpCubit.get(context)
                                                    .phoneController
                                                    .text);
                                        Logger().i(SignUpCubit.get(context)
                                                .countryCode +
                                            SignUpCubit.get(context)
                                                .phoneController
                                                .text);
                                        pushAndRemoved(
                                            context,
                                            DashBoard(
                                              selectedIndex: 0,
                                            ));
                                      } else {
                                        SignInCubit.get(context).clicked();

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              "This Phone Number Isn't registered yet",
                                              style: GoogleFonts.poppins(),
                                            ),
                                          ),
                                        );
                                      }
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.redAccent,
                                ),
                                child: const Text("Sign In"),
                              )
                            : const Center(
                                child: Loading(),
                              )),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            EktfaaConstants.didntHaveAnAccount,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()));
                            },
                            child: Text(
                              EktfaaConstants.signUp,
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
      );
    });
  }
}
