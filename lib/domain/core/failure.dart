import 'package:freezed_annotation/freezed_annotation.dart';
part 'failure.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    required String filedValue,
  }) = InvalidEmail<T>;

  const factory ValueFailure.shortPassword({
    required String filedValue,
  }) = ShortPassword<T>;
}
