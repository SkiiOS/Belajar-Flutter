import 'package:belajarflutter/components/custome_textField.dart';
import 'package:belajarflutter/components/custom_text.dart';
import 'package:belajarflutter/components/custom_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  String statusLogin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("login page")),
      body: Column(
        children: [
          CustomText(
            text: "Welcome to application $statusLogin",
            color: const Color.fromARGB(
              255,
              7,
              205,
              96,
            ), // ganti warna teks di sini
            fontSize: 30,
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: CustomTextfield(
              Hint: "input username",
              txtController: txtUsername,
              obscureText: false,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: CustomTextfield(
              Hint: "input password",
              txtController: txtPassword,
              obscureText: true,
            ),
          ),

          CustomButton(
            label: "Login",
            textColor: const Color.fromARGB(
              255,
              2,
              96,
              12,
            ), // ganti warna teks button di sini
            fontSize: 30,
            onPressed: () {
              setState(() {
                String username = txtUsername.text.toString();
                String password = txtPassword.text.toString();
                if (username == "admin" && password == "admin") {
                  statusLogin = "admin";
                  print("sukses login");
                } else {
                  statusLogin = "failed";
                  print("gagal login");
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
