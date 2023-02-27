// ignore_for_file: prefer_typing_uninitialized_variables

class weather {
  var cityname;
  var icon;
  var condition;
  var temp;
  var humidity;
  var uv;
  var wind_dir;
  var gust;
  var pressure;
  var percip;
  var lastupd;
  var wind;

  weather({
    required this.cityname,
    required this.icon,
    required this.condition,
    required this.temp,
    required this.humidity,
    required this.uv,
    required this.wind_dir,
    required this.gust,
    required this.pressure,
    required this.percip,
    required this.lastupd,
    required this.wind,
  });
  weather.fromJson(Map<String, dynamic> json) {
    cityname = json['location']['name'];
    icon = json['current']['condition']['icon'];
    condition = json['current']['condition']['text'];
    temp = json['current']['temp_c'];
    wind = json['current']['wind_kph'];
    humidity = json['current']['humidity'];
    wind_dir = json['current']['wind_dir'];
    pressure = json['current']['pressure_mb'];
    lastupd = json['current']['last_updated'];
    gust = json['current']['gust_kph'];
    uv = json['current']['uv'];
    percip = json['current']["precip_in"];
  }
}
