/// Contains code for error handling.
import "dart:convert";

/// Represents an error while using the PayPal API.
class PayPalException implements Exception {
  List? details;
  String? informationLink, message, name;
  int? statusCode;

  PayPalException({
    this.details,
    this.informationLink,
    this.message,
    this.name,
    this.statusCode: 500,
  });

  PayPalException.fromJson(String json, {int statusCode: 500}) {
    _initializeFromMap(jsonDecode(json) as Map<String, dynamic>,
        statusCode: statusCode);
  }

  PayPalException.fromMap(Map data, {int statusCode: 500}) {
    _initializeFromMap(data, statusCode: statusCode);
  }

  _initializeFromMap(Map data, {int statusCode: 500}) {
    this.statusCode = statusCode;
    details = data["details"];
    informationLink = data["information_link"];
    message = data["message"];
    name = data["name"];
  }

  @override
  String toString() =>
      "PayPal responded with error code $statusCode. $name: $message";
}
