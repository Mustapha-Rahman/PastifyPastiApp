import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pastify/screens/registerpage.dart';

import 'package:sizer/sizer.dart';

import '../constant.dart';
import '../widget/custom btn.dart';
import '../widget/custom input.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Container(
              child: Text(error),
            ),
            actions: [
              ElevatedButton(
                child: const Text('Close Dialog'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  Future<String?> _loginAccount() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginEmail, password: _loginPassword);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitForm() async {
    setState(() {
      _loginFormLoading = true;
    });

    String? _loginFeedback = await _loginAccount();
    if (_loginFeedback != null) {
      _alertDialogBuilder(_loginFeedback);

      setState(() {
        _loginFormLoading = false;
      });
    }
  }

  bool _loginFormLoading = false;

  String _loginEmail = '';
  String _loginPassword = '';

  late FocusNode _passwordFocusNode;
  late FocusNode _emailFocusNode;

  //not yet
  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    _emailFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose;
    _emailFocusNode.dispose;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              height: 100.h,
              width: 100.h,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: [
                    Colors.blue,
                    Colors.pink
                  ]

                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Welcome User, \n Lets Connect Together',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.bebasNeue(
                        fontSize: 20.sp
                      ),
                    ),
                    Column(
                      children: [
                        CustomInput(
                          hintText: 'Email',
                          onChanged: (value) {
                            _loginEmail = value;
                          },
                          textInputAction: TextInputAction.next,
                          isPasswordField: false,
                          onSubmitted: (String) async {
                            _passwordFocusNode;
                          },
                          focusNode: _emailFocusNode,
                        ),
                        CustomInput(
                          hintText: 'Password',
                          onChanged: (value) {
                            _loginPassword = value;
                          },
                          isPasswordField: true,
                          focusNode: _passwordFocusNode,
                          onSubmitted: (value) {
                            _submitForm();
                          },
                          textInputAction: TextInputAction.next,
                        ),
                        GestureDetector(
                          onTap: () {
                            _submitForm();
                          },
                          child: CustomBtn(
                            text: 'Login',
                            outlineBtn: false,
                            isLoading: _loginFormLoading,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()));
                        },
                        child: const CustomBtn(
                          text: 'Create New Account',
                          outlineBtn: true,
                          isLoading: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
