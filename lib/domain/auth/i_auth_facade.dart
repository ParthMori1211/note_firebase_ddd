import 'package:dartz/dartz.dart';
import 'package:notes_firebase_ddd/domain/auth/auth_failure.dart';
import 'package:notes_firebase_ddd/domain/auth/value_objects.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
