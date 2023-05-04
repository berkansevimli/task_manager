import "dart:async";
import "dart:convert";
import "dart:io";

import "package:flutter/foundation.dart";
import "package:http/http.dart";

Future<dynamic> getHttp(String url) async {
  if (kDebugMode) {
    print(url);
  }
  String result;
  try {
    final Response response =
        await get(Uri.parse(url)).timeout(const Duration(seconds: 10));
    if (response.statusCode != 200) {
      result =
          '{ "response_text":" ${response.statusCode} - ${response.reasonPhrase} "}';
    } else {
      result = response.body;
    }
  } on TimeoutException {
    result =
        '{"response_val": "-1", "response_text":"Check Your Internet Connection"}';
  } on SocketException {
    result =
        '{"response_val": "-2", "response_text":"Check Your Internet Connection"}';
  } on HttpException {
    result =
        '{"response_val": "-3", "response_text":"Page Not Found: HttpException"}';
  } on FormatException {
    result =
        '{"response_val": "-4", "response_text":"Page Not Found: FormatException"}';
  } catch (e) {
    result =
        '{"response_val": "-5", "response_text":"Unexpected Error Occured. Please Try Again Later. If The Error Is Repeated, Contact Your System Administrator. Error: $e"}';
  }
  return jsonDecode(
      result.replaceAll(RegExp(r"[^\x1F-\x7FğüşıöçĞÜŞİÖÇé]+"), ""));
}
