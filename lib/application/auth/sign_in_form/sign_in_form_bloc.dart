import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_firebase_ddd/domain/auth/auth_failure.dart';
import 'package:notes_firebase_ddd/domain/auth/i_auth_facade.dart';
import 'package:notes_firebase_ddd/domain/auth/value_objects.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_event.dart';
part 'sign_in_form_bloc.freezed.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;
  SignInFormBloc(
    this._authFacade,
  ) : super(SignInFormState.inital()) {
    on<SignInFormEvent>(
      (event, emit) async {
        event.map(
          emailChanged: (value) async {
            state.copyWith(
              emailAddress: EmailAddress(value.email),
              authFailureOrSuccessOption: none(),
            );
          },
          passwordChanged: (value) {
            state.copyWith(
              password: Password(value.password),
              authFailureOrSuccessOption: none(),
            );
            // state.copyWith(password: Password(value))
          },
          registerWithEmailAndPasswordPressed: (value) async {
            await _performActionOnAuthFacadeWithEmailAndPassword(
              _authFacade.registerWithEmailPassword,
            );
          },
          signInWithEmailAndPasswordPressed: (value) async {
            await _performActionOnAuthFacadeWithEmailAndPassword(
              _authFacade.signInWithEmailPassword,
            );
          },
          signInWithGoogleButtonPressed: (value) async {
            state.copyWith(
              isSubmiting: true,
              authFailureOrSuccessOption: none(),
            );
            final failureOrSucess = await _authFacade.signInWithGoogle();
            state.copyWith(
              isSubmiting: false,
              authFailureOrSuccessOption: some(failureOrSucess),
            );
          },
        );
      },
    );
  }

  _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function({
      required EmailAddress emailAddress,
      required Password password,
    }) forwardCall,
  ) async {
    Either<AuthFailure, Unit>? failureOrSucess;

    if (state.emailAddress.isValid() && state.password.isValid()) {
      state.copyWith(
        isSubmiting: true,
        authFailureOrSuccessOption: none(),
      );
      failureOrSucess = await forwardCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }
    state.copyWith(
      showErrorMessages: true,
      isSubmiting: false,
      authFailureOrSuccessOption: optionOf(failureOrSucess),
    );
  }
}
