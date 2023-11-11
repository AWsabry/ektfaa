import 'package:dio/dio.dart';
import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/Components/Navigation/custom_navigate.dart';
import 'package:ektfaa/Screens/Auth/SignIn.dart';
import 'package:ektfaa/features/SignIn/sign_in_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

class SignInCubit extends Cubit<InitialSignInState> {
  SignInCubit() : super(SuperSignInState());
  static SignInCubit get(context) => BlocProvider.of(context);

  List userInformation = [];
  Future checkUserByPhone(String phoneNumber) async {
    emit(LoadingInformation());
    await Dio()
        .get('${EktfaaConstants.BaseUrl}/get_user_by_phone/$phoneNumber')
        .then((value) async {
      print(userInformation);
      userInformation = value.data["Names"];
      emit(GetUserInformationSuccessfully());
    }).catchError((error) {
      emit(GetUserInformationFailed(error: error.toString()));
    });
  }

  Future<void> signOut(context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    pushAndRemoved(context, const SignIn());
  }

  bool isClicked = false;
  clicked() {
    isClicked = !isClicked;
    emit(IsClickedSuccessfully());
  }

  closeClicked() {
    isClicked = false;
    emit(CloseIsClickedSuccessfully());
  }

  String phone = "";
  getPhoneFromSignInCubit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    phone = sharedPreferences.getString("PhoneNumber")!;
    emit(GetPhoneSharedPreferenceSuccessfully());
  }
}
