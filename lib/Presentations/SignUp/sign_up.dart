import 'package:country_code_picker/country_code_picker.dart';
import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/Components/Navigation/custom_navigate.dart';
import 'package:ektfaa/Features/SignUp/signUp_cubit.dart';
import 'package:ektfaa/Features/SignUp/signUp_state.dart';
import 'package:ektfaa/Presentations/SignIn/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  static String verify = "";
  static int? resendCode;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<SignUpCubit, InitialSignUpState>(
        builder: (context, state) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: SignUpCubit.get(context).formkey,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width,
                    height: 180,
                    child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage(EktfaaConstants.signUpImage),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          EktfaaConstants.createAnAccount,
                          style: GoogleFonts.openSans(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          EktfaaConstants.signUpToContinue,
                          style: GoogleFonts.openSans(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[350]),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          EktfaaConstants.name,
                          style: GoogleFonts.openSans(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: SizedBox(
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              controller:
                                  SignUpCubit.get(context).nameController,
                              validator: (value) {
                                if (value!.isEmpty || value == "") {
                                  return "Your Name Cannot Be Empty";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4))),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          EktfaaConstants.phone,
                          style: GoogleFonts.openSans(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: TextFormField(
                            controller:
                                SignUpCubit.get(context).phoneController,
                            keyboardType: TextInputType.phone,
                            validator: (value) => value!.isEmpty
                                ? "Your Phone Cannot Be Empty"
                                : null,
                            decoration: InputDecoration(
                              prefixIconColor: Colors.black,
                              prefixIcon: CountryCodePicker(
                                textStyle: GoogleFonts.inter(
                                    color: Colors.black,
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
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: -5.0, horizontal: 1.0),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          EktfaaConstants.email,
                          style: GoogleFonts.openSans(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: TextFormField(
                            controller:
                                SignUpCubit.get(context).emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) => value!.isEmpty
                                ? "Your Email Cannot Be Empty"
                                : null,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          EktfaaConstants.password,
                          style: GoogleFonts.openSans(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: TextFormField(
                            controller:
                                SignUpCubit.get(context).passwordController,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) => value!.isEmpty
                                ? "Your Password Cannot Be Empty"
                                : null,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: InkWell(
                            onTap: () {
                              if (SignUpCubit.get(context)
                                  .formkey
                                  .currentState!
                                  .validate()) {}
                            },
                            child: Container(
                              height: 55,
                              decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Center(
                                child: Text(
                                  EktfaaConstants.getStarted,
                                  style: GoogleFonts.openSans(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: InkWell(
                            onTap: () {
                              push(context, SignIn());
                            },
                            child: Text(
                              EktfaaConstants.alreadyHaveAnAccount,
                              style: GoogleFonts.openSans(fontSize: 14),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
