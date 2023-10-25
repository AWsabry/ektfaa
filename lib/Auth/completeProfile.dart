import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:ektfaa/Auth/SignIn.dart';
import 'package:ektfaa/Theme.dart';
import 'package:ektfaa/features/SignUp/sign_up_cubit.dart';
import 'package:ektfaa/features/SignUp/sign_up_states.dart';
import 'package:ektfaa/features/Verification/verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
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
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }

                          // Return null if the entered email is valid
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: SignUpCubit.get(context).countryName,
                        decoration: InputDecoration(
                          labelText: "Country",
                          labelStyle: const TextStyle(color: AppColors.grey),
                          hintText: "Enter your Country",
                          prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: InkWell(
                              onTap: () {
                                showCountryPicker(
                                  context: context,
                                  exclude: <String>['EG', 'EG'],
                                  favorite: <String>['EG'],
                                  showPhoneCode: false,
                                  onSelect: (Country country) {
                                    SignUpCubit.get(context).countryName.text =
                                        country.name;
                                  },
                                  countryListTheme: CountryListThemeData(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(40.0),
                                      topRight: Radius.circular(40.0),
                                    ),
                                    // Optional. Styles the search field.
                                    inputDecoration: InputDecoration(
                                      labelText: 'Search',
                                      hintText: 'Start typing to search',
                                      prefixIcon: const Icon(Icons.search),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xFF8C98A8)
                                              .withOpacity(0.2),
                                        ),
                                      ),
                                    ),
                                    // Optional. Styles the text in the search field
                                    searchTextStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
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
                            return 'Please choose your contry';
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
                            Icons.location_city,
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
                            return 'Please enter your city';
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
                            return 'Please enter your country';
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
                          if (value == null || value.isEmpty) {
                            return 'Please enter your age';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: SignUpCubit.get(context).gender,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: "Gender",
                          labelStyle: const TextStyle(color: AppColors.grey),
                          hintText: "Enter your Gender",
                          prefixIcon: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              underline: null,
                              alignment: Alignment.bottomRight,
                              items: <String>[
                                'Male',
                                'Female',
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: SizedBox(
                                    width: 40,
                                    child: Text(
                                      value,
                                      textScaleFactor: 1.0,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                SignUpCubit.get(context).gender.text =
                                    value.toString();
                              },
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
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
                            return 'Please enter your gender';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FormField(
                        validator: (value) {
                          if (SignUpCubit.get(context).agree == false) {
                            return 'You need to accept terms';
                          } else {
                            return null;
                          }
                        },
                        builder: (field) {
                          return InkWell(
                            onTap: () {
                              SignUpCubit.get(context)
                                  .agreePrivacyPolicy(context);
                            },
                            child: Row(
                              children: [
                                Checkbox(
                                  value: SignUpCubit.get(context).agree,
                                  onChanged: (value) {
                                    SignUpCubit.get(context)
                                        .agreePrivacyPolicy(context);
                                  },
                                ),
                                const Text(
                                  'Agree to our privacy & policy',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          );
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
                                .completeFormKey
                                .currentState!
                                .validate()) {
                              if (SignUpCubit.get(context).agree == true) {
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
                              }
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
