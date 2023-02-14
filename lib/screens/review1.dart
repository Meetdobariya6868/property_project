import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constant.dart';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  CollectionReference review = FirebaseFirestore.instance.collection('review');
  final _formKey = GlobalKey<FormState>();

  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLMail() async {
    const url =
        'mailto:alis@example.org?subject=LifePlusApp&body=Your sugestions%20or Feedback..';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  late String name;
  late String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Review Page"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 13),
                child: Text(
                  "Thank You For Using our Application. We Hope You were Happy With Your Purchase or Sell a house. Please Leave a Feeback message.",
                  style: TextStyle(
                    fontSize: 17.5,
                    height: 1.3,
                    fontFamily: 'RobotoSlab',
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  // onChanged: (val) {
                  //   if (val != null || val.length > 0) name = val;
                  // },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter name';
                    }
                    return null;
                  },
                  controller: t1,
                  decoration: const InputDecoration(
                    fillColor: Color(0xffe6e6e6),
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    hintText: 'Your name',
                    hintStyle: TextStyle(
                        color: Colors.blueGrey, fontFamily: 'RobotoSlab'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0001,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  // onChanged: (val) {
                  //   if (val != null || val.length > 0) message = val;
                  // },
                  textAlign: TextAlign.start,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Feedback';
                    }
                    return null;
                  },
                  controller: t2,

                  decoration: const InputDecoration(
                    fillColor: Color(0xffe6e6e6),
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                    hintText: 'Your Valuable Feedback',
                    hintStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontFamily: 'RobotoSlab',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(17),
                      ),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(17),
                      ),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(17),
                      ),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Card(
                color: const Color.fromRGBO(245, 0, 87, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() async {
                        // launchUrl(
                        //     "mailto:avadheshnasit1@gmail.com?subject=From $name&body=$message");
                        {
                          await review
                              .add({'name': t1.text, 'review': t2.text}).then(
                                  (value) => print('Review Store'));
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: kPrimaryColor,
                            content: Text(
                              "Review Sent",
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            ),
                          ),
                        );
                        t1.clear();
                        t2.clear();
                      });
                    }
                  },
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Center(
                            child: Icon(
                          Icons.send,
                          color: Colors.white,
                        )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        const Center(
                            child: Text(
                          "Sent",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'RobotoSlab'),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05,
                    left: 21,
                    right: 21,
                    bottom: MediaQuery.of(context).size.height * 0.034),
                child: Text(
                  "Alternatively, you can also report bugs and errors on following platforms",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'RobotoSlab',
                    color: Colors.blueGrey[600],
                    fontSize: 17,
                    height: 1.3,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => launchUrl(
                        "https://github.com/Alis-Desai/Property_Master/issues"),
                    child: const Icon(
                      FontAwesomeIcons.github,
                      color: Colors.orange,
                      size: 35,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.06,
                  ),
                  GestureDetector(
                    onTap: () => launchUrl(
                        "https://play.google.com/store/apps/details?id=com.lifeplusapp&hl=en_IN"),
                    child: const Icon(FontAwesomeIcons.googlePlay,
                        color: Color(0xfffb3958), size: 35),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.06,
                  ),
                  GestureDetector(
                    onTap: () => _launchURLMail(),
                    child: const Icon(FontAwesomeIcons.at,
                        color: Color(0xff1DA1F2), size: 35),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
