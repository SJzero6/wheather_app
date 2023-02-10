import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: size.height * 0.68,
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
                  Text('India',
                      style: GoogleFonts.amaranth(
                        textStyle: TextStyle(
                            fontSize: 35, color: Colors.white.withOpacity(0.9)),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Wed, 16 November',
                      style: GoogleFonts.boogaloo(
                        textStyle: TextStyle(
                            fontSize: 24, color: Colors.white.withOpacity(0.9)),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    'Sun-PNG-Clipart.png',
                    width: size.width * 0.3,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Sunny',
                      style: GoogleFonts.adventPro(
                        textStyle: TextStyle(
                            fontSize: 45, color: Colors.white.withOpacity(0.9)),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Text('15°c',
                      style: GoogleFonts.aladin(
                        textStyle: TextStyle(
                            fontSize: 75, color: Colors.white.withOpacity(0.9)),
                      )),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Image.asset(
                              'wind.png',
                              width: size.width * 0.18,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '17.1 km/h',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
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
                              'humid.png',
                              width: size.width * 0.18,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '82',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
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
                              '7137989.png',
                              width: size.width * 0.18,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'very strong',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('UV',
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
                      'pm1',
                      style: TextStyle(
                          fontSize: 20, color: Colors.white.withOpacity(0.7)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '32.0 km/h',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Pm2',
                      style: TextStyle(
                          fontSize: 20, color: Colors.white.withOpacity(0.7)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '125.0 hpa ',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      'pm3',
                      style: TextStyle(
                          fontSize: 20, color: Colors.white.withOpacity(0.7)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '1.0',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Pm4',
                      style: TextStyle(
                          fontSize: 20, color: Colors.white.withOpacity(0.7)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '0.00 mm',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      'pm5',
                      style: TextStyle(
                          fontSize: 20, color: Colors.white.withOpacity(0.7)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '19.1 km/h',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'pm5',
                      style: TextStyle(
                          fontSize: 20, color: Colors.white.withOpacity(0.7)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '2022/03/21',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
