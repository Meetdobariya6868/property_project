import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, GoogleAuthProvider, User, UserCredential;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'constant.dart';
import 'home_screen.dart';
import 'signin.dart';
import 'signup.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}
class _WelcomePageState extends State<WelcomePage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User get user => _auth.currentUser!;

  Future<bool> signInWithGoogle() async {
    bool result = false;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          // add the data to fire base
          await _firestore.collection('users').doc(user.uid).set({
            'uid': user.uid,
            'userEmail': user.email,
            'userImage': user.photoURL,
            'userName': user.displayName,
          });
        }
        result = true;
      }
      if (result != null) {
        Navigator.pushReplacement(
          context as BuildContext,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
      return result;
    } catch (e) {
      print(e);
    }
    return result;
  }

  void signOut() async {
    try {
      _auth.signOut();
    } catch (e) {
      print('can not signOut as : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: const [
                    Text(
                      "Find your property",
                      style: TextStyle(
                        fontSize: 26,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Keep calm and go around the world",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Image.asset(
                  "assets/images/driver.png",
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 45),
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          // fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                        elevation: 0,
                      ),
                      child: const Text("Sign up with email"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: kPrimaryColor,
                        backgroundColor: kBackgroundColor,
                        minimumSize: const Size(double.infinity, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: const BorderSide(width: 1, color: kPrimaryColor),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          // fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                        elevation: 0,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          signInWithGoogle();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/google.png",
                              width: 24,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text("Sign in with Google"),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account ?",
                          style: TextStyle(
                            fontSize: 16,
                            // fontFamily: "Poppins",
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SigninPage(),
                                ));
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: kPrimaryColor,
                            minimumSize: const Size(0, 0),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              // fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
