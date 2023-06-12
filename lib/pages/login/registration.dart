import 'package:a_flutter/data_handler/database.dart';
import 'package:a_flutter/data_handler/user_model.dart';
import 'package:a_flutter/pages/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  final _formKey = GlobalKey<FormState>();
  final nameValid = RegExp("[a-zA-Z1-9]");
  var name;
  var username;
  final emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  var email;
  var password;
  bool obsText = true;
  String hint = 'Your username';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 224, 229, 1),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Create Account',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 40,
                  color: Color.fromRGBO(83, 46, 59, 1),
                ),
              ),
              const Text(
                'Enter your Name, Email Address and Password to sign up',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(83, 46, 59, 1), fontSize: 20),
              ),
              TextButton(
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll<Color>(
                    Color.fromRGBO(83, 46, 59, 1),
                  ),
                ),
                child: const Text('Already have an account?'),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                style: const TextStyle(
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: '    Your name',
                    hintStyle: const TextStyle(fontSize: 20),
                    fillColor: Colors.grey[300],
                    filled: true),
                validator: (value) {
                  if (value!.isEmpty || !nameValid.hasMatch(value!)) {
                    return "Incorrect";
                  }
                  name = value;
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Focus(
                onFocusChange: (hasFocus) {
                  if (hasFocus) {
                    setState(() {
                      hint = '';
                    });
                  } else {
                    setState(() {
                      hint = 'Your username';
                    });
                  }
                },
                child: TextFormField(
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: hint,
                    hintStyle: const TextStyle(fontSize: 20),
                    fillColor: Colors.grey[300],
                    filled: true,
                    prefixText: '@',
                  ),
                  validator: (usernameValue) {
                    if (usernameValue!.isEmpty) {
                      return "Incorrect";
                    } else if (DBCommands().valid("username", usernameValue) == null) {
                      return "Account with this username already exists";
                    }
                    username = usernameValue;
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                style: const TextStyle(
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  hintText: '    Email Address',
                  hintStyle: const TextStyle(fontSize: 20),
                  fillColor: Colors.grey[300],
                  filled: true,
                ),
                validator: (emailValue) {
                  if (emailValue!.isEmpty) {
                    return "Your email is empty";
                  } else if (!emailValid.hasMatch(emailValue)) {
                    return "Your email is incorrect";
                  } else if (DBCommands().valid("email", emailValue) == null) {
                    return "Account with this email already exists";
                  }
                  email = emailValue;
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: obsText,
                style: const TextStyle(
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  hintText: '    Password',
                  hintStyle: const TextStyle(fontSize: 20),
                  fillColor: Colors.grey[300],
                  filled: true,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obsText = !obsText;
                        });
                      },
                      icon: Icon((obsText == true)
                          ? CupertinoIcons.eye_fill
                          : CupertinoIcons.eye_slash_fill)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Your password is empty";
                  }
                  password = value;
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 63,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color.fromRGBO(224, 238, 226, 1),
                      ),
                      foregroundColor: const MaterialStatePropertyAll<Color>(
                        Color.fromRGBO(83, 46, 59, 1),
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      DBCommands().initDatabase();
                      UserModel newUser =
                          UserModel(name, username, email, password);
                      DBCommands().saveUser(newUser);
                      Navigator.pushNamed(context, '/login');
                    }
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
