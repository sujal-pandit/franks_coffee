import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:franks_coffee/cart_page.dart';
import 'package:franks_coffee/icons_container.dart';
import 'package:franks_coffee/item_list.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool coffeeTap = true, smoothieTap = false, teaTap = false, bakeryTap = false;
  List _item = [];
  String head = "coffee";

  @override
  void initState() {
    super.initState();
    readJson(head);
  }

  Future<void> readJson(String head) async {
    final String response = await rootBundle.loadString('assets/items.json');
    final data = await json.decode(response);
    setState(() {
      _item = data[head];
    });
  }

  @override
  Widget build(BuildContext context) {
    readJson(head);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 30,
        ),
        bottomNavigationBar: null,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                  image: AssetImage("assets/images/shop.png"),
                  height: 50,
                ),
                Text(
                  "Franky's Cafe",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartPage()));
                  },
                  child: Image(
                    image: AssetImage("assets/images/cart.png"),
                    height: 45,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  Image(
                    image: AssetImage("assets/images/Cafe2.png"),
                    height: 170,
                    width: 400,
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.3,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: double.maxFinite,
                      decoration: const BoxDecoration(
                        color: Color(0xffffe6b6),
                      ),
                    ),
                  ),
                  Container(
                    child: CustomPaint(
                      size: Size(MediaQuery.of(context).size.width,
                          350), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      painter: RPSCustomPainter(),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.19,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  coffeeTap
                                      ? coffeeTap = false
                                      : {coffeeTap = true, head = "coffee"};
                                });
                                if (coffeeTap == true) {
                                  smoothieTap = false;
                                  teaTap = false;
                                  bakeryTap = false;
                                }
                              },
                              child: coffeeTap
                                  ? IconsContainer(
                                      istapped: true,
                                    )
                                  : IconsContainer(),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  smoothieTap
                                      ? smoothieTap = false
                                      : {smoothieTap = true, head = "smoothie"};
                                });
                                if (smoothieTap == true) {
                                  teaTap = false;
                                  bakeryTap = false;
                                  coffeeTap = false;
                                }
                              },
                              child: smoothieTap
                                  ? IconsContainer(
                                      bottom: 75,
                                      Icon: "smoothie",
                                      istapped: true,
                                    )
                                  : IconsContainer(
                                      bottom: 75,
                                      Icon: "smoothie",
                                    ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  teaTap
                                      ? teaTap = false
                                      : {teaTap = true, head = "tea"};
                                });
                                if (teaTap == true) {
                                  smoothieTap = false;
                                  bakeryTap = false;
                                  coffeeTap = false;
                                }
                              },
                              child: teaTap
                                  ? IconsContainer(
                                      bottom: 75,
                                      Icon: "tea",
                                      istapped: true,
                                    )
                                  : IconsContainer(
                                      bottom: 75,
                                      Icon: "tea",
                                    ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  bakeryTap
                                      ? bakeryTap = false
                                      : {bakeryTap = true, head = "bakery"};
                                });
                                if (bakeryTap == true) {
                                  smoothieTap = false;
                                  teaTap = false;
                                  coffeeTap = false;
                                }
                              },
                              child: bakeryTap
                                  ? IconsContainer(
                                      Icon: "bakery",
                                      istapped: true,
                                    )
                                  : IconsContainer(
                                      Icon: "bakery",
                                    ),
                            ),
                          ],
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 350,
                            child: ItemList(item: _item)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color(0xFFFFCC98)
      ..style = PaintingStyle.fill;

    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.quadraticBezierTo(
        0, size.height * 0.7186937, 0, size.height * 0.6249250);
    path0.quadraticBezierTo(size.width * 0.4988000, size.height * 0.2477250,
        size.width, size.height * 0.6270000);
    path0.quadraticBezierTo(
        size.width, size.height * 0.9067500, size.width, size.height);
    path0.quadraticBezierTo(
        size.width * 0.4997417, size.height * 0.6261500, 0, size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
