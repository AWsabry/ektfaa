import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/Components/Navigation/custom_navigate.dart';
import 'package:ektfaa/Presentations/SignIn/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
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
                      color: Colors.deepOrange[900],
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
                              height: 43,
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                controller: nameController,
                                validator: (value) => value!.isEmpty
                                    ? "Your Name Cannot Be Empty"
                                    : null,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4))),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4))),
                                    labelStyle: GoogleFonts.inter(
                                        color: Colors.grey,
                                        fontSize: 0,
                                        fontWeight: FontWeight.w400)),
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
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(right: 25.0),
                            child: SizedBox(
                              height: 43,
                              child: TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) => value!.isEmpty
                                    ? "Your Email Cannot Be Empty"
                                    : null,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4))),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4))),
                                    labelStyle: GoogleFonts.inter(
                                        color: Colors.grey,
                                        fontSize: 0,
                                        fontWeight: FontWeight.w400)),
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
                              height: 43,
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) => value!.isEmpty
                                    ? "Your Password Cannot Be Empty"
                                    : null,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4))),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4))),
                                    labelStyle: GoogleFonts.inter(
                                        color: Colors.grey,
                                        fontSize: 0,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(right: 25.0),
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
                          const SizedBox(height: 7),
                          Center(
                            child: InkWell(
                              onTap: () {
                                push(context, SignIn());
                              },
                              child: Text(
                                EktfaaConstants.alreadyHaveAnAccount,
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
