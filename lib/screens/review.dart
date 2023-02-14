import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  final String id1;
  const ReviewPage({super.key, required this.id1});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  bool isAnimate = false;

  final CollectionReference reviewList =
      FirebaseFirestore.instance.collection('propertyDetails');

  List postReviewList = [];
  late String doc_id;
  late String doc_id1;
  TextEditingController _textController = TextEditingController();
  late Stream<QuerySnapshot> reviews;

  getReview() async {
    return reviewList.doc(widget.id1).collection('reviewBox').snapshots();
  }

  var refreshKey = GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    super.initState();
    getReview().then((val) {
      setState(() {
        reviews = val;
      });
    });
    refreshPage();
  }

  Future<Null> refreshPage() async {
    refreshKey.currentState?.show();
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      return;
    });
  }

  final username = FirebaseAuth.instance.currentUser;

  Widget _textComposerWidget() {
    return IconTheme(
      data: const IconThemeData(color: Colors.blue),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                decoration:
                    const InputDecoration.collapsed(hintText: "Send a message"),
                controller: _textController,
                //onSubmitted: _handleSubmitted,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('propertyDetails')
                      .doc(widget.id1)
                      .collection('reviewBox')
                      .doc()
                      .set({
                    "userId": '${FirebaseAuth.instance.currentUser!.uid}',
                    "review": '${_textController.text}',
                    "name": '${FirebaseAuth.instance.currentUser!.displayName}',
                    "firstChar":
                        '${FirebaseAuth.instance.currentUser!.displayName![0]}',
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  final _n1 = FirebaseFirestore.instance.collection('propertyDetails');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: Text('Reviews'),
          backgroundColor: Colors.indigo,
        ),
        // ignore: unrelated_type_equality_checks
        body: StreamBuilder<QuerySnapshot>(
          stream: reviews,
          builder: (context, snapshot) {
            return ListView(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                  ),
                  child: _textComposerWidget(),
                ),
                Divider(height: 1.0),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      //DocumentSnapshot data = snapshot.data.docs[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(right: 16.0),
                              child: CircleAvatar(
                                child: Text('f'),
                                // child: Text(snapshot.data!.docs[index].data()!['firstChar']),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Text(snapshot.data!.docs[index].data()!['name'],
                                Text('name',
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                                Container(
                                  margin: const EdgeInsets.only(top: 5.0),
                                  // child: Text(snapshot.data!.docs[index].data()!['review']),
                                  child: Text('review'),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ],
            );
          },
        ));
  }
}
