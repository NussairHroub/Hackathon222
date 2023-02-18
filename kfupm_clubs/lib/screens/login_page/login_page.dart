import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfupm_clubs/providers/auth_provider.dart';
import 'package:kfupm_clubs/utils/constant.dart';
import '../../providers/auth_provider.dart';

import '../../services/database.dart';

enum Status {
  login,
  signUp,
}

Status type = Status.login;

class LoginPage extends ConsumerStatefulWidget {
  static const routename = '/LoginPage';
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  bool _isLoading = false;
  bool _isLoading2 = false;
  void loading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void loading2() {
    setState(() {
      _isLoading2 = !_isLoading2;
    });
  }

  void _switchType() {
    if (type == Status.signUp) {
      setState(() {
        type = Status.login;
      });
    } else {
      setState(() {
        type = Status.signUp;
      });
    }
  }

  List<bool> isSelected = [true, false];
  List<String> options = ['Student', 'Club President'];
  String? _clubValue = "aSF0wfJLeIPvXnK4zTH0";
  @override
  Widget build(BuildContext context) {
    final clubs = ref.watch(clubsFutureProvider);

    print('build');
    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Consumer(builder: (context, ref, _) {
          final auth = ref.watch(authProvider);

          Future<void> _onPressedFunction() async {
            if (!_formKey.currentState!.validate()) {
              return;
            }

            if (type == Status.login) {
              loading();
              await auth
                  .signInWithEmailAndPassword(_email.text, _password.text)
                  .whenComplete(() => auth.user.listen((event) async {
                        if (event == null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text(
                              'Invalid email or password',
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.red[300],
                            duration: const Duration(seconds: 3),
                          ));

                          loading();

                          return;
                        }
                      }));
            } else {
              loading();
              await auth
                  .signUpWithEmailAndPassword(_email.text, _password.text)
                  .whenComplete(() => auth.user.listen((event) async {
                        if (event != null) {
                          //TODO:add clubId after level please man <3
                          await DB().addUser(
                              name: _name.text,
                              email: _email.text,
                              level: options[isSelected[0] ? 0 : 1],
                              clubId: _clubValue ?? "aSF0wfJLeIPvXnK4zTH0",
                              uid: event.uid,
                              studentId: _email.text
                                  .substring(1, _email.text.indexOf('@')));
                          log('login');
                          return;
                        }
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text('Email already exists',
                              textAlign: TextAlign.center),
                          backgroundColor: Colors.red[300],
                          duration: const Duration(seconds: 3),
                        ));
                        loading();
                      }));
            }
          }

          return Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(flex: 1),
                        if (type == Status.signUp)
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 600),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Name',
                                hintStyle: TextStyle(color: Colors.black54),
                                icon: Icon(Icons.person_outline,
                                    color: primaryColor, size: 24),
                                alignLabelWithHint: true,
                                border: InputBorder.none,
                              ),
                              controller: _name,
                              validator: type == Status.signUp
                                  ? (value) {
                                      if (value!.isEmpty) {
                                        return 'enter a valid name';
                                      }
                                      return null;
                                    }
                                  : null,
                            ),
                          ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          child: TextFormField(
                            controller: _email,
                            autocorrect: true,
                            enableSuggestions: true,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {},
                            decoration: const InputDecoration(
                              hintText: 'Email address',
                              hintStyle: TextStyle(color: Colors.black54),
                              icon: Icon(Icons.email_outlined,
                                  color: primaryColor, size: 24),
                              alignLabelWithHint: true,
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Invalid email!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          child: TextFormField(
                            controller: _password,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return 'Password is too short!';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.black54),
                              icon: Icon(Icons.lock_outline,
                                  color: primaryColor, size: 24),
                              alignLabelWithHint: true,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        if (type == Status.signUp)
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 600),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                hintText: 'Confirm password',
                                hintStyle: TextStyle(color: Colors.black54),
                                icon: Icon(Icons.lock_outline,
                                    color: primaryColor, size: 24),
                                alignLabelWithHint: true,
                                border: InputBorder.none,
                              ),
                              validator: type == Status.signUp
                                  ? (value) {
                                      if (value != _password.text) {
                                        return 'Passwords do not match!';
                                      }
                                      return null;
                                    }
                                  : null,
                            ),
                          ),
                        if (type == Status.signUp)
                          clubs.when(
                              data: (clubsList) => Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 8),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 4),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: ListTile(
                                      leading: Icon(Icons.group_outlined),
                                      title: Text("Club: "),
                                      trailing: DropdownButton<String>(
                                        value: _clubValue,
                                        onChanged: (value) {
                                          setState(() {
                                            _clubValue = value;
                                            print(value);
                                          });
                                        },
                                        items: clubsList
                                            .map((club) =>
                                                DropdownMenuItem<String>(
                                                  child: Text(club.name),
                                                  value: club.id,
                                                ))
                                            .toList(),
                                      ),
                                    ),
                                  ),
                              error: (error, trackStack) => Container(),
                              loading: () => Container()),
                        if (type == Status.signUp)
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 26, vertical: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: ToggleButtons(
                              borderRadius: BorderRadius.circular(25),
                              constraints: BoxConstraints(
                                  minWidth:
                                      (MediaQuery.of(context).size.width / 2) -
                                          50,
                                  minHeight: 40),
                              children: options.map((e) => Text(e)).toList(),
                              isSelected: isSelected,
                              onPressed: (index) {
                                setState(() {
                                  for (int i = 0; i < isSelected.length; i++) {
                                    if (i == index) {
                                      isSelected[i] = true;
                                    } else {
                                      isSelected[i] = false;
                                    }
                                  }
                                });
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 32.0),
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            width: double.infinity,
                            child: _isLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : MaterialButton(
                                    onPressed: _onPressedFunction,
                                    textColor: primaryColor,
                                    textTheme: ButtonTextTheme.primary,
                                    minWidth: 100,
                                    padding: const EdgeInsets.all(18),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: const BorderSide(
                                          color: primaryColor, width: 2),
                                    ),
                                    child: Text(
                                      type == Status.login
                                          ? 'Log in'
                                          : 'Sign up',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: RichText(
                              text: TextSpan(
                                text: type == Status.login
                                    ? 'Don\'t have an account? '
                                    : 'Already have an account? ',
                                style: const TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: type == Status.login
                                          ? 'Sign up now'
                                          : 'Log in',
                                      style: TextStyle(color: primaryColor),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          _switchType();
                                        })
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
