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
    on<SignInFormEvent>((event, emit) async {
      event.map(
        emailChanged: (value) {},
        passwordChanged: (value) {},
        registerWithEmailAndPasswordPressed: (value) {},
        signINWithEmailAndPasswordPressed: (value) {},
        signInWithEmailAndPasswordPressed: (value) {},
      );
    });
  }
}
