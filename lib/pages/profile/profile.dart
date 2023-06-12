import 'package:a_flutter/main.dart';
import 'package:a_flutter/pages/home/home.dart';
import 'package:a_flutter/pages/post_related/post_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../post_related/create_post.dart';
import 'drawer.dart';

class Profile extends StatelessWidget {
  final String name;
  final String username;
  bool add;

  Profile({required this.name, required this.username, this.add = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 224, 229, 1),
      drawer: Drawerr(
        name: curr[0],
      ),
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(224, 238, 226, 1),
        foregroundColor: const Color.fromRGBO(83, 46, 59, 1),
      ),
      body: Column(
        children: [
          const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/User.jpg'),
          ),
          Text(
            name,
            style: const TextStyle(
              fontFamily: 'Muli',
              fontSize: 50,
              color: Color.fromRGBO(83, 46, 59, 1),
            ),
          ),
          Text(
            '@$username',
            style: const TextStyle(
              fontSize: 30,
              color: Color.fromRGBO(83, 46, 59, 1),
            ),
          ),
          const Divider(
            color: Colors.black,
            thickness: 1,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  Map<String, String> post = posts[index];
                  String n = post['name'] as String;
                  String u = post['username'] as String;
                  String t = post['text'] as String;
                  if (post['username'] == username) {
                    return PostCard(name: n, username: u, text: t);
                  }
                  return Container();
                }),
          ),
        ],
      ),
      floatingActionButton: (add == true)
          ? FloatingActionButton(
              backgroundColor: const Color.fromRGBO(224, 238, 226, 1),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Create(
                              name: name,
                              username: username,
                            )));
              },
              child: const Icon(
                CupertinoIcons.add,
                color: Color.fromRGBO(83, 46, 59, 1),
              ),
            )
          : null,
    );
  }
}
