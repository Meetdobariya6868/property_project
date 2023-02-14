import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constant.dart';
import 'signin.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  List<String> lst1 = ['User', 'Builder'];
  int selectedIndex = 0;
  final _formKey = GlobalKey<FormState>();

  // RegExp pass_valid = RegExp(r"(?=.*/d)(?=.*[a-z])(?=.*[A-Z])"); //(?=.*\W)
  // bool validatePassword(String pass) {
  //   String _password = pass.trim();

  //   if (pass_valid.hasMatch(_password)) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

//this Expression for password :
  bool isValidEmail(String email) {
    final RegExp regex =
        RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }

  bool hasUpperCase(String value) {
    return value.contains(new RegExp(r'[A-Z]'));
  }

  bool hasLowerCase(String value) {
    return value.contains(new RegExp(r'[a-z]'));
  }

  bool hasNumber(String value) {
    return value.contains(new RegExp(r'[0-9]'));
  }

  bool hasSpecialChar(String value) {
    return value.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

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
    nameController.dispose();
    emailController.dispose();
    mobilenoController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  CollectionReference users = FirebaseFirestore.instance.collection('User');

  Future<void> addUser() {
    //   String name, String email, int mobileno, String password) async {
    // await FirebaseFirestore.instance.collection('users').add({
    //   'name': name,
    //   'email': email,
    //   'mono': mobileno,
    //   'password': password,
    // });

    return users
        .add({
          'name': name,
          'email': email,
          'mono': mono,
          // 'password': password,
          // 'cpassword': confirmPassword
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }
  // clearText() {
  //   nameController.clear();
  //   numberController.clear();
  //   passwordController.clear();
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
                                      return 'Please Enter Username';
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
                                "Your Email : ",
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
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Email';
                                    } else if (!isValidEmail(value)) {
                                      return 'Please Enter Valid Email';
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
                                "Your Mobile Number : ",
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
                                      return 'Please Enter Mobile Number';
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
                                    if (value!.isEmpty) {
                                      return 'Please enter a password';
                                    } else if (value.length < 6) {
                                      return 'Password must be at least 8 characters long';
                                    } else if (!hasUpperCase(value)) {
                                      return 'Password must contain at least one uppercase letter';
                                    } else if (!hasLowerCase(value)) {
                                      return 'Password must contain at least one lowercase letter';
                                    } else if (!hasNumber(value)) {
                                      return 'Password must contain at least one number';
                                    } else if (!hasSpecialChar(value)) {
                                      return 'Password must contain at least one special character';
                                    }
                                    return null;
                                  },

                                  // validator: (value) {
                                  // //   if (value!.isEmpty || value.length <= 5) {
                                  // //     return 'Password Should not empty!';
                                  // //   } else {
                                  // //     bool result = validatePassword(value);
                                  // //     if (result) {
                                  // //       return null;
                                  // //     } else {
                                  // //       return 'Password must contain Capital, Small letter & number';
                                  // //     }
                                  // //   }
                                  // // },
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
                                // if (_formKey.currentState!.validate()) {
                                //   setState(() {
                                //     email = emailController.text;
                                //     password = passwordController.text;
                                //     confirmPassword =
                                //         confirmPasswordController.text;
                                //   });
                                //   registration();
                                // }
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    name = nameController.text;
                                    mono = mobilenoController.text;
                                    password = passwordController.text;
                                    email = emailController.text;
                                    confirmPassword =
                                        confirmPasswordController.text;
                                    //////////
                                    addUser();
                                    //     nameController.text,
                                    //     emailController.text,
                                    //     int.parse(mobilenoController.text),
                                    //     passwordController.text);
                                  });
                                }
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
