//
// ignore_for_file: public_member_api_docs, sort_constructors_first
/*
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed/builder.dart' as freezed;


class EmailAddress {
  final String value;
  final Either<Left, Right> failure;

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  @override
  String toString() => 'EmailAddress(value: $value)';

  const EmailAddress._(this.value, this.failure);

  @override
  bool operator ==(covariant EmailAddress other) {
    if (identical(this, other)) return true;

    return other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

String validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return input;
  } else {
    throw InvalidEmailFailure(failedValue: input);
  }
}

@freezed

abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    required String failedValue,
  }) = InvalidEmail<T>;
}

class InvalidEmailFailure {
  final String failedValue;

  InvalidEmailFailure({required this.failedValue});
}
*/