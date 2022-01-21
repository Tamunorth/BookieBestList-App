// To parse this JSON data, do
//
//     final error = errorFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Error errorFromJson(String str) => Error.fromJson(json.decode(str));

String errorToJson(Error data) => json.encode(data.toJson());

class Error {
  Error({
    required this.error,
  });

  PurpleError error;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        error: PurpleError.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error.toJson(),
      };
}

class PurpleError {
  PurpleError({
    required this.code,
    required this.message,
    required this.errors,
    required this.status,
  });

  int code;
  String message;
  List<ErrorElement> errors;
  String status;

  factory PurpleError.fromJson(Map<String, dynamic> json) => PurpleError(
        code: json["code"],
        message: json["message"],
        errors: List<ErrorElement>.from(
            json["errors"].map((x) => ErrorElement.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
        "status": status,
      };
}

class ErrorElement {
  ErrorElement({
    required this.message,
    required this.domain,
    required this.reason,
  });

  String message;
  String domain;
  String reason;

  factory ErrorElement.fromJson(Map<String, dynamic> json) => ErrorElement(
        message: json["message"],
        domain: json["domain"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "domain": domain,
        "reason": reason,
      };
}
