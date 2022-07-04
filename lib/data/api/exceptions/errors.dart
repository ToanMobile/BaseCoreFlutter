import 'dart:convert';

import 'package:dio/dio.dart';

class AppInterceptors extends InterceptorsWrapper {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    var messageError;
    try {
      messageError = jsonDecode(err.response.toString())['message'] ?? jsonDecode(err.response.toString())['error'];
    } catch (e) {
      messageError = null;
    }
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioErrorType.response:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions, message: messageError);
          case 401:
            throw UnauthorizedException(err.requestOptions, message: messageError);
          case 404:
            throw NotFoundException(err.requestOptions, message: messageError);
          case 409:
            throw ConflictException(err.requestOptions, message: messageError);
          case 500:
            throw InternalServerErrorException(err.requestOptions, message: messageError);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException(err.requestOptions, message: messageError);
    }
    return handler.next(err);
  }
}

class BadRequestException extends DioError {
  final String? messageError;

  BadRequestException(RequestOptions r, {message})
      : messageError = message is String ? message : message[0],
        super(requestOptions: r);

  @override
  String toString() {
    return messageError != null ? messageError.toString() : 'Invalid document';
  }
}

class InternalServerErrorException extends DioError {
  final String? messageError;

  InternalServerErrorException(RequestOptions r, {message})
      : messageError = message is String ? message : message[0],
        super(requestOptions: r);

  @override
  String toString() {
    return messageError != null ? messageError.toString() : 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioError {
  final String? messageError;

  ConflictException(RequestOptions r, {message})
      : messageError = message is String ? message : message[0],
        super(requestOptions: r);

  @override
  String toString() {
    return messageError != null ? messageError.toString() : 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  final String? messageError;

  UnauthorizedException(RequestOptions r, {message})
      : messageError = message is String ? message : message[0],
        super(requestOptions: r);

  @override
  String toString() {
    return messageError != null ? messageError.toString() : 'Access denied';
  }
}

class NotFoundException extends DioError {
  final String? messageError;

  NotFoundException(RequestOptions r, {message})
      : messageError = message is String ? message : message[0],
        super(requestOptions: r);

  @override
  String toString() {
    return messageError != null ? messageError.toString() : 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioError {
  final String? messageError;

  NoInternetConnectionException(RequestOptions r, {message})
      : messageError = message != null ? (message is String ? message : message[0]) : null,
        super(requestOptions: r);

  @override
  String toString() {
    return messageError != null ? messageError.toString() : 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioError {
  final String? messageError;

  DeadlineExceededException(RequestOptions r, {message})
      : messageError = message is String ? message : message[0],
        super(requestOptions: r);

  @override
  String toString() {
    return messageError != null ? messageError.toString() : 'The connection has timed out, please try again.';
  }
}
