import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/Components/Navigation/custom_navigate.dart';
import 'package:ektfaa/Presentations/SignUp/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      color: Colors.white,
                      height: size.height / 2.52,
                      width: size.width,
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage(EktfaaConstants.signUpImage),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height / 3),
                      child: Container(
                        height: size.height / 1.62,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height /
                          2.6, // Adjust the positioning of the text
                      left: size.width / 10,
                      right: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            EktfaaConstants.signInAccount,
                            style: GoogleFonts.openSans(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            EktfaaConstants.signInToContinue,
                            style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[350]),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            EktfaaConstants.email,
                            style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(right: 25.0),
                            child: SizedBox(
                              child: TextFormField(
                                controller: emailController,
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
                          ),
                          const SizedBox(height: 10),
                          Text(
                            EktfaaConstants.password,
                            style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(right: 25.0),
                            child: SizedBox(
                              child: TextFormField(
                                controller: passwordController,
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
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(right: 25.0),
                            child: InkWell(
                              onTap: () {
                                if (formkey.currentState!.validate()) {}
                              },
                              child: Container(
                                height: 55,
                                decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child: Center(
                                  child: Text(
                                    EktfaaConstants.signIn,
                                    style: GoogleFonts.openSans(
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 7),
                          Center(
                            child: InkWell(
                              onTap: () {
                                push(context, SignUp());
                              },
                              child: Text(
                                EktfaaConstants.didntHaveAnAccount,
                                style: GoogleFonts.openSans(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
