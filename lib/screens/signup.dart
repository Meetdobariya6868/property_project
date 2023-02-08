import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';
import 'signin.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  List<String> lst1 = ['User', 'Builder'];
  int selectedIndex = 0;
  final _formKey = GlobalKey<FormState>();
  var name = "";
  var email = "";
  var mono = "";
  var password = "";
  var confirmPassword = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobilenoController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // void validation(){
  //   if () {

  //   }
  // }

  // registration() async {
  //   if (password == confirmPassword) {
  //     try {
  //       UserCredential userCredential = await FirebaseAuth.instance
  //           .createUserWithEmailAndPassword(email: email, password: password);
  //       print(userCredential);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           backgroundColor: Color(0xffF50057),
  //           content: Text(
  //             "Registered Successfully. Please Login..",
  //             style: TextStyle(fontSize: 20.0, color: Colors.black),
  //           ),
  //         ),
  //       );
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => SigninPage(),
  //         ),
  //       );
  //     } on FirebaseAuthException catch (e) {
  //       if (e.code == 'weak-password') {
  //         print("Password Provided is too Weak");
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             backgroundColor: Color(0xffF50057),
  //             content: Text(
  //               "Password Provided is too Weak",
  //               style: TextStyle(fontSize: 18.0, color: Colors.black),
  //             ),
  //           ),
  //         );
  //       } else if (e.code == 'email-already-in-use') {
  //         print("Account Already exists");
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             backgroundColor: Color(0xffF50057),
  //             content: Text(
  //               "Account Already exists",
  //               style: TextStyle(fontSize: 18.0, color: Colors.black),
  //             ),
  //           ),
  //         );
  //       }
  //     }
  //   } else {
  //     print("Password and Confirm Password doesn't match");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Color(0xffF50057),
  //         content: Text(
  //           "Password and Confirm Password doesn't match",
  //           style: TextStyle(fontSize: 16.0, color: Colors.black),
  //         ),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Form(
        key: _formKey,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: kPrimaryColor.withOpacity(0.15),
                            ),
                            child: IconButton(
                              onPressed: () {
                                // Get.back();
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: kPrimaryColor,
                              ),
                              iconSize: 25,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              "Create Account with Email",
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [],
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customRadio(lst1[0], 0),
                          const SizedBox(
                            width: 10,
                          ),
                          customRadio(lst1[1], 1),
                          const SizedBox(
                            width: 10,
                          ),
                          // customRadio(lst1[2], 2),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Your name : ",
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                    color: kBackgroundColor),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter username';
                                    }
                                    return null;
                                  },
                                  controller: nameController,
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(
                                    fontSize: 17,
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    hintText: "Narendra Modi",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Your email : ",
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                    color: kBackgroundColor),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !value.contains('@gmail.com')) {
                                      return 'invalid email';
                                    }
                                    return null;
                                  },
                                  onSaved: (mail) {
                                    email = mail!;
                                  },
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    // fontFamily: "Poppins",
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    hintText: "Example@gmail.com",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Your mobile number : ",
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                    color: kBackgroundColor),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter mobile number';
                                    }
                                    return null;
                                  },
                                  onSaved: (no) {
                                    mono = no!;
                                  },
                                  controller: mobilenoController,
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    // fontFamily: "Poppins",
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    hintText: "0123456789",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Password : ",
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                    color: kBackgroundColor),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty || value.length <= 5) {
                                      return 'invalid password';
                                    }
                                    return null;
                                  },
                                  onSaved: (pass) {
                                    password = pass!;
                                  },
                                  controller: passwordController,
                                  obscureText: true,
                                  style: const TextStyle(
                                    fontSize: 17,
                                  ),
                                  decoration: const InputDecoration(
                                    // prefixIcon: Icon(Icons.lock),
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    hintText: "Password",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Confirm Password : ",
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                    color: kBackgroundColor),
                                child: TextFormField(
                                  validator: (value) {
                                    if (confirmPasswordController.text.length >
                                            6 &&
                                        passwordController.text != value) {
                                      return "Password don't match";
                                    }
                                    return null;
                                  },
                                  controller: confirmPasswordController,
                                  obscureText: true,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    // fontFamily: "Poppins",
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    hintText: "Confirm password",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                signUp();
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 45),
                                backgroundColor: kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                elevation: 0,
                              ),
                              child: const Text("Create Account"),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
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
                                          builder: (context) =>
                                              const SigninPage(),
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
                                      fontFamily: "Poppins",
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
            )
          ],
        ),
      )),
    );
  }

  void signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString());
        User? updateUser = FirebaseAuth.instance.currentUser;
        updateUser!.updateProfile(displayName: name.toString());

        // userSetup(nameController.text, emailController.text, mobilenoController.text,lst1[selectedIndex], "");
        if (updateUser != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('email', email);
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: kPrimaryColor,
            content: Text(
              "Registered Successfully. Please Login...",
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SigninPage(),
          ),
        );
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print("Password Provided is too Weak");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: kPrimaryColor,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          print("Account Already exists");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: kPrimaryColor,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          );
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Password and Confirm Password doesn't match");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: kPrimaryColor,
          content: Text(
            "Password and Confirm Password doesn't match",
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
        ),
      );
      // nameController.clear();
      // passwordController.clear();
      // emailController.clear();
      // mobilenoController.clear();
      // confirmPasswordController.clear();
      // Navigator.pop(context);
    }
  }

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget customRadio(String txt, int index) {
    return OutlinedButton(
      onPressed: () => changeIndex(index),
      style: const ButtonStyle(),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10.0),
      // ),
      // borderSide: BorderSide(color: selectedIndex == index ? Colors.indigo : Colors.grey),
      child: Text(
        txt,
        style: TextStyle(
            color: selectedIndex == index ? kPrimaryColor : Colors.grey),
      ),
    );
  }
}
