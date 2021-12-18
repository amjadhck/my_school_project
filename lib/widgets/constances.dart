import 'package:flutter/material.dart';

const kemaildecoration = InputDecoration(
  prefixIcon: Icon(Icons.mail),
  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
  hintText: "Email",
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);
const kpassworddecoration = InputDecoration(
  prefixIcon: Icon(Icons.vpn_key),
  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
  hintText: "Password",
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);

const kTextFieldDecoration = InputDecoration(
  fillColor: Colors.blue,
  filled: true,
  hintText: 'Enter',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);