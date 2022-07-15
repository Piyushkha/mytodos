import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytodoc/screen/Homepage.dart';
import 'package:provider/provider.dart';
import 'package:mytodoc/googleLogin/googlefile.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            print(snapshot.hasData);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return Logined();
            } else if (snapshot.hasError) {
              return Center(child: Text("shomthing Went Wrong "));
            } else {
              return HomePage();
            }
          },
        ),
      );
}

class Logined extends StatefulWidget {
  // Logined({Key? key}) : super(key: key);

  @override
  State<Logined> createState() => _LoginedState();
}

class _LoginedState extends State<Logined> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
        appBar: AppBar(
          title: Text("Logged in"),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
              child: Center(
                  child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              )),
            )
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          color: Colors.blueGrey.shade900,
          child: Center(
            child: Column(children: [
              Text(
                "Profile",
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 32,
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Name: " + user.displayName!,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Email: " + user.email!,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ]),
          ),
        ));
  }
}
