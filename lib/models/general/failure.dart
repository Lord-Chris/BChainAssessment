import 'package:equatable/equatable.dart';

abstract class IFailure extends Equatable {
  final String message;
  final dynamic data;

  const IFailure({
    required this.message,
    this.data,
  });

  static bool isValidationFailure(Map<String, dynamic> errorBody) {
    if (errorBody['message'] == 'Validation Errors') return true;
    return false;
  }

  @override
  String toString() {
    return 'Failure{message: $message, data: $data}';
  }

  @override
  List<Object> get props => [message, data];
}

class Failure extends IFailure {
  const Failure({
    required super.message,
    super.data,
  });

  factory Failure.fromHttpErrorMap(Map<String, dynamic> json) => Failure(
        message: json['message'] ?? json['errors']?['Message'],
        data: json,
      );
}

/// This is not to be used freely, it should be used as a fallback for errors
/// that need to be handled, especially for the API service where we don't know
/// all the errors beforehand.
class FallbackFailure extends IFailure {
  const FallbackFailure({
    super.data,
    super.message =
        "Oops! App encountered an issue. We're on it. Please try again later or contact us.",
  });
}

/// Errors that come from API calls that return error codes 500 and above
class InternetFailure extends IFailure {
  const InternetFailure({
    super.data,
    super.message = 'Please check your internet connection and try again.',
  });
}

/// Errors that come from API calls that return error codes 500 and above
class ServerFailure extends IFailure {
  const ServerFailure({
    super.data,
    super.message =
        "Sorry, we're having trouble on our end. Please try again later or contact support for assistance.",
  });
}

/// Errors that come from serializing data
class TypeFailure extends IFailure {
  const TypeFailure({
    super.message =
        'Sorry, we encounted an issue communicating to our server. We are working to fix it',
    super.data,
  });
}

/// Errors that come from serializing data
class ValidationFailure extends IFailure {
  const ValidationFailure({
    super.message =
        'Validation Errors! Please fill the fields properly or contact support for assistance.',
    super.data,
  });
}

/// Errors that come from serializing data
class DeviceFailure extends IFailure {
  const DeviceFailure({
    super.message =
        'We had issues retrieving data from the device. Please contact support.',
    super.data,
  });
}
