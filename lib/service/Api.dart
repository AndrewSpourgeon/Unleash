import 'package:dio/dio.dart';
import 'dart:convert';

class Api {
  Future<String> getFacts() async {
    Response data = await Dio()
        .get("https://uselessfacts.jsph.pl//random.json?language=en");
    final fact = json.decode(data.toString());
    return fact['text'];
  }
}
