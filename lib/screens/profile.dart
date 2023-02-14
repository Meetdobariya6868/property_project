import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // late File _image;

  // Future getImage() async {
  // var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  //
  // setState(() {
  //   _image = image as File;
  //   print('Image Path $_image');
  // });
  // }

  // Future uploadPic(BuildContext context) async{
  // List<String> _imageUrls = [];
  // String fileName = basename(_image.path);
  // StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
  // StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
  // StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
  // String imageUrl = await firebaseStorageRef.getDownloadURL();
  // _imageUrls.add(imageUrl);
  // setState(() {
  //   print("Profile Picture uploaded");
  //   Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
  //   FirebaseFirestore.instance.collection('Users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .set({
  //     'Image': _imageUrls[0]
  //   },SetOptions(merge: true)).then((value){
  //     //Do your stuff.
  //   });
  // });

  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text("Loading");
            }
            var userData = snapshot.data;
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 80,
                          child: ClipOval(
                            child: new SizedBox(
                              width: 200.0,
                              height: 200.0,
                              child:
                                  // (userData!['Image']!="")?Image.network(
                                  //   userData['Image'],
                                  //   fit: BoxFit.fill,
                                  // ):
                                  Image.asset(
                                "assets/images/profile.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 165.0,
                        ),
                        child: Center(
                            child: GestureDetector(
                          child: Text(
                            "Edit Photo",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          onTap: () {
                            // getImage();
                          },
                        )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    FirebaseAuth
                                        .instance.currentUser!.displayName!,
                                    // userData!['name'],
                                    // Text("name",
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Divider(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text('Email',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 22.0)),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Container(
                              child: Text(
                                  FirebaseAuth.instance.currentUser!.email!,
                                  // userData!['email'],
                                  // Text("Email",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                            GestureDetector(
                              child: Container(
                                  width: 30.0,
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  )),
                              onTap: () {
                                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>changeEmail()));
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text('Mobile Number',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 22.0)),
                        ),
                        Spacer(),
                        Container(
                          child:
                              // Text(userData!['mobileNumber'],
                              Text('9016071000',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Text('Change Password',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 22.0)),
                        ),
                        Spacer(),
                        GestureDetector(
                          child: Text(
                            "Click Here",
                            style: TextStyle(fontSize: 18, color: Colors.blue),
                          ),
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>changePassword()));
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 160.0,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ElevatedButton(
                      onPressed: () {
                        // uploadPic(context);
                      },
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(35),
                      // ),
                      // color: Colors.indigo,
                      child: Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
