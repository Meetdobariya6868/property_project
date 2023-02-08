import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

class propertyDetail extends StatefulWidget {
  // final String value;
  // final String u2;
  // final int v1;

  const propertyDetail({super.key,});

  @override
  State<propertyDetail> createState() => _propertyDetailState();
}

class _propertyDetailState extends State<propertyDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        child: ListView(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 350,
                      color: Colors.white,
                      child: Stack(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 300.0,
                              enlargeCenterPage: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlay: true,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 1000),
                            ),
                            items: [
                              Container(
                                child: ClipRRect(
                                  child: Image(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/images/property1.jpg',
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: ClipRRect(
                                  child: Image(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/images/property1.jpg',
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: ClipRRect(
                                  child: Image(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/images/property1.jpg',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 190,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 13),
                                  height: 70,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "projectName",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 13),
                                  alignment: Alignment.topRight,
                                  height: 30,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "price" + "/sq ft",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 13),
                            child: RichText(
                              text: TextSpan(
                                text: "Posted by : ",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                                children: [
                                  TextSpan(
                                    // text: "Builder",
                                    text: "Owner",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 7),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 13),
                            child: RichText(
                              text: TextSpan(
                                text: "Location : ",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                                children: [
                                  TextSpan(
                                    text: "Surat",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 7),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 13),
                            child: RichText(
                              text: TextSpan(
                                text: "Address : ",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                                children: [
                                  TextSpan(
                                    text: "Mota varachha, Surat, Gujarat",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 13),
                                  height: 60,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "Overview",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.teal),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 13),
                                  alignment: Alignment.topRight,
                                  height: 20,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text("",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 7),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 13),
                            child: RichText(
                              text: TextSpan(
                                text: "Detail/Maintenance : ",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                                children: [
                                  TextSpan(
                                    text: '3BHK',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 7),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 13),
                            child: RichText(
                              text: TextSpan(
                                text: "Price : ",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                                children: [
                                  TextSpan(
                                    text: "3300",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 7),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 13),
                            child: RichText(
                              text: TextSpan(
                                text: "Area : ",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                                children: [
                                  TextSpan(
                                    text: "6000" + " SQ.FT",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 7),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 13),
                            child: RichText(
                              text: TextSpan(
                                text: "Construction Status : ",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Under Construction",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 13),
                                  height: 40,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "Project Detail",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 13),
                                  alignment: Alignment.topRight,
                                  height: 30,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 13),
                            child: RichText(
                              text: TextSpan(
                                text: "Luxurious villa",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}