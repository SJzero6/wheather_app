// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wheather_app/location.dart';
import 'package:wheather_app/weatherdata.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var client = weatherdata();
  var data;
  info() async {
    // var position = await getposition();
    data = await client.getData('51.52', '-0.11');
  }

  final _searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
      future: info(),
      builder: ((context, snapshot) {
        return ListView(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.69,
                    width: size.width,
                    padding: EdgeInsets.only(top: 30),
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
                        Text('${data?.cityname}',
                            style: GoogleFonts.amaranth(
                              textStyle: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white.withOpacity(0.9)),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Wed, 26 November',
                            style: GoogleFonts.boogaloo(
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white.withOpacity(0.9)),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        // Image.asset(
                        //   '/Sun-PNG-Clipart.png',
                        //   width: size.width * 0.3,
                        //),
                        Image.network(
                          'http:${data?.icon}',
                          width: size.width * 0.29,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('${data?.condition}',
                            style: GoogleFonts.adventPro(
                              textStyle: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white.withOpacity(0.9)),
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Text('${data?.temp}°',
                            style: GoogleFonts.aladin(
                              textStyle: TextStyle(
                                  fontSize: 50,
                                  color: Colors.white.withOpacity(0.9)),
                            )),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/wind.png',
                                    width: size.width * 0.18,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${data?.wind}km/h',
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
                                    'assets/humid.png',
                                    width: size.width * 0.18,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${data?.humidity}',
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
                                    'assets/7137989.png',
                                    width: size.width * 0.18,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${data?.wind_dir}',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 9.5,
                                  ),
                                  Text('wind dir',
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
                                fontSize: 18,
                                color: Colors.white.withOpacity(0.7)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${data?.gust}',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            'UV',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white.withOpacity(0.7)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${data?.uv}',
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
                                fontSize: 18,
                                color: Colors.white.withOpacity(0.7)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${data?.pressure}',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            'PRECIPITATION',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white.withOpacity(0.7)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${data?.percip}',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Text(
                            '',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white.withOpacity(0.7)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '19.1 km/h',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            'LAST_UPDT',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white.withOpacity(0.7)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${data?.lastupd}',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ],
                      ))
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      }),
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
              icon: Icon(Icons.close),
              color: Colors.black54,
              onPressed: () {
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
}
