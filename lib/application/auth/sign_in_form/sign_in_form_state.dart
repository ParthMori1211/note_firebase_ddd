part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required EmailAddress emailAddress,
    required Password password,
    required bool isSubmiting,
    required bool showErrorMessages,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInFormState;

  factory SignInFormState.inital() => SignInFormState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        isSubmiting: false,
        showErrorMessages: false,
        authFailureOrSuccessOption: none(),
      );
}
