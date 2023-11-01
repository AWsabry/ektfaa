import 'package:dio/dio.dart';
import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/Components/Navigation/custom_navigate.dart';
import 'package:ektfaa/Screens/DashBoard.dart';
import 'package:ektfaa/features/SignUp/sign_up_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:nb_utils/nb_utils.dart';

class SignUpCubit extends Cubit<InitialSignUpState> {
  SignUpCubit() : super(SuperSignUpState());
  static SignUpCubit get(context) => BlocProvider.of(context);
  // SignUp Data
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late final countryName = TextEditingController();
  final city = TextEditingController();
  final age = TextEditingController();
  final gender = TextEditingController();
  final phoneController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final completeFormKey = GlobalKey<FormState>();
  bool agree = false;
  agreePrivacyPolicy(context) {
    agree = !agree;
    emit(AgreePolicySuccessfully());
  }

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
    required String? phoneNumber,
  }) async {
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
          "PhoneNumber": countryCode + phoneNumber!,
        },
      );
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("PhoneNumber", countryCode + phoneNumber);
      Logger().i(countryCode + phoneNumber);
      emit(UserSignedUpSuccessfully());
      pushAndRemoved(context, const DashBoard());
    } catch (error) {
      print('%ara');
      print(error);
    }
  }

  String phoneFromSharedPreference = "";
  getPhoneFromSharedPreference() async {
    print(phoneFromSharedPreference);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    phoneFromSharedPreference = sharedPreferences.getString("PhoneNumber")!;
    emit(GetEmailFromSharedPreferenceSuccessfully());
  }
}
