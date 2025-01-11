
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_1/basic_module/fb_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key}); //remove because of final emailCtrl and passwordCtrl variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _buildInkWell(),
            _buildEmailTextField(),
            _buildRegistrationButton()
          ],
        ));
  }

  Widget _buildInkWell() {
    return InkWell(
        onTap: () {
          debugPrint("Print Clicked");
        },
        child: Image.network(
            "https://img.freepik.com/free-psd/instagram-application-logo_23-2151544094.jpg"));
  }

  // final _emailCtrl = TextEditingController();
  // final _passwordCtrl = TextEditingController();

  Widget _buildEmailTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.yellow),
      ),
      child: Column(
        children: [
          TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              iconColor: Colors.pinkAccent,
              hintText: "Please Enter Email",
              hintStyle: TextStyle(color: Colors.red.shade200),
              border: InputBorder.none,
            ),
            textInputAction: TextInputAction.send,
          ),
          TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              icon: Icon(Icons.password),
              iconColor: Colors.red,
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.red.shade200),
              border: InputBorder.none,
            ),
            textInputAction: TextInputAction.send,
          )
        ],
      ),
    );
  }

  Widget _buildRegistrationButton() {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      onPressed: () {},
      child: Text("Login"),
    );
  }

  // Widget _buildElevatedButton() {
  //   return Container(
  //     width: 300,
  //     height: 50,
  //     child: ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: Colors.blue,
  //         foregroundColor: Colors.white,
  //       ),
  //       onPressed: () {
  //         Navigator.of().push(CupertinoDialogRoute(
  //           builder: (context) => FbScreen(),
  //         ));
  //       },
  //       child: Text("LogIn"),
  //     ),
  //   );
  // }
}
