import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../screens/propertydetail.dart';

class Project_Category_Search extends StatefulWidget {
  final String pn;
  const Project_Category_Search({Key? key, required this.pn}) : super(key: key);

  @override
  State<Project_Category_Search> createState() =>
      _Project_Category_SearchState();
}

class _Project_Category_SearchState extends State<Project_Category_Search> {
  List projectnameListResult = [];
  late String id;

  final Query query1 = FirebaseFirestore.instance
      .collection("propertyDetails")
      .where("project name", isEqualTo: "Hemilton");

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

  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    fetchProjectnameList();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: (widget.pn != "")
            ? FirebaseFirestore.instance
                .collection("propertyDetails")
                .where('category', isEqualTo: widget.pn)
                .snapshots()
            : FirebaseFirestore.instance
                .collection("propertyDetails")
                .snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];
                    return GestureDetector(
                      onTap: () {
                        FirebaseFirestore.instance
                            .collection("propertyDetails")
                            .get()
                            .then(
                              (value) => {
                                id = data.id,
                                print("${data.id}"),
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => propertyDetail(
                                      value: id,
                                      u2: '',
                                      v1: 0,
                                    ),
                                  ),
                                ),
                              },
                            );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
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
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20))),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    child: Image.network(
                                      data['firstImage'],
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 13),
                                    height: 30,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      data['projectName'],
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 13),
                                    alignment: Alignment.topRight,
                                    height: 30,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      data['price'],
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 7),
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
                                          text: data['postedBy'],
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400))
                                    ]),
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
                                        text: data['city'],
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ]),
                              ),
                            ),
                            const SizedBox(height: 7),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(left: 13),
                              child: RichText(
                                text: TextSpan(
                                    text: "Type : ",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                    children: [
                                      TextSpan(
                                        text: data['category'],
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ]),
                              ),
                            ),
                            const SizedBox(height: 7),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(left: 13),
                              child: RichText(
                                text: TextSpan(
                                    text: "Status : ",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                    children: [
                                      TextSpan(
                                          text: data['status'],
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400))
                                    ]),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
        });
  }
}
