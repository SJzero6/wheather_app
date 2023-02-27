import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wheather_app/model .dart';

class weatherdata {
  Future<weather> getData(var lati, var longi) async {
    var uricall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=e8ec6c54bda64fbcabc42636231302&q=$lati,$longi&aqi=no ');
    var response = await http.get(uricall);
    var body = jsonDecode(response.body);
    return weather.fromJson(body);
  }
}
