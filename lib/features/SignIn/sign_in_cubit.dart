import 'package:dio/dio.dart';
import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/features/SignIn/sign_in_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

class SignInCubit extends Cubit<InitialSignInState> {
  SignInCubit() : super(SuperSignInState());
  static SignInCubit get(context) => BlocProvider.of(context);

  List userInformation = [];
  Future<void> checkUserByPhone(String phoneNumber) async {
    await Dio()
        .get('${EktfaaConstants.BaseUrl}/get_user_by_phone/$phoneNumber')
        .then((value) async {
      userInformation = value.data["Names"];
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("PhoneNumber", phoneNumber);
      Future.delayed(const Duration(milliseconds: 800)).then(
        (value) {
          print("WALAAA$phoneNumber");
          emit(GetUserInformationSuccessfully());
        },
      );
    });
  }

  bool isClicked = false;
  clicked() {
    isClicked = !isClicked;
    emit(IsClickedSuccessfully());
  }
}
