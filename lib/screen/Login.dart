import 'package:flutter/material.dart';
import 'package:mytodoc/screen/Ragister.dart';

class Loginpage extends StatefulWidget {
  Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/splashbg.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 70.0),
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/images/splashlogo.png',
                      height: 75.0,
                    ),
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontFamily: "Gulzar"),
                  ),
                  Container(
                      child: (TextField(
                    onChanged: (data) {
                      // todo.title = data;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: new InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: "UserName",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(color: Colors.white),
                      ),
                      //fillColor: Colors.green
                    ),
                    // controller: titleController,
                  ))),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                      child: (TextField(
                    obscureText: true,
                    onChanged: (data) {
                      // todo.title = data;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: new InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: "Password",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(color: Colors.white),
                      ),
                      //fillColor: Colors.green
                    ),
                    // controller: titleController,
                  ))),
                  SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                      height: 50.0,
                      width: 150.0,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(color: Colors.white)))),
                          child: Center(
                            child: Text("Login"),
                          ))),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "You don't have accout",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MySignuppage()));
                      },
                      child: Center(
                        child: Text(
                          "Sign-Up",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
