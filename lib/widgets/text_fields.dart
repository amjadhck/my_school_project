import 'package:flutter/material.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

final emailField = TextFormField(
  autofocus: false,
  controller: emailController,
  onSaved: (value) {
    emailController.text = value!;
  },
  validator: (value) {
    if (value!.isEmpty) {
      return ("Plese enter your email");
    } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z.-]+.[a-z]").hasMatch(value)) {
      return ("Enter a valid email");
    } else {
      return null;
    }
  },
  textInputAction: TextInputAction.next,
  decoration: const InputDecoration(
    prefixIcon: Icon(Icons.mail),
    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    hintText: "Email",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  ),
);

final passwordField = TextFormField(
  obscureText: true,
  autofocus: false,
  controller: passwordController,
  onSaved: (value) {
    passwordController.text = value!;
  },
  validator: (value) {
    RegExp regex = RegExp(r'^.{6,}$');
    if (value!.isEmpty) {
      return ("Password required");
    } else if (!regex.hasMatch(value)) {
      return ("Enter a valid password with min 6 charecters");
    }
  },
  textInputAction: TextInputAction.done,
  decoration: const InputDecoration(
    prefixIcon: Icon(Icons.vpn_key),
    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    hintText: "Password",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  ),
);
