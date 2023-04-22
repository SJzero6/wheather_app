import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wheather_app/constants/model%20.dart';

class weatherdata {
  Future<Weather> getData(var location) async {
    var uricall = Uri.parse(
        'http://192.168.29.228:3000/api/weather/getweather/$location');
    var response = await http.get(uricall);
    var body = jsonDecode(response.body);
    print(response.body);
    return Weather.fromJson(body);
  }
}
