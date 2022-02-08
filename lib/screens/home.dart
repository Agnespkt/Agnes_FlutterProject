import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_ver3/model/usermodel.dart';
import 'package:project_ver3/screens/addrecord.dart';
import 'package:project_ver3/screens/map.dart';
import 'package:project_ver3/screens/profile.dart';
import 'showrecord.dart';
import 'cp_jsonparser.dart';
import 'about.dart';

import 'login.dart';

class Home extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
  User user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Home"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 110,
                      child: Image.asset("images/busicon.jpg",
                          fit: BoxFit.contain),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "MyTransportApp",
                        style: TextStyle(fontSize: 25),
                      ),
                    )
                  ]),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Welcome Back,${loggedInUser.firstName}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox.fromSize(
                      size: Size(165, 100), // button width and height
                      child: Material(
                        color: Colors.cyan, // button color
                        child: InkWell(
                          splashColor: Colors.green, // splash color
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutPage()),
                            );
                          }, // button pressed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.info, color: Colors.white), // icon
                              Text(
                                'About',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ), // text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox.fromSize(
                      size: Size(165, 100), // button width and height
                      child: Material(
                        color: Colors.cyan, // button color
                        child: InkWell(
                          splashColor: Colors.green, // splash color
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()),
                            );
                          }, // button pressed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.person, color: Colors.white), // icon
                              Text(
                                'Profile',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ), // text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox.fromSize(
                      size: Size(165, 100), // button width and height
                      child: Material(
                        color: Colors.cyan, // button color
                        child: InkWell(
                          splashColor: Colors.green, // splash color
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddRecordPage()),
                            );
                          }, // button pressed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.add, color: Colors.white), // icon
                              Text(
                                'Add Record',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ), // text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox.fromSize(
                      size: Size(165, 100), // button width and height
                      child: Material(
                        color: Colors.cyan, // button color
                        child: InkWell(
                          splashColor: Colors.green, // splash color
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecordsPage()),
                            );
                          }, // button pressed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.card_travel,
                                  color: Colors.white), // icon
                              Text(
                                'Show Records',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ), // text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox.fromSize(
                      size: Size(165, 100), // button width and height
                      child: Material(
                        color: Colors.cyan, // button color
                        child: InkWell(
                          splashColor: Colors.green, // splash color
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CPJsonParse()),
                            );
                          }, // button pressed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.traffic, color: Colors.white), // icon
                              Text(
                                'Traffic Condition',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ), // text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox.fromSize(
                      size: Size(165, 100), // button width and height
                      child: Material(
                        color: Colors.cyan, // button color
                        child: InkWell(
                          splashColor: Colors.green, // splash color
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MapPage()),
                            );
                          }, // button pressed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.map, color: Colors.white), // icon
                              Text(
                                'Map',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )
                              // text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue,
                child: MaterialButton(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    logout(context);
                  },
                  child: Text(
                    "Logout",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // MaterialButton(
              //   padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              //   minWidth: MediaQuery.of(context).size.width,
              //   onPressed: () {},
              //   child: Text(
              //     "Login",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //         fontSize: 20,
              //         color: Colors.blue,
              //         fontWeight: FontWeight.bold),
              //   ),
              // ),
              // TextButton(
              //   style: ButtonStyle(
              //     foregroundColor:
              //         MaterialStateProperty.all<Color>(Colors.blue),
              //   ),
              //   onPressed: () {
              //     logout(context);
              //   },
              //   child: Text('Logout'),
              // )

              // ActionChip(
              //     label: Text(
              //       "SignUp",
              //       style: TextStyle(
              //           color: Colors.redAccent,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 15),
              //     ),
              //     onPressed: () {
              //       logout(context);
              //     }),
            ],
          ),
        ),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
  }
}
