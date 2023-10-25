import 'package:dio/dio.dart';
import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/features/SignIn/sign_in_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<InitialSignInState> {
  SignInCubit() : super(SuperSignInState());

  List userInformation = [];
  checkUserByPhone(String phoneNumber) {
    Dio()
        .get('${EktfaaConstants.BaseUrl}/get_user_by_phone/$phoneNumber')
        .then((value) {
      userInformation = value.data["Names"];
      emit(GetUserInformationSuccessfully());
    });
  }
}
