// ignore_for_file: prefer_typing_uninitialized_variables

class Weather {
  var icon;
  var condition;
  var gust;
  var pressure;
  var wind;
  var windDeg;
  var feels_like;

  Weather(
      {required this.icon,
      required this.condition,
      required this.gust,
      required this.pressure,
      required this.wind,
      required this.windDeg,
      required this.feels_like});
  Weather.fromJson(Map<String, dynamic> json) {
    icon = json[''];
    condition = json['description'];
    wind = json['wind_speed'];
    pressure = json['pressure'];
    gust = json['gust_speed'];
    windDeg = json['wind_deg'];
    feels_like = json['feels_like'];
  }
}
