import 'package:dartz/dartz.dart';
import 'package:notes_firebase_ddd/domain/core/failure.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  if (emailRegex.hasMatch(input)) {
    return Right(input);
  } else {
    return Left(ValueFailure.invalidEmail(filedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length >= 6) {
    return Right(input);
  } else {
    return Left(ValueFailure.shortPassword(filedValue: input));
  }
}
