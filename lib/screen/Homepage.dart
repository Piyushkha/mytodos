import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mytodoc/screen/Login.dart';
import 'package:mytodoc/screen/Ragister.dart';
import 'package:mytodoc/googleLogin/googlefile.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mytodoc/facebook/facebooklogin.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/splashbg.png',
          filterQuality: FilterQuality.high,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 10, left: 5, right: 5)),
          Text(
            "Log in or sign up in seconds",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: "Gulzar",
              color: Colors.white,
              fontSize: 26,
              decoration: TextDecoration.none,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 3, right: 3)),
          Text(
            "Use your email or another service to continue with Mytodos app",
            // textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: "Gulzar",
              decoration: TextDecoration.none,
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          // Row(children: [

          // ],)
          Padding(padding: EdgeInsets.only(top: 20)),

          ElevatedButton.icon(
              onPressed: () async {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                await provider.googleLogin();
              },
              icon: FaIcon(
                FontAwesomeIcons.google,
                color: Colors.white,
              ),
              label: Text(
                "Login with google",
                style: TextStyle(
                    color: Colors.white, fontSize: 22, fontFamily: 'Roboto'),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 185, 129, 177),
                fixedSize: const Size(350, 60),
              )),
          Padding(padding: EdgeInsets.only(top: 20)),

          ElevatedButton.icon(
              onPressed: () async {
                await facebookLogin();
                setState(() {});
              },
              icon: FaIcon(
                FontAwesomeIcons.facebook,
                color: Colors.white,
              ),
              label: Text(
                "Login with facebook",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 110, 130, 150),
                fixedSize: const Size(350, 60),
              )),
          Padding(padding: EdgeInsets.only(top: 20)),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Loginpage()));
            },
            icon: FaIcon(
              FontAwesomeIcons.user,
              color: Colors.white,
            ),
            label: Text(
              "Login with email",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 152, 156, 158),
              fixedSize: const Size(350, 60),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text(
            "By continuing you agree to mytodo app Terms of use, read our privicy policy",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.grey,
              fontFamily: "Gulzar",
              fontSize: 12,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 0)),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MySignuppage()));
              },
              child: Center(
                child: Text(
                  "Create a new account",
                  style: TextStyle(
                      color: Color.fromARGB(255, 2, 79, 142),
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0),
                ),
              )),
          Padding(padding: EdgeInsets.only(bottom: 20)),
        ]),
      ],
    ));
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
