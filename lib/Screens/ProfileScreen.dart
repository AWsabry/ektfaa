import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/Components/Navigation/custom_navigate.dart';
import 'package:ektfaa/Screens/userUploaded.dart';
import 'package:ektfaa/features/SignIn/sign_in_cubit.dart';
import 'package:ektfaa/features/SignIn/sign_in_states.dart';
import 'package:ektfaa/features/SignUp/sign_up_cubit.dart';
import 'package:ektfaa/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List data = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    await SignUpCubit.get(context).getPhoneFromSharedPreference();
    await SignInCubit.get(context)
        .checkUserByPhone(SignUpCubit.get(context).phoneFromSharedPreference);

    data = SignInCubit.get(context).userInformation;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, InitialSignInState>(
        builder: (context, state) {
      data = SignInCubit.get(context).userInformation;

      return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false, // Remove the back icon
            title: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                EktfaaConstants.profileTitle,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 0,
          ),
          body: data.isNotEmpty
              ? SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 08.0, left: 25, right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        const Center(
                          child: Image(
                            image: AssetImage("assets/Images/1.png"),
                            height: 150,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Hello ',
                            style: DefaultTextStyle.of(context)
                                .style, // Default text style
                            children: <TextSpan>[
                              const TextSpan(
                                text: 'World',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent,
                                ),
                              ),
                              const TextSpan(
                                text: '!\n\n\n',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.deepPurpleAccent,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "I'm ${data[0]['first_name']} ${data[0]['last_name']}, I'm currently located in ${data[0]['Country']}, specifically in ${data[0]['city']}, there are only two genders & I'm proudly ${data[0]['gender']}, you can reach me on ${data[0]['PhoneNumber']}.\n\n",
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              const TextSpan(
                                text: 'Let\'s have our ',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              const TextSpan(
                                text: 'Ektfaa.\n\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent,
                                ),
                              ),
                              const TextSpan(
                                text: 'Regards, \n',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: data[0]['first_name'],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 15,
                        ),
                        // InkWell(
                        //   onTap: () {},
                        //   child: Container(
                        //     width: double.infinity, // Full width of the screen
                        //     padding: const EdgeInsets.all(10.0),
                        //     color: Colors
                        //         .transparent, // Change the background color as needed

                        //     child: const Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: <Widget>[
                        //         Text(
                        //           'Your Wishlist', // Text at the start
                        //           style: TextStyle(
                        //               color: Colors.black, // Text color
                        //               fontSize: 16.0,
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //         Icon(
                        //           Icons
                        //               .arrow_forward_ios_sharp, // Arrow icon at the end
                        //           color: Colors.black, // Icon color
                        //           size: 15.0, // Icon size
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        InkWell(
                          onTap: () {
                            push(context, const UserUploadedProducts());
                          },
                          child: Container(
                            width: double.infinity, // Full width of the screen
                            padding: const EdgeInsets.all(10.0),
                            color: Colors
                                .transparent, // Change the background color as needed

                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Your Uploaded Products "Soon" ', // Text at the start
                                  style: TextStyle(
                                      color: Colors.black, // Text color
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons
                                      .arrow_forward_ios_sharp, // Arrow icon at the end
                                  color: Colors.black, // Icon color
                                  size: 15.0, // Icon size
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: double.infinity, // Full width of the screen
                            padding: const EdgeInsets.all(10.0),
                            color: Colors
                                .transparent, // Change the background color as needed

                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Settings "Soon" ', // Text at the start
                                  style: TextStyle(
                                      color: Colors.black, // Text color
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons
                                      .arrow_forward_ios_sharp, // Arrow icon at the end
                                  color: Colors.black, // Icon color
                                  size: 15.0, // Icon size
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            SignInCubit.get(context).closeClicked();
                            SignInCubit.get(context).signOut(context);
                          },
                          child: Container(
                            width: double.infinity, // Full width of the screen
                            padding: const EdgeInsets.all(10.0),
                            color: Colors
                                .transparent, // Change the background color as needed

                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Logout', // Text at the start
                                  style: TextStyle(
                                      color: Colors.black, // Text color
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons
                                      .arrow_forward_ios_sharp, // Arrow icon at the end
                                  color: Colors.black, // Icon color
                                  size: 15.0, // Icon size
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                )
              : const Center(
                  child: Loading(),
                ));
    });
  }
}
