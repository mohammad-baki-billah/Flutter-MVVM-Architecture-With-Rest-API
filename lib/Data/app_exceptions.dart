class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

class UnathorizedException extends AppExceptions {
  UnathorizedException([String? message])
      : super(message, 'Unathorized Request');
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message]):super (message,'Invalid Input');
}
