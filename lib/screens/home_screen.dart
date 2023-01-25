import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'constant.dart';
import 'favourite.dart';
import 'postproject.dart';
import 'propertydetail.dart';
import 'signin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  final storage = const FlutterSecureStorage();
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: kDefaultPadding),
            height: MediaQuery.of(context).size.height * 0.2,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2 - 25,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Welcome, User',
                        style: TextStyle(
                          color: kBackgroundColor,
                          fontSize: 23,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    height: 54,
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 40,
                          color: kPrimaryColor.withOpacity(0.22),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  color: kPrimaryColor.withOpacity(0.4),
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.search,
                            size: 30,
                            color: kPrimaryColor.withOpacity(0.4),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const propertyDetail(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 330,
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
                        height: 170,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Image.asset(
                          "assets/images/property1.jpg",
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        margin: const EdgeInsets.only(right: 20, top: 20),
                        child: const Icon(Icons.favorite),
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
                            'ProjectName',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: kTextColor),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 13),
                          alignment: Alignment.topRight,
                          height: 20,
                          width: MediaQuery.of(context).size.width / 2,
                          child: const Text(
                            'price' "/sq ft",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: kTextColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
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
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
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
                            text: 'surat',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
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
                            text: 'Commercial / Residential',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
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
                            text: 'Completed / Underconstruction',
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
          ),
        ],
      ),
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
                        width: 180,
                        height: 180,
                        child: Image.asset(
                          "assets/images/profile.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 45.0)),
                      const Text(
                        // FirebaseAuth.instance.currentUser!.displayName!,
                        "myName",
                        style: TextStyle(
                            fontSize: 22.0,
                            color: Color.fromARGB(255, 35, 60, 202)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
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
                        FirebaseAuth.instance.currentUser!.email!,
                        // "meetdobariya6868@gmail.com",
                        style:
                            const TextStyle(fontSize: 11, color: Colors.black),
                      ),
                    ],
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
                Navigator.of(context).pushReplacement(
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
            const Divider(
              color: kPrimaryColor,
            ),
            Container(
              height: 70.0,
              child: Row(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(
                    left: 10.0,
                  )),
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Text(
                        "Contact Us",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Padding(padding: EdgeInsets.only(left: 10.0)),
                      Text(
                        "9016071000",
                        style: TextStyle(fontSize: 15.0, color: Colors.blue),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 132.0,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          "assets/images/call.png",
                        ),
                      ),
                    ),
                    height: 30.0,
                    width: 30.0,
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
                await FirebaseAuth.instance.signOut();
                await storage.delete(key: "uid");
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SigninPage(),
                    ),
                    (route) => false);
              },
            )
          ],
        ),
      ),
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

  Future<void> resetpassword() async {
    User? _auth = FirebaseAuth.instance.currentUser;
    _auth!.sendEmailVerification();
  }
}
