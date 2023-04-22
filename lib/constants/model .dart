// ignore_for_file: prefer_typing_uninitialized_variables

class Weather {
  var icon;
  var condition;
  var gust;
  var pressure;
  var wind;

  Weather({
    required this.icon,
    required this.condition,
    required this.gust,
    required this.pressure,
    required this.wind,
  });
  Weather.fromJson(Map<String, dynamic> json) {
    icon = json[''];
    condition = json['description'];
    wind = json['wind_speed'];
    pressure = json['pressure'];
    gust = json['gust_speed'];
  }
}
