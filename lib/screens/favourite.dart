import 'package:flutter/material.dart';

import 'constant.dart';
import 'propertydetail.dart';

class MyFavoritePost extends StatefulWidget {
  const MyFavoritePost({super.key});

  @override
  State<MyFavoritePost> createState() => _MyFavoritePostState();
}

class _MyFavoritePostState extends State<MyFavoritePost> {
  bool isAnimate = false;

  List FavoritePostList = [];
  late String doc_id;
  var route;
  late String doc_id1;

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
    refreshPage();
  }

  Future<Null> refreshPage() async {
    // refreshKey.currentState?.show();
    // await Future.delayed(Duration(seconds: 2));
    // setState(() {
    //   return;
    // });
  }

  fetchDatabaseList() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Favourite'),
        backgroundColor: kPrimaryColor,
        // automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            key: refreshKey,
            child: RefreshIndicator(
              onRefresh: refreshPage,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 1,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const propertyDetail(),
                          ));
                    }),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 320,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 160,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Image(
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fill,
                                    image: const AssetImage(
                                        'assets/images/property1.jpg'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(left: 13),
                                  height: 35,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: const Text(
                                    'projectName',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 13),
                                  alignment: Alignment.topRight,
                                  height: 25,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: const Text(
                                    'price',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(left: 13),
                            child: RichText(
                              text: const TextSpan(
                                text: "Posted by : ",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                                children: [
                                  TextSpan(
                                    // text: "Builder",
                                    text: 'Owner',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 7),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(left: 13),
                            child: RichText(
                              text: const TextSpan(
                                text: "Location : ",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                                children: [
                                  TextSpan(
                                    text: 'Surat',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 7),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(left: 13),
                            child: RichText(
                              text: const TextSpan(
                                text: "Type : ",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                                children: [
                                  TextSpan(
                                    text: 'Commercial',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 7),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(left: 13),
                            child: RichText(
                              text: const TextSpan(
                                text: "Status : ",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                                children: [
                                  TextSpan(
                                    text: 'Completed',
                                    style: TextStyle(
                                        fontSize: 18,
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
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
