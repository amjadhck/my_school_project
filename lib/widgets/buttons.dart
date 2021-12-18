import 'package:flutter/material.dart';

var loginButton = Material(
  elevation: 5,
  color: Colors.redAccent,
  borderRadius: BorderRadius.circular(30),
  child: MaterialButton(
    onPressed: () {
//          signIn(emailController.text, passwordController.text);
    },
    child: const Text(
      "Login",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
    // minWidth: MediaQuery.of(context)
    //     .size
    //     .width, //column size nu anusarich login button width aakum
  ),
);
