import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/databaseManager.dart';
import 'constant.dart';
import 'favourite.dart';
import 'myPost.dart';
import 'my_homePage.dart';
import 'postproject.dart';
import 'propertydetail.dart';
import 'signin.dart';
import 'userSearch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static Future openEmail({
    required String toEmail,
    required String subject,
    required String body,
  }) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';

    await _launchUrl(url);
  }

  static Future openPhoneCall({required String phoneNumber}) async {
    final url = 'tel:$phoneNumber';

    await _launchUrl(url);
  }

  static Future _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
  openUrl() {
    String url = "https://anyror.gujarat.gov.in/";
    _launchUrl(url);
  }

  final List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    MyPost(),
    PostProperty(),
    userSearch(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;
  // final _auth= FirebaseAuth.instance.currentUser;
  late String myEmail;
  late String myName;
  late String myPhone;
  late String myPhoto;
  // List userProfilesList = [];

  // final storage = const FlutterSecureStorage();
  // User? user = FirebaseAuth.instance.currentUser;
  // @override
  // void initState() {
  //   super.initState();
  //   fetchDatabaseList();
  // }

  // fetchDatabaseList() async {
  //   dynamic resultant = await DatabaseManager().getUsersList();
  //
  //   if (resultant == null) {
  //     print('Unable to retrieve');
  //   } else {
  //     setState(() {
  //       userProfilesList = resultant;
  //     });
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Text("Mapview", style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewMap()));
            },
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Icon(Icons.notifications),
                ],
              ),
            ),
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FirebaseMessagingDemo()));
            },
          ),
        ],
      ),

      // body: ListView(
      //   children: [
      //     Container(
      //       margin: const EdgeInsets.only(bottom: kDefaultPadding),
      //       height: MediaQuery.of(context).size.height * 0.2,
      //       child: Stack(
      //         children: [
      //           Container(
      //             height: MediaQuery.of(context).size.height * 0.2 - 25,
      //             decoration: const BoxDecoration(
      //               color: kPrimaryColor,
      //               borderRadius: BorderRadius.only(
      //                 bottomLeft: Radius.circular(50),
      //                 bottomRight: Radius.circular(50),
      //               ),
      //             ),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: const [
      //                 Text(
      //                   'Welcome, User',
      //                   style: TextStyle(
      //                     color: kBackgroundColor,
      //                     fontSize: 23,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Positioned(
      //             bottom: 0,
      //             left: 0,
      //             right: 0,
      //             child: Container(
      //               margin:
      //                   const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      //               height: 54,
      //               decoration: BoxDecoration(
      //                 color: kBackgroundColor,
      //                 borderRadius: BorderRadius.circular(20),
      //                 boxShadow: [
      //                   BoxShadow(
      //                     offset: const Offset(0, 10),
      //                     blurRadius: 40,
      //                     color: kPrimaryColor.withOpacity(0.22),
      //                   ),
      //                 ],
      //               ),
      //               child: Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Row(
      //                   children: [
      //                     Expanded(
      //                       child: TextField(
      //                         onChanged: (value) {},
      //                         decoration: InputDecoration(
      //                           hintText: 'Search',
      //                           hintStyle: TextStyle(
      //                             color: kPrimaryColor.withOpacity(0.4),
      //                           ),
      //                           enabledBorder: InputBorder.none,
      //                           focusedBorder: InputBorder.none,
      //                         ),
      //                       ),
      //                     ),
      //                     Icon(
      //                       Icons.search,
      //                       size: 30,
      //                       color: kPrimaryColor.withOpacity(0.4),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     GestureDetector(
      //       onTap: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(
      //             builder: (context) => const propertyDetail(),
      //           ),
      //         );
      //       },
      //       child: Container(
      //         margin: const EdgeInsets.all(10),
      //         height: 330,
      //         width: MediaQuery.of(context).size.width * 0.9,
      //         decoration: BoxDecoration(
      //           color: kBackgroundColor,
      //           borderRadius: BorderRadius.circular(20),
      //         ),
      //         child: Column(
      //           children: [
      //             Stack(
      //               children: [
      //                 Container(
      //                   height: 170,
      //                   decoration: const BoxDecoration(
      //                     borderRadius: BorderRadius.only(
      //                       topLeft: Radius.circular(20),
      //                       topRight: Radius.circular(20),
      //                     ),
      //                   ),
      //                   child: Image.asset(
      //                     "assets/images/property1.jpg",
      //                     width: MediaQuery.of(context).size.width,
      //                     fit: BoxFit.fill,
      //                   ),
      //                 ),
      //                 Container(
      //                   alignment: Alignment.topRight,
      //                   margin: const EdgeInsets.only(right: 20, top: 20),
      //                   child: const Icon(Icons.favorite),
      //                 ),
      //               ],
      //             ),
      //             const SizedBox(
      //               height: 5,
      //             ),
      //             Row(
      //               children: [
      //                 Expanded(
      //                   child: Container(
      //                     margin: const EdgeInsets.only(left: 13),
      //                     height: 35,
      //                     width: MediaQuery.of(context).size.width / 2,
      //                     child: const Text(
      //                       'ProjectName',
      //                       style: TextStyle(
      //                           fontSize: 25,
      //                           fontWeight: FontWeight.bold,
      //                           color: kTextColor),
      //                     ),
      //                   ),
      //                 ),
      //                 Expanded(
      //                   child: Container(
      //                     margin: const EdgeInsets.only(right: 13),
      //                     alignment: Alignment.topRight,
      //                     height: 20,
      //                     width: MediaQuery.of(context).size.width / 2,
      //                     child: const Text(
      //                       'price' "/sq ft",
      //                       style: TextStyle(
      //                           fontSize: 15,
      //                           fontWeight: FontWeight.bold,
      //                           color: kTextColor),
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             const SizedBox(height: 10),
      //             Container(
      //               alignment: Alignment.topLeft,
      //               margin: const EdgeInsets.only(left: 13),
      //               child: RichText(
      //                 text: const TextSpan(
      //                   text: "Posted by : ",
      //                   style: TextStyle(
      //                       fontSize: 18,
      //                       color: Colors.black,
      //                       fontWeight: FontWeight.w700),
      //                   children: [
      //                     TextSpan(
      //                       // text: "Builder",
      //                       text: 'Owner',
      //                       style: TextStyle(
      //                           fontSize: 16, fontWeight: FontWeight.w400),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 7,
      //             ),
      //             Container(
      //               alignment: Alignment.topLeft,
      //               margin: const EdgeInsets.only(left: 13),
      //               child: RichText(
      //                 text: const TextSpan(
      //                   text: "Location : ",
      //                   style: TextStyle(
      //                       fontSize: 18,
      //                       color: Colors.black,
      //                       fontWeight: FontWeight.w700),
      //                   children: [
      //                     TextSpan(
      //                       text: 'surat',
      //                       style: TextStyle(
      //                           fontSize: 18,
      //                           color: Colors.black,
      //                           fontWeight: FontWeight.w400),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 7,
      //             ),
      //             Container(
      //               alignment: Alignment.topLeft,
      //               margin: const EdgeInsets.only(left: 13),
      //               child: RichText(
      //                 text: const TextSpan(
      //                   text: "Type : ",
      //                   style: TextStyle(
      //                       fontSize: 18,
      //                       color: Colors.black,
      //                       fontWeight: FontWeight.w700),
      //                   children: [
      //                     TextSpan(
      //                       text: 'Commercial / Residential',
      //                       style: TextStyle(
      //                           fontSize: 18,
      //                           color: Colors.black,
      //                           fontWeight: FontWeight.w400),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 7,
      //             ),
      //             Container(
      //               alignment: Alignment.topLeft,
      //               margin: const EdgeInsets.only(left: 13),
      //               child: RichText(
      //                 text: const TextSpan(
      //                   text: "Status : ",
      //                   style: TextStyle(
      //                       fontSize: 18,
      //                       color: Colors.black,
      //                       fontWeight: FontWeight.w700),
      //                   children: [
      //                     TextSpan(
      //                       text: 'Completed / Underconstruction',
      //                       style: TextStyle(
      //                           fontSize: 18,
      //                           color: Colors.black,
      //                           fontWeight: FontWeight.w400),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35,
                    child: ClipOval(
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset(
                          "assets/images/profile.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: FutureBuilder(
                      future: _fetch(),
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                        if(snapshot.connectionState!=ConnectionState.done) {
                          return Text("Loading....");
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 45.0)),
                            Text(
                              // FirebaseAuth.instance.currentUser!.displayName!,
                              "myName",
                              style: TextStyle(
                                  fontSize: 22.0,
                                  color: Color.fromARGB(255, 35, 60, 202)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              // FirebaseAuth.instance.currentUser!.phoneNumber!,
                              "myPhone",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Color.fromARGB(255, 47, 209, 193)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "myEmail",
                              // "meetdobariya6868@gmail.com",
                              style:
                              const TextStyle(fontSize: 11, color: Colors.black),
                            ),
                          ],
                        );
                      },

                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.home_outlined),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Text(
                    "Home",
                  )
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.favorite_border_outlined),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Text("Favourite")
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MyFavoritePost(),
                  ),
                );
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.add_box_outlined),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Text("Post Property"),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PostProperty(),
                  ),
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.food_bank_outlined),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Text("Sold property")
                ],
              ),
              // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Sold_Property())),
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.home_outlined),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Text("New Project")
                ],
              ),
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>viewNewProject()));
              },
            ),
            ListTile(
              title:Row(
                children: [
                  Icon(Icons.calculate_outlined),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Text("EMI Calculator")
                ],
              ),
              onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>emiCalculator()));
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.open_in_browser_outlined),
                  SizedBox(width: 25),
                  Text("Govt. Circulars")
                ],
              ),
              onTap: () {
                openUrl();
              },
            ),
            const Divider(
              color: kPrimaryColor,
            ),
            Container(
              height: 70.0,
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10.0,)),
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      Text("Contact Us",style: TextStyle(fontSize: 20.0,),),
                      SizedBox(height: 3.0,),
                      // Padding(padding: EdgeInsets.only(left: 10.0)),
                      // Text("9988776655",style: TextStyle(fontSize: 15.0,color: Colors.blue),)
                    ],
                  ),
                  SizedBox(width: 80.0,),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/call.png",)
                        ),
                      ),
                      height: 30.0,
                      width: 30.0,
                    ),
                    onTap: (){
                      openPhoneCall(phoneNumber: '(+91)9016071000');
                    },
                  ),
                  SizedBox(width: 20.0,),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/call.png",)
                        ),
                      ),
                      height: 50.0,
                      width: 50.0,
                    ),
                    onTap: (){
                      openEmail(toEmail: 'akdesai123@gmail.com', subject: '', body: '');
                    },
                  )
                ],
              ),
            ),
            const Divider(
              color: kPrimaryColor,
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.info_outline),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Text("About Us")
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.privacy_tip_outlined),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Text("Privacy Policy")
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.announcement_outlined),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Text("Terms & Condition")
                ],
              ),
            ),
            const Divider(
              color: kPrimaryColor,
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(
                    Icons.logout,
                  ),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Text("Log-Out"),
                ],
              ),
              onTap: () async {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder:(BuildContext context){
                      return AlertDialog(
                        title: Text("Are you sure?"),
                        contentPadding: EdgeInsets.all(10),
                        actions: <Widget>[
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: (){
                                    signOut().whenComplete(()=>Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>SigninPage()), (Route<dynamic>route) => false));
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    child: Text("Yes",style: TextStyle(color: Colors.blue,fontSize: 20),),
                                  )
                              ),
                              SizedBox(width: 20,),
                              GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    child: Text("No",style: TextStyle(color: Colors.blue,fontSize: 20),),
                                  )
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                );
              },
            )
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
                _selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined,
                color: kIconColor),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 1
                  ? Icons.photo_library
                  : Icons.photo_library_outlined,
              color: kIconColor,
            ),
            label: 'My Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                _selectedIndex == 2
                    ? Icons.add_box_rounded
                    : Icons.add_box_outlined,
                color: kIconColor),
            label: 'Add',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search, color: kIconColor),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                _selectedIndex == 4
                    ? Icons.account_circle
                    : Icons.account_circle_outlined,
                color: kIconColor),
            label: 'My Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kIconColor,
        onTap: _onItemTapped,
      ),
    );
  }
  Future<SigninPage> signOut() async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.remove('email');
    //prefs.remove('phoneNumber');
    await FirebaseAuth.instance.signOut();
    return SigninPage();
  }

  _fetch() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if(firebaseUser!=null){
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(firebaseUser.uid)
          .get()
          .then((value){
        myEmail=value.data()!['email'];
        myName=value.data()!['name'];
        myPhone=value.data()!['mobileNumber'];
        myPhoto=value.data()!['Image'];
        // print(myEmail);
        // print(myName);
        // print(myPhone);
      }).catchError((e){
        print(e);
      });
    }
  }
  Future<void> resetpassword() async {
    User? _auth = FirebaseAuth.instance.currentUser;
    _auth!.sendEmailVerification();
  }
}
