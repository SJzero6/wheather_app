// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wheather_app/constants/model%20.dart';
import 'package:wheather_app/datafetching/weatherdata.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:wheather_app/provider/weatherpro.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Weather data = Weather(
      icon: '',
      condition: 'N/A',
      gust: 0.0,
      pressure: 0.0,
      wind: 0.0,
      windDeg: 0.0,
      feels_like: 0.0,
      visibility: 0.0);

  String searchTerm = '';
  DateTime currentDate = DateTime.now();

  var hume = 0;
  var temp = 0;

  @override
  void initState() {
    Mqttprovider mqttProvider =
        Provider.of<Mqttprovider>(context, listen: false);
    mqttProvider.newAWSConnect();
    super.initState();
  }

  final _searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Mqttprovider mqttProvider = Provider.of<Mqttprovider>(context);

    Map<String, dynamic> log = json.decode(mqttProvider.rawLogData);

    hume = log["humidity"] ?? 0;
    temp = log["temperature"] ?? 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
      children: [
        Container(
          child: Column(
            children: [
              Container(
                height: size.height * 0.69,
                width: size.width,
                padding: EdgeInsets.only(top: 20),
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                        colors: [Color(0xff955cd1), Color(0xff3fa2fa)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0.2, 0.8])),
                child: Column(
                  children: [
                    SearchBox(),
                    Text(searchTerm,
                        style: GoogleFonts.amaranth(
                          textStyle: TextStyle(
                              fontSize: 40,
                              color: Colors.white.withOpacity(0.9)),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Text('${DateFormat('E, dd MMMM ').format(currentDate)}',
                        style: GoogleFonts.boogaloo(
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.9)),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    // Image.asset(
                    //   '/Sun-PNG-Clipart.png',
                    //   width: size.width * 0.3,
                    //),
                    Image.network(
                      'https://openweathermap.org/img/wn/${data.icon}@2x.png',
                      width: size.width * 0.20,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Text('${data.condition}',
                        style: GoogleFonts.adventPro(
                          textStyle: TextStyle(
                              fontSize: 35,
                              color: Colors.white.withOpacity(0.9)),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text('${temp}°C',
                        style: GoogleFonts.aladin(
                          textStyle: TextStyle(
                              fontSize: 45,
                              color: Colors.white.withOpacity(0.9)),
                        )),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/wind.png',
                                width: size.width * 0.18,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${data.wind}km/h',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('wind',
                                  style: GoogleFonts.amaranth(
                                    textStyle: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ))
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/humid.png',
                                width: size.width * 0.18,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${hume}%',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Humidty',
                                  style: GoogleFonts.amaranth(
                                    textStyle: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/pressure.png',
                                width: size.width * 0.18,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${data.pressure} hpa',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                              SizedBox(
                                height: 9.5,
                              ),
                              Text('Pressure',
                                  style: GoogleFonts.amaranth(
                                    textStyle: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'GUST',
                        style: TextStyle(
                            fontSize: 18, color: Colors.white.withOpacity(0.7)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${data.gust}',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Visibility',
                        style: TextStyle(
                            fontSize: 18, color: Colors.white.withOpacity(0.7)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${data.visibility}",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'PRESSURE',
                        style: TextStyle(
                            fontSize: 18, color: Colors.white.withOpacity(0.7)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${data.pressure}',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'FEELS LIKE',
                        style: TextStyle(
                            fontSize: 18, color: Colors.white.withOpacity(0.7)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${data.feels_like}',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Wind_Dir',
                        style: TextStyle(
                            fontSize: 20, color: Colors.white.withOpacity(0.7)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '0.0${data.windDeg}',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'LAST_UPDT',
                        style: TextStyle(
                            fontSize: 18, color: Colors.white.withOpacity(0.7)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${DateFormat.yMd().add_jm().format(currentDate)}',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ],
                  ))
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }

  Widget SearchBox() {
    return Container(
      width: 350,
      padding: EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        enabled: null,
        controller: _searchcontroller,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              color: Colors.black54,
              onPressed: () async {
                print('on presdsd ${_searchcontroller.text}');
                var wData = await getData(_searchcontroller.text);
                setState(() {
                  data = wData;
                  searchTerm = _searchcontroller.text;
                });
                _searchcontroller.clear();
              },
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black54,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: 'search',
            hintStyle: TextStyle(color: Colors.black54)),
      ),
    );
  }

  Future<Weather> getData(var location) async {
    var uricall = Uri.parse(
        'http://192.168.29.152:5000/api/weather/getweather/$location');
    var response = await http.get(uricall);
    var body = jsonDecode(response.body);
    print(response.body);
    return Weather.fromJson(body);
  }
}
