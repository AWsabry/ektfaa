abstract class InitialSignUpState {}

class SuperSignUpState extends InitialSignUpState {}

class SignUpSuccessfull extends SuperSignUpState {
  SignUpSuccessfull();
}

class SignUpFailed extends SuperSignUpState {
  final String error;

  SignUpFailed({required this.error});
}

class ChangeCountryCodeSuccessfully extends SuperSignUpState {}

class AgreePolicySuccessfully extends SuperSignUpState {}

class UserSignedUpSuccessfully extends SuperSignUpState {}

class GetEmailFromSharedPreferenceSuccessfully extends SuperSignUpState {}
