import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../profile/profile.dart';

class PostCard extends StatelessWidget {
  final String name;
  final String username;
  final String text;

  const PostCard(
      {required this.name, required this.username, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: 250,
      child: Column(
        children: [
          Card(
            color: const Color.fromRGBO(224, 238, 226, 1),
            elevation: 4,
            shape: const BeveledRectangleBorder(),
            shadowColor: Colors.black,
            child: Expanded(
              flex: 1,
              child: Column(
                children: [
                  ListTile(
                    leading: RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profile(
                                      name: name,
                                      username: username,
                                      add: false,
                                    )));
                      },
                      shape: const CircleBorder(),
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/User.jpg'),
                      ),
                    ),
                    title: Text(
                      name,
                      style: const TextStyle(
                        fontFamily: 'Muli',
                        fontSize: 30,
                        color: Color.fromRGBO(83, 46, 59, 1),
                      ),
                    ),
                    subtitle: Text(
                      '@$username',
                      style: const TextStyle(
                        fontFamily: 'Playdis',
                        fontSize: 20,
                        color: Color.fromRGBO(83, 46, 59, 0.5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      text,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(83, 46, 59, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
