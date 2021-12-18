import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_school_project/screens/test_page.dart';
import 'package:my_school_project/widgets/buttons.dart';
import 'package:my_school_project/widgets/text_fields.dart';

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
  //final _auth = FirebaseAuth.instance;
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
                        child: Image.asset("assets/logo.png"),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      emailField,
                      const SizedBox(
                        height: 25,
                      ),
                      passwordField,
                      const SizedBox(
                        height: 35,
                      ),
                      loginButton,
                      const SizedBox(
                        height: 15,
                      ),
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

//   void signIn(String email, String password) async {
//     if (_formKey.currentState!.validate()) {
//       //to hide keyboard
//       FocusScope.of(context).requestFocus(FocusNode());

//       setState(() {
//         showSpinner = true;
//       });
//       await _auth
//           .signInWithEmailAndPassword(email: email, password: password)
//           .then(
//             (uid) => {
//               Fluttertoast.showToast(msg: "Login Successfull"),
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(
//                   builder: (context) => HomeScreen(),
//                 ),
//               ),
//             },
//           )
//           .catchError((e) {
//         Fluttertoast.showToast(msg: e!.message);
//       });
//       showSpinner = false;
//     }
//   }
// }
}
