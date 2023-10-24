import 'package:dio/dio.dart';
import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/Components/Navigation/custom_navigate.dart';
import 'package:ektfaa/Screens/HomeScreen.dart';
import 'package:ektfaa/features/SignUp/sign_up_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<InitialSignUpState> {
  SignUpCubit() : super(SuperSignUpState());
  static SignUpCubit get(context) => BlocProvider.of(context);
  // SignUp Data
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final countryName = TextEditingController();
  final city = TextEditingController();
  final age = TextEditingController();
  final gender = TextEditingController();
  final phoneController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final completeFormKey = GlobalKey<FormState>();
  String countryCode = "+20";

  void getCountryCode(String code) {
    countryCode = code;
    emit(ChangeCountryCodeSuccessfully());
  }

  Future<void> createUser(
    context, {
    required String? firstName,
    required String? lastName,
    required String? email,
    required String? password,
    required String? countryName,
    required String? city,
    required String? age,
    required String? gender,
    required String? PhoneNumber,
  }) async {
    print(firstName);
    print(lastName);
    print(email);
    print(countryName);
    print(password);
    print(age);
    print(city);
    print(gender);
    print(PhoneNumber);

    try {
      await Dio().post(
        "${EktfaaConstants.BaseUrl}/create_users_API/",
        data: {
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "password": password,
          "Country": countryName,
          "city": city,
          "age": age,
          "gender": gender,
          "PhoneNumber": PhoneNumber,
        },
      );
      pushAndRemoved(context, HomeScreen());
    } catch (error) {
      print('%ara');
      print(error);
    }
  }
}
