import 'package:a_flutter/pages/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class Drawerr extends StatelessWidget {
  final String name;

  const Drawerr({
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(238, 224, 229, 1),
      child: ListView(children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/User.jpg'),
          ),
          accountName: Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(83, 46, 59, 1),
            ),
          ),
          accountEmail: null,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(224, 238, 226, 1),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.exit_to_app,
            color: Color.fromRGBO(83, 46, 59, 1),
          ),
          title: const Text(
            'Exit',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(83, 46, 59, 1),
            ),
          ),
          onTap: () {
            curr.clear();
            Navigator.pushNamed(context, '/registration');
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.person,
            color: Color.fromRGBO(83, 46, 59, 1),
          ),
          title: const Text(
            'Profile',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(83, 46, 59, 1),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Profile(name: curr[0], username: curr[1])));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.home,
            color: Color.fromRGBO(83, 46, 59, 1),
          ),
          title: const Text(
            'Home',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(83, 46, 59, 1),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
      ]),
    );
  }
}
