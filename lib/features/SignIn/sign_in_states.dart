abstract class InitialSignInState {}

class SuperSignInState extends InitialSignInState {}

class GetUserInformationSuccessfully extends SuperSignInState {}

class IsClickedSuccessfully extends SuperSignInState {}

class CloseIsClickedSuccessfully extends SuperSignInState {}

class GetPhoneSharedPreferenceSuccessfully extends SuperSignInState {}

class LoadingInformation extends SuperSignInState {}

class GetUserInformationFailed extends InitialSignInState {
  final String error;

  GetUserInformationFailed({required this.error});
}
