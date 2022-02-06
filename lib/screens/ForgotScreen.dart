import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'login_screen.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        decoration: BoxDecoration(
            gradient: new LinearGradient(
                colors: [Color(0xFFffbf86), Color(0xFFffbf86)])),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Container(
                  height: height * 0.15,
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.15),
                  height: height * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: ListView(
                    children: [
                      SizedBox(height: height * 0.08),
                      Text(
                        'reset password'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFff8e26)),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Center(
                        child: Container(
                          height: 1,
                          width: width * 0.8,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.15,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              //controller:controller,
                              hintText: "Your Email * ",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    width: 1,
                                    style: BorderStyle.solid,
                                    color: Color(0xFFff8e26)),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: EdgeInsets.all(12),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    width: 1,
                                    style: BorderStyle.solid,
                                    color: Colors.grey),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: height * 0.08,
                      ),
                      Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 26, vertical: 10),
                          decoration: BoxDecoration(
                              gradient: new LinearGradient(colors: [
                                Color(0xFFff8e26),
                                Color(0xFFff8e26)
                              ]),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0xFFff8e26),
                                    offset: Offset(2, 2))
                              ]),
                          child: GestureDetector(
                            onTap: () async {
                              resetPassword(context);
                              // await FirebaseAuth.instance.sendPasswordResetEmail(email: controller.text)
                              //     .then((value) => Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) =>LoginScreen())));
                            },
                            child: Text(
                              "Reset".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

void resetPassword(BuildContext context) async {
  TextEditingController controller = TextEditingController();
  if (controller.text.length == 0 || !controller.text.contains("@")) {
    Fluttertoast.showToast(msg: "Enter valid email");
    return;
  }

  await FirebaseAuth.instance.sendPasswordResetEmail(email: controller.text);
  Fluttertoast.showToast(
      msg:
          "Reset password link has sent your mail please use it to change the password.");
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => LoginScreen()));
}
