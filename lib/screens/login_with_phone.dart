import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({super.key});

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  late String smsCode;
  late String verificationCode;
  late String number;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Mobile Verification",
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.068,
                          padding: const EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Enter Phone Number",
                                  hintStyle: TextStyle(fontSize: 18),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  prefixIcon: Icon(Icons.phone_outlined)),
                              keyboardType: TextInputType.phone,
                              onChanged: (value) {
                                number = value;
                              },
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ElevatedButton(
                          // color: Colors.blue,
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(35.0)
                          // ),
                          child: const Text(
                            "Send OTP",
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            _submit();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> _submit() async {
    verificationSuccess(AuthCredential credential) {
      setState(() {
        print("Verification");
        print(credential);
      });
    }

    phoneVerificationFailed(FirebaseAuthException exception) {
      print("${exception.message}");
    }

    phoneCodeSent(String verId, [int? forceCodeResend]) {
      verificationCode = verId;
      smsCodeDialog(context).then((value) => print("Signed In"));
    }

    autoRetrievalTimeout(String verId) {
      verificationCode = verId;
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: number,
        timeout: const Duration(seconds: 20),
        verificationCompleted: verificationSuccess,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: autoRetrievalTimeout);
  }

  Future smsCodeDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Enter Code"),
            content: TextField(
              onChanged: (value) {
                smsCode = value;
              },
            ),
            contentPadding: const EdgeInsets.all(10),
            actions: <Widget>[
              TextButton(
                child: const Text("Verify"),
                onPressed: () async {
                  var user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('phoneNumber', number);
                    // User _auth=FirebaseAuth.instance.currentUser;
                    // FirebaseFirestore.instance.collection('Users').doc(_auth.uid).set({'phoneNumber':number});
                  } else {
                    Navigator.of(context).pop();
                    signIn();
                  }
                },
              )
            ],
          );
        });
  }

  signIn() {
    AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationCode, smsCode: smsCode);
    FirebaseAuth.instance
        .signInWithCredential(phoneAuthCredential)
        .then((value) => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            ))
        .catchError((e) => print(e));
  }
}
