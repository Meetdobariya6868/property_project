import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/databaseManager.dart';
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
  late String f1;
  late String i1;
  late int view2;

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
    refreshPage();
  }

  Future<void> refreshPage() async {
    refreshKey.currentState?.show();
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      return;
    });
  }

  fetchDatabaseList() async {
    dynamic resultant = await FavoritePostManager().getFavoritePostList();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        FavoritePostList = resultant;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text('Favourite'),
        backgroundColor: kPrimaryColor,
        // automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          SizedBox(height: 15),
          FavoritePostList.length == 0
              ? Container()
              : Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text("Favourite property(${FavoritePostList.length})",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
          SizedBox(height: 8),
          Container(
            child: RefreshIndicator(
              key: refreshKey,
              onRefresh: refreshPage,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: FavoritePostList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        FirebaseFirestore.instance
                            .collection('propertyDetails')
                            .get()
                            .then(
                              (QuerySnapshot snapshot) => {
                                view2 = FavoritePostList[index]['view'],
                                // snapshot.documents.forEach((f) {
                                //
                                //   print("documentID---- " + f.reference.documentID);
                                //
                                // }),
                                //     snapshot.documents[index].data(),
                                doc_id = FavoritePostList[index]['propertyId'],
                                //print(snapshot.documents[index].documentID)
                                print(doc_id),
                                // route = MaterialPageRoute(
                                //   builder: (BuildContext context) =>
                                //       propertyDetail(value: doc_id,v1:view2),

                                // ),
                                Navigator.of(context).push(route)
                              },
                            );
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        height: 320,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                    child: Image.network(
                                        FavoritePostList[index]['firstImage'],
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  margin: EdgeInsets.only(right: 20, top: 20),
                                  child: FavoriteButton(
                                    isFavorite: true,
                                    valueChanged: (_isFavorite) {
                                      if (_isFavorite == true) {
                                        FirebaseFirestore.instance
                                            .collection('propertyDetails')
                                            .get()
                                            .then((QuerySnapshot snapshot) => {
                                                  // snapshot.documents.forEach((f) {
                                                  //    id = f.reference.documentID;
                                                  //   //print("documentID---- " + f.reference.documentID);
                                                  //
                                                  // }),
                                                  // print(snapshot.docs[index].documentID),
                                                  //snapshot.docs[index].data(),
                                                  f1 = snapshot.docs[index].id,
                                                  // doc_id1 = snapshot.documents[index].documentID,
                                                  // //print(snapshot.documents[index].documentID)
                                                  FirebaseFirestore.instance
                                                      .collection(
                                                          'propertyDetails')
                                                      .doc(f1)
                                                      .set(
                                                          {
                                                        'favorites': FieldValue
                                                            .arrayUnion([
                                                          '${FirebaseAuth.instance.currentUser!.uid}'
                                                        ]),
                                                        'propertyId': '$f1'
                                                      },
                                                          SetOptions(
                                                              merge:
                                                                  true)).then(
                                                          (value) => {})
                                                });
                                      } else {
                                        FirebaseFirestore.instance
                                            .collection('propertyDetails')
                                            .get()
                                            .then((QuerySnapshot snapshot) => {
                                                  f1 = snapshot.docs[index].id,
                                                  FirebaseFirestore.instance
                                                      .collection(
                                                          'propertyDetails')
                                                      .doc(f1)
                                                      .set(
                                                          {
                                                        'favorites': FieldValue
                                                            .arrayRemove([
                                                          '${FirebaseAuth.instance.currentUser!.uid}'
                                                        ])
                                                      },
                                                          SetOptions(
                                                              merge:
                                                                  true)).then(
                                                          (value) => {})
                                                });
                                      }
                                    },
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 13),
                                    height: 30,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                        FavoritePostList[index]['projectName'],
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                  margin: EdgeInsets.only(right: 13),
                                  alignment: Alignment.topRight,
                                  height: 20,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(FavoritePostList[index]['price'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo)),
                                ))
                              ],
                            ),
                            SizedBox(height: 7),
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
                                            text: FavoritePostList[index]
                                                ['postedBy'],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400))
                                      ]),
                                )),
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
                                            text: FavoritePostList[index]
                                                ['city'],
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400))
                                      ]),
                                )),
                            SizedBox(height: 7),
                            Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(left: 13),
                                child: RichText(
                                  text: TextSpan(
                                      text: "Type : ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                      children: [
                                        TextSpan(
                                            text: FavoritePostList[index]
                                                ['category'],
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400))
                                      ]),
                                )),
                            SizedBox(height: 7),
                            Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(left: 13),
                                child: RichText(
                                  text: TextSpan(
                                      text: "Status : ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                      children: [
                                        TextSpan(
                                            text: FavoritePostList[index]
                                                ['status'],
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400))
                                      ]),
                                )),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
