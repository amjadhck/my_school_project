import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_school_project/screens/test_page.dart';
import 'package:my_school_project/widgets/class_modal.dart';
import 'package:my_school_project/widgets/constances.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  //formkey
  final _formKey = GlobalKey<FormState>();
  //editingcontroller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[400],
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.blueGrey[400],
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset("assets/school_logo.png"),
                      ),
                      const VerticalHight(value: 45),
                      TextFormField(
                        autofocus: false,
                        controller: emailController,
                        onSaved: (value) {
                          emailController.text = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Plese enter your email");
                          } else if (!RegExp(
                                  "^[a-zA-Z0-9+_.-]+@[a-zA-Z.-]+.[a-z]")
                              .hasMatch(value)) {
                            return ("Enter a valid email");
                          } else {
                            return null;
                          }
                        },
                        textInputAction: TextInputAction.next,
                        decoration: kemaildecoration,
                      ),
                      const VerticalHight(value: 25),
                      TextFormField(
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
                        decoration: kpassworddecoration,
                      ),
                      const VerticalHight(value: 25),
                      Material(
                        elevation: 5,
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(30),
                        child: MaterialButton(
                          onPressed: () {
                            signIn(
                                emailController.text, passwordController.text);
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
                          minWidth: MediaQuery.of(context)
                              .size
                              .width, //column size nu anusarich login button width aakum
                        ),
                      ),
                      const VerticalHight(value: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TestPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "SignUp",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      //to hide keyboard
      FocusScope.of(context).requestFocus(FocusNode());

      setState(() {
        showSpinner = true;
      });
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
            (uid) => {
              Fluttertoast.showToast(msg: "Login Successfull"),
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const TestPage(),
                ),
              ),
            },
          )
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
      showSpinner = false;
    }
  }
}
