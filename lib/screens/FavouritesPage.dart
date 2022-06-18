import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:share/share.dart';
import 'package:snap_book/screens/LoginPage.dart';

class Favourite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FavouriteState();
}

class FavouriteState extends State<Favourite> {
  String? userId;
  LoginPageState loginPageState = LoginPageState();
  int? favCount;
  List<String>? favs;

  String getUserID() {
    return loginPageState.getUserId();
  }

  @override
  Widget build(BuildContext context) {
    var sheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.teal,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: sheight / 40,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.remove_circle_rounded,
                            size: sheight / 40,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            loginPageState.deleteFacts();
                            Navigator.pop(context);
                            Fluttertoast.showToast(
                                msg: 'Succesfully deleted all of your Wishlist',
                                fontSize: 20,
                                backgroundColor: Colors.cyan,
                                textColor: Colors.black,
                                gravity: ToastGravity.CENTER);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.share,
                            size: sheight / 40,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Share.share('Downlad Fact Shop here.');
                          },
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(height: sheight / 100),
          Lottie.asset('assets/fav.json',
              height: sheight / 3.5, width: sheight / 3.5),
          Padding(
            padding: EdgeInsets.only(left: 50.0),
            child: Row(
              children: <Widget>[
                Text('My',
                    style: TextStyle(
                        fontFamily: 'AppleP',
                        color: Colors.white,
                        fontSize: sheight / 35)),
                SizedBox(width: 10.0),
                Text(
                  'Favourites',
                  style: TextStyle(
                      fontFamily: 'AppleP',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: sheight / 35),
                ),
              ],
            ),
          ),
          SizedBox(height: 35.0),
          Container(
            height: MediaQuery.of(context).size.height - 175.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(100.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(
                left: 25.0,
              ),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height - 500.0,
                  child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection('Users')
                        .doc(getUserID())
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return ListView.builder(
                          itemCount: snapshot.data['Favourites'].length,
                          itemBuilder: (context, index) {
                            return _buildFoodItem(
                                snapshot.data['Favourites'][index]);
                          });
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFoodItem(
    String foodName,
  ) {
    var sheight = MediaQuery.of(context).size.height;
    var swidth = MediaQuery.of(context).size.width;
    return Center(
        child: Padding(
      padding: EdgeInsets.only(left: 5.0, top: 20.0),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Container(
            child: Column(
          children: [
            Text(
              foodName,
              style: TextStyle(
                  fontFamily: 'Google',
                  fontSize: sheight / 50,
                  color: Colors.black),
            ),
            Divider(
              thickness: 1.2,
              color: Colors.pink,
            ),
          ],
        )),
      ),
    ));
  }
}
