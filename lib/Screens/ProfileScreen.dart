import 'package:ektfaa/features/SignIn/sign_in_cubit.dart';
import 'package:ektfaa/features/SignIn/sign_in_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, InitialSignInState>(
        builder: (context, state) {
      List data = SignInCubit.get(context).userInformation;
      print(data);
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Remove the back icon
          title: const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Profile Screen",
              style: TextStyle(color: Colors.black),
            ),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app), // Use the sign-out icon
              onPressed: () {
                SignInCubit.get(context).closeClicked();
                SignInCubit.get(context).signOut(context);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 08.0, left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 35,
                ),
                const Center(
                  child: Image(
                    image: AssetImage("assets/Images/arab.png"),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Hello, ',
                    style: DefaultTextStyle.of(context)
                        .style, // Default text style
                    children: <TextSpan>[
                      const TextSpan(
                        text: 'Arab world',
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
                        text: 'Lets have our ',
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
                      const TextSpan(
                        text: 'Arabian',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
