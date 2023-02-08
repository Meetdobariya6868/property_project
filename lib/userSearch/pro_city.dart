import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Project_City_Search extends StatefulWidget {
  final String pn;
  const Project_City_Search({Key? key, required this.pn}) : super(key: key);

  @override
  State<Project_City_Search> createState() => _Project_City_SearchState();
}

class _Project_City_SearchState extends State<Project_City_Search> {

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

    if(projectnameResult == null) {
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
    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: (widget.pn != "" && widget.pn != null)
              ? FirebaseFirestore
              .instance
              .collection("propertyDetails")
              .where('city', isEqualTo: widget.pn)
              .snapshots()
              : FirebaseFirestore.instance.collection("propertyDetails").snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot data = snapshot.data!.docs[index];
                return GestureDetector(
                  onTap: () {
                    // FirebaseFirestore.instance.collection("propertyDetails").get().then((value) => {
                    //   id = data.documentID,
                    //   //print("${data.documentID}"),
                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => propertyDetail(value: id)))
                    // });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 320,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20)
                                  )
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)
                                ),
                                child: Image.network(
                                  data['firstImage'],
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.fill,
                                ),
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
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  data['projectName'],
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold
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
                                  data['price'],
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            )
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
                                    fontWeight: FontWeight.w700
                                ),
                                children: [
                                  TextSpan(
                                      text: data['postedBy'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400
                                      )
                                  )
                                ]
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
                                    fontWeight: FontWeight.w700
                                ),
                                children: [
                                  TextSpan(
                                    text: data['city'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400
                                    ),
                                  )
                                ]
                            ),
                          ),
                        ),
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
                                    fontWeight: FontWeight.w700
                                ),
                                children: [
                                  TextSpan(
                                    text: data['category'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400
                                    ),
                                  )
                                ]
                            ),
                          ),
                        ),
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
                                    fontWeight: FontWeight.w700
                                ),
                                children: [
                                  TextSpan(
                                      text: data['status'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400
                                      )
                                  )
                                ]
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
      ),
    );
  }
}
