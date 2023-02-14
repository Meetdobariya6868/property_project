// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../userSearch/pro_SOR.dart';
import '../userSearch/pro_category.dart';
import '../userSearch/pro_city.dart';
import '../userSearch/pro_landmark.dart';
import '../userSearch/pro_postedBy.dart';
import '../userSearch/pro_status.dart';

class userSearch extends StatefulWidget {
  const userSearch({Key? key}) : super(key: key);

  @override
  State<userSearch> createState() => _userSearchState();
}

class _userSearchState extends State<userSearch> {
  int _value2_2 = 0;
  //List Items1 = ["User", "Property"];
  //List Items2_1 = ["Name", "Email", "Mobile Number"];
  List Items2_2 = [
    "Category",
    "City",
    "Landmark",
    "Sell or Rent",
    "Status",
    "PostedBy"
  ];

  List projectnameListResult = [];
  List cityListResult = [];
  List areaListResult = [];
  String name = "";

  @override
  void initState() {
    super.initState();
    fetchProjectnameList();
    fetchAreaList();
    fetchCityList();
  }

  final Query query1 = FirebaseFirestore.instance
      .collection("propertyDetails")
      .where('projectName', isEqualTo: "Hemilton")
      .where('city', isEqualTo: "Surat");

  final Query query2 = FirebaseFirestore.instance
      .collection("propertyDetails")
      .where("landmark", isEqualTo: "Katargam")
      .where("city", isEqualTo: "New delhi");

  final Query query3 = FirebaseFirestore.instance
      .collection("propertyDetails")
      .where("city", isEqualTo: "Surat");

  Future getProjectnameWithSearch() async {
    List projectnameList = [];
    try {
      await query1.get().then((querySnapshot) => {
            querySnapshot.docs.forEach((element) {
              projectnameList.add(element.data());
            })
          });
      return projectnameList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getCityWithSearch() async {
    List cityList = [];
    try {
      await query3.get().then((querySnapshot) => {
            querySnapshot.docs.forEach((element) {
              cityList.add(element.data());
            })
          });
      return cityList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getAreaWithSearch() async {
    List areaList = [];
    try {
      await query2.get().then((querySnapshot) => {
            querySnapshot.docs.forEach((element) {
              areaList.add(element.data());
            })
          });
      return areaList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  fetchProjectnameList() async {
    dynamic projectnameResult = await getProjectnameWithSearch();

    if (projectnameResult == null) {
      print("Unable to retrieve");
    } else {
      setState(() {
        projectnameListResult = projectnameResult;
      });
    }
  }

  fetchAreaList() async {
    dynamic areaResult = await getAreaWithSearch();

    if (areaResult == null) {
      print("Unable to retrieve");
    } else {
      setState(() {
        areaListResult = areaResult;
      });
    }
  }

  fetchCityList() async {
    dynamic cityResult = await getCityWithSearch();

    if (cityResult == null) {
      print("Unable to retrieve");
    } else {
      setState(() {
        cityListResult = cityResult;
      });
    }
  }

  TextEditingController adminSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
            child: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(right: 15, left: 15),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       SizedBox(width: 8),
                  //       DropdownButton(
                  //           value: _value2_2,
                  //           items: [
                  //             DropdownMenuItem(
                  //               child: Text("Category", style: TextStyle(fontWeight: FontWeight.bold),),
                  //               value: 0,
                  //             ),
                  //             DropdownMenuItem(
                  //               child: Text("City",  style: TextStyle(fontWeight: FontWeight.bold)),
                  //               value: 1,
                  //             ),
                  //             DropdownMenuItem(
                  //               child: Text("Landmark",  style: TextStyle(fontWeight: FontWeight.bold)),
                  //               value: 2,
                  //             ),
                  //             DropdownMenuItem(
                  //               child: Text("Sell or Rent",  style: TextStyle(fontWeight: FontWeight.bold)),
                  //               value: 3,
                  //             ),
                  //             DropdownMenuItem(
                  //               child: Text("Status",  style: TextStyle(fontWeight: FontWeight.bold)),
                  //               value: 4,
                  //             ),
                  //             DropdownMenuItem(
                  //               child: Text("PostedBy",  style: TextStyle(fontWeight: FontWeight.bold)),
                  //               value: 5,
                  //             )
                  //           ],
                  //           onChanged: (value) {
                  //             setState(() {
                  //               _value2_2 = value!;
                  //             });
                  //             print(Items2_2[_value2_2]);
                  //           }),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    width: MediaQuery.of(context).size.width * 0.92,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Search",
                        hintStyle: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                      onChanged: (val) {
                        setState(() {
                          name = val;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            if (Items2_2[_value2_2] == "Category")
              Project_Category_Search(pn: name)
            else if (Items2_2[_value2_2] == "Landmark")
              Project_Landmark_Search(pn: name)
            else if (Items2_2[_value2_2] == "City")
              Project_City_Search(pn: name)
            else if (Items2_2[_value2_2] == "Sell or Rent")
              Project_SOR_Search(pn: name)
            else if (Items2_2[_value2_2] == "Status")
              Project_Status_Search(pn: name)
            else if (Items2_2[_value2_2] == "PostedBy")
              Project_PostedBy_Search(pn: name)
            else
              Container()
          ],
        )));
  }
}
