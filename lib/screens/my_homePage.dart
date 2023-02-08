import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/constant.dart';
import 'package:flutter_application_1/screens/propertydetail.dart';
import 'package:rate_my_app/rate_my_app.dart';

import '../models/databaseManager.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _auth = FirebaseAuth.instance.currentUser;
  late int view2;
  late String myEmail;
  late String myName;
  late String myPhone;
  List userProfilesList = [];
  late String f1;
  var doc_id;
  var route;
  late String i1;
  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 7,
    minLaunches: 10,
    remindDays: 7,
    remindLaunches: 10,
    // googlePlayIdentifier: 'fr.skyost.example',
    // appStoreIdentifier: '1491556149',
  );

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
    rateMyApp.init().then((_) {
      if (rateMyApp.shouldOpenDialog) {
        rateMyApp.showRateDialog(
          context,
          title: 'Rate this app', // The dialog title.
          message: 'Help us to improve our app.', // The dialog message.
          rateButton: 'RATE', // The dialog "rate" button text.
          noButton: 'NO THANKS', // The dialog "no" button text.
          laterButton: 'MAYBE LATER', // The dialog "later" button text.
          listener: (button) {
            // The button click listener (useful if you want to cancel the click event).
            switch (button) {
              case RateMyAppDialogButton.rate:
                print('Clicked on "Rate".');
                break;
              case RateMyAppDialogButton.later:
                print('Clicked on "Later".');
                break;
              case RateMyAppDialogButton.no:
                print('Clicked on "No".');
                break;
            }

            return true; // Return false if you want to cancel the click event.
          },
          dialogStyle: const DialogStyle(), // Custom dialog styles.
          onDismissed: () => rateMyApp.callEvent(RateMyAppEventType
              .laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
          // contentBuilder: (context, defaultContent) => content, // This one allows you to change the default dialog content.
          // actionsBuilder: (context) => [], // This one allows you to use your own buttons.
        );
      }
    });
  }

  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getUsersList();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        userProfilesList = resultant;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                  color: kPrimaryColor,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                // child:
                child: Center(
                    child: Text(
                        "Hello,"
                        " ${_auth!.displayName}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Search_Page()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 80, left: 30, right: 30),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(left: 30, top: 15),
                  child: Text("Search",
                      style: TextStyle(color: Colors.grey, fontSize: 16)),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text("Available property(${userProfilesList.length})",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 5),
          Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: userProfilesList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    FirebaseFirestore.instance
                        .collection('propertyDetails')
                        .get()
                        .then(
                          (QuerySnapshot snapshot) => {
                            view2 = snapshot.docs[index].get('view'),
                            if (snapshot.docs[index].get('postedById') ==
                                FirebaseAuth.instance.currentUser!.uid)
                              {view2 = view2}
                            else
                              {view2 = view2 + 1},
                            doc_id = snapshot.docs[index].id,
                            print(doc_id),
                            route = MaterialPageRoute(
                              builder: (BuildContext context) => propertyDetail(
                                  // value: doc_id,u2:i1,v1:view2
                                  ),
                            ),
                            i1 = snapshot.docs[index].get('postedById'),
                            Navigator.of(context).push(route),
                            FirebaseFirestore.instance
                                .collection('propertyDetails')
                                .doc(doc_id)
                                .update({
                              'view': view2,
                            }),
                          },
                        );
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    height: 350,
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
                                    userProfilesList[index]['firstImage'],
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(right: 20, top: 20),
                              child: FavoriteButton(
                                isFavorite: false,
                                valueChanged: (_isFavorite) {
                                  if (_isFavorite == true) {
                                    FirebaseFirestore.instance
                                        .collection('propertyDetails')
                                        .get()
                                        .then((QuerySnapshot snapshot) => {
                                              f1 = snapshot.docs[index].id,
                                              FirebaseFirestore.instance
                                                  .collection('propertyDetails')
                                                  .doc(f1)
                                                  .set({
                                                'favorites':
                                                    FieldValue.arrayUnion([
                                                  (FirebaseAuth.instance
                                                      .currentUser!.uid)
                                                ]),
                                                'propertyId': '$f1'
                                              }, SetOptions(merge: true)).then(
                                                      (value) => {})
                                            });
                                  } else {
                                    FirebaseFirestore.instance
                                        .collection('propertyDetails')
                                        .get()
                                        .then((QuerySnapshot snapshot) => {
                                              f1 = snapshot.docs[index].id,
                                              FirebaseFirestore.instance
                                                  .collection('propertyDetails')
                                                  .doc(f1)
                                                  .set({
                                                'favorites':
                                                    FieldValue.arrayRemove([
                                                  '${FirebaseAuth.instance.currentUser!.uid}'
                                                ])
                                              }, SetOptions(merge: true)).then(
                                                      (value) => {})
                                            });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 13),
                                height: 30,
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                    userProfilesList[index]['projectName'],
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: kTextColor)),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.only(right: 13),
                              alignment: Alignment.topRight,
                              height: 20,
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                  '₹' + userProfilesList[index]['price'],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: kTextColor)),
                            ))
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
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
                                            text: userProfilesList[index]
                                                ['postedBy'],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400))
                                      ]),
                                )),
                            Spacer(),
                            Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(left: 13),
                                child: RichText(
                                  text: TextSpan(
                                    // text: "area",
                                    text: userProfilesList[index]['area'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                    // children: [
                                    //   TextSpan(
                                    //     // text: "Builder",
                                    //       text: userProfilesList[index]['area'],
                                    //       style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)
                                    //   )
                                    // ]
                                  ),
                                )),
                          ],
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
                                        // text: "city",
                                        text: userProfilesList[index]
                                            ['location'],
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
                                        text: userProfilesList[index]
                                            ['category'],
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400))
                                  ]),
                            )),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
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
                                              text: userProfilesList[index]
                                                  ['status'],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400))
                                        ]),
                                  )),
                            ),
                            Expanded(
                                child: Container(
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(right: 13),
                              child: Text(
                                userProfilesList[index]['markAsSold'],
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: userProfilesList[index]
                                                ['markAsSold'] ==
                                            'Sold'
                                        ? Colors.red
                                        : Colors.green),
                              ),
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
