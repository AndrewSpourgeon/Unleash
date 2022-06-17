import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:snap_book/screens/HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
  ],
);
Future<void> handleSignIn() async {
  try {
    await _googleSignIn.signIn();
  } catch (error) {}
}

class LoginPageState extends State<LoginPage> {
  GoogleSignInAccount? currentUser;
  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((event) {
      setState(() {
        currentUser = event;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? userAccount = currentUser;
    if (userAccount != null) {
      return HomePage();
    } else {
      return new MaterialApp(
        home: new Scaffold(
          body: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            color: Colors.grey,
            child: ElevatedButton(
              style: (ElevatedButton.styleFrom(
                elevation: 50,
                primary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(60.0),
                ),
              )),
              onPressed: () {
                handleSignIn();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login with google",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: 'Google'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(
                    'assets/google.svg',
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  void signOut() async {
    await _googleSignIn.signOut();
  }

  String getUserId() {
    return _googleSignIn.currentUser!.id;
  }

  Future<List<String>> getFavourites() async {
    List<String> fav = [];
    final docRef =
        FirebaseFirestore.instance.collection('Users').doc(getUserId());
    await docRef.get().then((value) {
      fav = value.data()?['Favourites'].cast<String>();
    });
    return fav;
  }

  Future<bool> checkUser() async {
    List<String> fav = [];
    await FirebaseFirestore.instance
        .collection('Users')
        .get()
        .then((value) => value.docs.forEach((doc) {
              fav.add(doc.id);
            }));
    return fav.contains(getUserId());
  }

  Future<void> setFact(String fact) async {
    final docReference =
        FirebaseFirestore.instance.collection('Users').doc(getUserId());
    await docReference.set({
      'Favourites': FieldValue.arrayUnion([fact])
    });
  }

  Future<void> updateFact(String fact) async {
    final docReference =
        FirebaseFirestore.instance.collection('Users').doc(getUserId());
    await docReference.update({
      'Favourites': FieldValue.arrayUnion([fact])
    });
  }

  Future<void> deleteFacts() async {
    final docReference =
        FirebaseFirestore.instance.collection('Users').doc(getUserId());
    await docReference.update({
      'Favourites': FieldValue.delete(),
    });
    HomePageState homePageState = HomePageState();
    homePageState.getCount();
  }

  Future<void> newUserGuide() async {
    final docReference =
        FirebaseFirestore.instance.collection('Users').doc(getUserId());
    String? username = _googleSignIn.currentUser?.displayName;
    await docReference.set({
      'Favourites': FieldValue.arrayUnion(
          ['Welcome $username , here you can see all your favourite facts']),
    });
  }
}
