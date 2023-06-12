import 'package:a_flutter/data_handler/database.dart';
import 'package:a_flutter/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../profile/profile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String hint = 'Your username';
  bool color = false;
  bool obsText = true;
  late String name;
  late String password;
  late String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 224, 229, 1),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                'Log in',
                style: TextStyle(
                  fontSize: 40,
                  color: Color.fromRGBO(83, 46, 59, 1),
                ),
              ),
              TextButton(
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll<Color>(
                    Color.fromRGBO(83, 46, 59, 1),
                  ),
                ),
                child: const Text("Don't have an account?"),
                onPressed: () {
                  Navigator.pushNamed(context, '/registration');
                },
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
                  hintText: '    Name',
                  hintStyle: const TextStyle(fontSize: 20),
                  fillColor: Colors.grey[300],
                  filled: true,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "name is empty";
                  }
                  name = value;
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
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
                height: 30,
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
                    return "password is empty";
                  }
                  password = value;
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
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
                    if (_formKey.currentState!.validate() &&
                        DBCommands().validLogin(username, password) != null) {
                      _formKey.currentState!.save();
                      curr.add(name);
                      curr.add(username);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Profile(name: curr[0], username: curr[1])));
                    }
                  },
                  child: const Text(
                    'Log In',
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
