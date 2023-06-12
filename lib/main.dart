import 'package:a_flutter/pages/home/home.dart';
import 'package:a_flutter/pages/login/login.dart';
import 'package:a_flutter/pages/login/registration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
List curr = [];
List<Map<String, String>> posts = [
  {'name' : 'red', 'username' : 'red21', 'text' : 'sdc'},
  {'name' : 'red', 'username' : 'red21', 'text' : 'sdc'},
];
void main() {
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(builder: (context) => const LoginPage());
          case '/registration':
            return MaterialPageRoute(builder: (context) => const RegPage());
          case '/home':
            return MaterialPageRoute(builder: (context) => const Home());
          }
      },
      home: RegPage()
    );
  }
}
