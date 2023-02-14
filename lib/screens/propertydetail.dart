import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'constant.dart';
import 'message.dart';
import 'review.dart';

class propertyDetail extends StatefulWidget {
  final String value;
  final String u2;
  final int v1;

  const propertyDetail({
    super.key,
    required this.value,
    required this.u2,
    required this.v1,
  });

  @override
  State<propertyDetail> createState() => _propertyDetailState(value, u2, v1);
}

class _propertyDetailState extends State<propertyDetail> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void showSnackBar(String value) {
    _scaffoldKey.currentState!.showBodyScrim(true, 2.0);
    // _scaffoldKey
    //     .currentState!
    //     .showSnackBar(
    //     SnackBar(
    //       content: Text(value),
    //     )
    // );
  }

  late final String value;
  late final String u2;
  late final int v1;
  late String view;
  late String uName;
  late String cate;
  late String poB;
  late String ci;
  late String sta;
  late String proN;
  late String pri;
  late String fiI;
  late String poI;
  late bool reportV;
  _propertyDetailState(this.value, this.u2, this.v1);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("propertyDetails")
          .doc(value)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return new Text("Loading");
        }
        var userData = snapshot.data;
        return Scaffold(
          key: _scaffoldKey,
          // appBar: AppBar(
          //   elevation: 0.0,
          //   backgroundColor: Colors.indigo,
          // ),
          backgroundColor: kBackgroundColor,
          body: ListView(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 340,
                        color: Colors.white,
                        child: Stack(
                          children: [
                            CarouselSlider(
                                options: CarouselOptions(
                                  height: 320,
                                  enlargeCenterPage: true,
                                  autoPlayInterval:
                                      const Duration(seconds: 3),
                                  autoPlay: true,
                                  //aspectRatio: 16 / 9,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  //enableInfiniteScroll: true,
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 1000),
                                  //viewportFraction: 0.8,
                                ),
                                items: [
                                  // Container(
                                  //   child: ClipRRect(
                                  //     child: Image.asset(
                                  //         'image/home.jpg',
                                  //         width: MediaQuery.of(context).size.width,
                                  //         height: MediaQuery.of(context).size.height,
                                  //         fit:BoxFit.fill
                                  //     ),
                                  //   ),
                                  // ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ImageView1(
                                                      i1: userData[
                                                          'firstImage'])));
                                    },
                                    child: Container(
                                      child: ClipRRect(
                                        child: Hero(
                                          tag: 'imageHero1',
                                          child: Image.network(
                                              userData!['firstImage'],
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ImageView2(
                                            i2: userData['secondImage'],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      child: ClipRRect(
                                        child: Hero(
                                          tag: 'imageHero2',
                                          child: Image.network(
                                              userData!['secondImage'],
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ImageView3(
                                                      i3: userData[
                                                          'thirdImage'])));
                                    },
                                    child: Container(
                                      child: ClipRRect(
                                        child: Hero(
                                          tag: 'imageHero3',
                                          child: Image.network(
                                              userData!['thirdImage'],
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                            // Container(
                            //   alignment: Alignment.topRight,
                            //   margin: EdgeInsets.only(right: 20, top: 20),
                            //   child: FavoriteButton(
                            //     isFavorite: false,
                            //     valueChanged: (_isFavorite) {
                            //       print('Is Favorite : $_isFavorite');
                            //     },
                            //   ),
                            // )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 15, left: 15),
                            child: ElevatedButton(
                                //shape:
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection("propertyDetails")
                                      .doc('${widget.value}')
                                      .collection("chatRoom")
                                      .doc(
                                          "${FirebaseAuth.instance.currentUser!.uid}_${widget.u2}")
                                      .set({
                                    "users": FieldValue.arrayUnion([
                                      '${FirebaseAuth.instance.currentUser!.uid}',
                                      '${widget.u2}'
                                    ]),
                                    "chatRoomId":
                                        "${FirebaseAuth.instance.currentUser!.uid}_${widget.u2}",
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Messages(
                                              u2: widget.u2,
                                              id: widget.value)));
                                },
                                // color: Colors.green,
                                child: const Text("Chat",
                                    style: TextStyle(fontSize: 16))),
                          ),
                          SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 0.15),
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ReviewPage(
                                                id1: widget.value)));
                                  },
                                  child: Row(children: [
                                    const Icon(Icons.message),
                                    const Text("Reviews",
                                        style: TextStyle(fontSize: 16))
                                  ]),
                                )),
                          ),
                          SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 0.15),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Container(
                                    child: const Icon(Icons.remove_red_eye),
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                    child: Text("${widget.v1}",
                                        style: const TextStyle(fontSize: 16)),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 13),
                                    height: 35,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(userData!["projectName"],
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: kTextColor)),
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                  margin: const EdgeInsets.only(right: 13),
                                  alignment: Alignment.topRight,
                                  height: 25,
                                  width:
                                      MediaQuery.of(context).size.width / 2,
                                  child: Text(userData!["price"],
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: kTextColor)),
                                ))
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(left: 13),
                              child: RichText(
                                text: TextSpan(
                                  text: "Posted by : ",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                  children: [
                                    TextSpan(
                                        // text: "Builder",
                                        text: userData!["postedBy"],
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 7),
                            Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(left: 13),
                                child: RichText(
                                  text: TextSpan(
                                      text: "Location : ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                      children: [
                                        TextSpan(
                                            text: userData!["city"],
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400))
                                      ]),
                                )),
                            const SizedBox(height: 7),
                            Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(left: 13),
                                child: RichText(
                                  text: TextSpan(
                                      text: "Address : ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                      children: [
                                        TextSpan(
                                            text: userData!["address"],
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400))
                                      ]),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 170,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 13),
                                    height: 35,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: const Text("Overview",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.teal)),
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                  margin: const EdgeInsets.only(right: 13),
                                  alignment: Alignment.topRight,
                                  height: 20,
                                  width:
                                      MediaQuery.of(context).size.width / 2,
                                  child: const Text("",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo)),
                                ))
                              ],
                            ),
                            const SizedBox(height: 7),
                            Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(left: 13),
                                child: RichText(
                                  text: TextSpan(
                                      text: "Detail/Maintenance : ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                      children: [
                                        TextSpan(
                                            text: userData!['detail'],
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400))
                                      ]),
                                )),
                            const SizedBox(height: 7),
                            Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(left: 13),
                                child: RichText(
                                  text: TextSpan(
                                      text: "Price : ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                      children: [
                                        TextSpan(
                                            text: userData!["price"],
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400))
                                      ]),
                                )),
                            const SizedBox(height: 7),
                            Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(left: 13),
                                child: RichText(
                                  text: TextSpan(
                                      text: "Area : ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                      children: [
                                        TextSpan(
                                            text: userData!["area"],
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400))
                                      ]),
                                )),
                            const SizedBox(height: 7),
                            Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(left: 13),
                                child: RichText(
                                  text: TextSpan(
                                      text: "Construction Status : ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                      children: [
                                        TextSpan(
                                            text: userData!["status"],
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400))
                                      ]),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 13),
                                    height: 35,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: const Text("Project Detail",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.teal)),
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                  margin: const EdgeInsets.only(right: 13),
                                  alignment: Alignment.topRight,
                                  height: 20,
                                  width:
                                      MediaQuery.of(context).size.width / 2,
                                  child: const Text("",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo)),
                                ))
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(left: 13),
                                child: RichText(
                                  text: TextSpan(
                                    text: userData!["description"],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              (widget.u2 == FirebaseAuth.instance.currentUser!.uid)
                  ? Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: ElevatedButton(
                        // color: Colors.red.shade500,
                        onPressed: () {
                          showSnackBar("Successfully labeled 'Sold'");
                          FirebaseFirestore.instance
                              .collection('propertyDetails')
                              .doc(widget.value)
                              .update({'markAsSold': 'Sold'});
                          FirebaseFirestore.instance
                              .collection('propertyDetails')
                              .doc(widget.value)
                              .get()
                              .then((value) => {
                                    cate = value.get('category'),
                                    poB = value.get('postedBy'),
                                    proN = value.get('projectName'),
                                    ci = value.get('city'),
                                    pri = value.get('price'),
                                    sta = value.get('status'),
                                    fiI = value.get('firstImage'),
                                    FirebaseFirestore.instance
                                        .collection('soldProperties')
                                        .doc(widget.value)
                                        .set({
                                      'category': cate,
                                      'postedBy': poB,
                                      'projectName': proN,
                                      'city': ci,
                                      'price': pri,
                                      'status': sta,
                                      'firstImage': fiI
                                    }),
                                    Navigator.of(context).pop(),
                                    FirebaseFirestore.instance
                                        .collection('propertyDetails')
                                        .doc(widget.value)
                                        .delete(),
                                    FirebaseFirestore.instance
                                        .collection("propertyDetails")
                                        .doc(widget.value)
                                        .get()
                                        .then((value) => {
                                              reportV = value.get('report'),
                                              if (reportV == true)
                                                {
                                                  FirebaseFirestore.instance
                                                      .collection(
                                                          'reportProperty')
                                                      .doc(widget.value)
                                                      .delete()
                                                }
                                            })
                                  });
                        },
                        child: const Text("Mark as sold",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        showSnackBar("This property report Successfully");
                        FirebaseFirestore.instance
                            .collection('propertyDetails')
                            .doc(widget.value)
                            .update({
                          'report': true,
                        });
                        FirebaseFirestore.instance
                            .collection("propertyDetails")
                            .doc(widget.value)
                            .get()
                            .then((value) => {
                                  poI = value.get('postedById'),
                                  reportV = value.get('report'),
                                  print(reportV),
                                  FirebaseFirestore.instance
                                      .collection("reportProperty")
                                      .doc(widget.value)
                                      .set({
                                    'propertyId': widget.value,
                                    'postedUser': poI
                                  })
                                });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: const Center(
                          child: Text(
                            "Report Property",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )
            ],
          ),
        );
      },
    );
  }
}

class ImageView1 extends StatelessWidget {
  final String i1;

  const ImageView1({Key? key, required this.i1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'imageHero1',
            child: Image.network(
              i1,
            ),
          ),
        ),
      ),
    );
  }
}

class ImageView2 extends StatelessWidget {
  final String i2;

  const ImageView2({Key? key, required this.i2}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'imageHero2',
            child: Image.network(
              i2,
            ),
          ),
        ),
      ),
    );
  }
}

class ImageView3 extends StatelessWidget {
  final String i3;

  const ImageView3({Key? key, required this.i3}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'imageHero3',
            child: Image.network(
              i3,
            ),
          ),
        ),
      ),
    );
  }
}
