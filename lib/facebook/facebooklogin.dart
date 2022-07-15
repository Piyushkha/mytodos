import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:mytodoc/screen/Homepage.dart';

class FacebookHomepage extends StatefulWidget {
  FacebookHomepage({Key? key}) : super(key: key);

  @override
  State<FacebookHomepage> createState() => _FacebookHomepageState();
}

class _FacebookHomepageState extends State<FacebookHomepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Facebook Login data ",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          ElevatedButton(
              onPressed: () async {},
// or FacebookAuth.i.logOut();

              child: Text(
                "LogOut",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ))
        ],
      ),
    );
  }

  facebookLogin() async {
    print("FaceBook");
    try {
      final result =
          await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        print(userData);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => FacebookHomepage()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()));
      }
    } catch (error) {
      print(error);
    }
  }
}
