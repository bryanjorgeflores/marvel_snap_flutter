import 'dart:io';

import 'package:dio/dio.dart';
import 'package:domain/src/authentication/errors/bad_request.dart';
import 'package:domain/src/authentication/errors/no_network.dart';
import 'package:domain/src/authentication/errors/precondition_failed.dart';
import 'package:domain/src/authentication/errors/unatuthorized.dart';
import 'package:domain/src/authentication/errors/unexpected.dart';
import 'package:injectable/injectable.dart';

@injectable
class ErrorMapping {
  toThrow(dynamic error) {
    if (error is DioError) {
      var response = error.response;
      var statusCode = response?.statusCode;
      if (error.type == DioErrorType.other || error.error is SocketException) {
        throw NoNetwork();
      }
      switch (statusCode) {
        case 400:
          throw BadRequest();
        case 401:
          throw Unauthorized();
        case 412:
          throw PreconditionFailed(
              title: response
                  .toString()
                  .trim()
                  .replaceAll(RegExp(r"\s\b|\b\s\r\n"), " "),
              message: response
                  .toString()
                  .trim()
                  .replaceAll(RegExp(r"\s\b|\b\s\r\n"), " "));
        default:
          throw Unexpected();
      }
    } else {
      throw Unexpected();
    }
  }
}
