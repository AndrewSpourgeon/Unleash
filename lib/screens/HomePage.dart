import 'dart:async';

import 'package:animated_radial_menu/animated_radial_menu.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:share/share.dart';
import 'package:snap_book/screens/CreatorPage.dart';
import 'package:snap_book/screens/FavouritesPage.dart';
import 'package:snap_book/screens/LoginPage.dart';
import 'package:snap_book/service/Api.dart';
import 'package:url_launcher/url_launcher.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Welcome to UNLEASH app',
              body: 'Where you unleash the beautiful facts',
              image: Lottie.asset('assets/welcome.json'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Beautiful and Simple UI',
              body: 'Smooth like an icecream',
              image: Lottie.asset('assets/ui.json'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Safe and Secure',
              body: 'We don\'t spam with user data.You can trust us',
              image:
                  Lottie.asset('assets/secure.json', height: 310, width: 310),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Productive ',
              body: 'Nothing is better than investing on yourself',
              image: Lottie.asset('assets/productive.json'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Navigate easily',
              body: 'Use the radial menu button to navigate screens easily',
              image: Lottie.asset(
                'assets/navigate.json',
                height: 350,
                width: 350,
              ),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Store your favourites',
              body: 'Store,Leave,relax,come back any time',
              image: Lottie.asset(
                'assets/favscreen.json',
                height: 350,
                width: 350,
              ),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Share the app',
              body: 'Share it easily from inside the app',
              image: Lottie.asset('assets/share.json'),
              decoration: getPageDecoration(),
            ),
          ],
          done: Text('Unleash',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
          onDone: () => goToHome(context),
          next: Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: Colors.teal,
          ),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Colors.white,
          skipFlex: 0,
          nextFlex: 0,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginPage()),
      );

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Colors.purple,
        //activeColor: Colors.orange,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'AppleP'),
        bodyTextStyle:
            TextStyle(fontSize: 20, fontFamily: 'Google', color: Colors.purple),
        bodyAlignment: Alignment.center,
        descriptionPadding: EdgeInsets.all(50),
        imagePadding: EdgeInsets.all(15),
        pageColor: Colors.white,
      );
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int? countFav;
  bool isFav = false;
  int temp = 0;
  String fact =
      'Hello Peeps , MySelf Drew , purple button is waiting for you to click may be it has hidden something interesting for you !';
  Future<void> getCount() async {
    LoginPageState loginPageState = LoginPageState();

    DocumentReference<Map<String, dynamic>> favos = FirebaseFirestore.instance
        .collection('Users')
        .doc(loginPageState.getUserId());
    Map<String, dynamic>? favorites =
        await favos.get().then((value) => value.data());
    setState(() {
      countFav = favorites?.length;
    });
  }

  Widget build(BuildContext context) {
    var sheight = MediaQuery.of(context).size.height;
    var swidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(sheight / 11),
        child: AppBar(
          centerTitle: true,
          flexibleSpace: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
                bottomLeft: Radius.circular(100)),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/hero.jpg'), fit: BoxFit.fill)),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
                bottomLeft: Radius.circular(100)),
          ),
          backgroundColor: Colors.purple,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: sheight / 45,
                ),
                onPressed: () async {
                  await getCount();
                  LoginPageState loginPageState = LoginPageState();
                  if (countFav != 0 && await loginPageState.checkUser()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Favourite(),
                      ),
                    );
                  } else {
                    Fluttertoast.showToast(
                      msg: 'You do not have any favourites',
                      fontSize: 20,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.red.shade900,
                      textColor: Colors.white,
                    );
                  }
                },
              ),
              Text(
                'UNLEASH',
                style: new TextStyle(
                  fontSize: sheight / 38,
                  color: Colors.white,
                  fontFamily: 'AppleP',
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: new Container(
                  width: sheight / 25,
                  height: sheight / 25,
                  child: Icon(
                    Icons.share,
                    color: Colors.white,
                    size: sheight / 45,
                  ),
                ),
              ),
            ],
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: new Container(
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(75.0))),
            child: Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/splash.json', width: 215, height: 215),
                  new Card(
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    shadowColor: Colors.purple.shade800,
                    elevation: 40.0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: new Container(
                      padding: EdgeInsets.all(50),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          new Text(
                            fact,
                            style: new TextStyle(
                                fontFamily: 'Google',
                                fontSize: sheight / 45,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  new SizedBox(
                    height: sheight / 10,
                  ),
                  new Container(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (!isFav) {
                              setState(() {
                                isFav = true;
                                addToFavorites(fact);
                              });
                            } else {
                              setState(() {
                                isFav = false;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: isFav == true ? Colors.pink : Colors.grey,
                            size: 35,
                          )),
                      SizedBox(
                        width: sheight / 80,
                      ),
                      new Text(
                        'Add to favourites',
                        style: TextStyle(
                            fontSize: sheight / 45,
                            fontFamily: 'AppleP',
                            color: Colors.pink,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  )),
                  new SizedBox(
                    height: sheight / 30,
                  ),
                  new AvatarGlow(
                    child: Container(
                      height: 83,
                      width: 83,
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(99)),
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          Api api = new Api();
                          String tempFact = await api.getFacts();
                          setState(() {
                            fact = tempFact;
                            isFav = false;
                          });
                          print(isFav);
                        },
                        icon: Icon(
                          Icons.bolt,
                          color: Colors.white,
                          size: sheight / 30,
                        ),
                        label: Text(
                          "U",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: sheight / 44,
                              fontFamily: 'AppleP'),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          elevation: 0.0,
                        ),
                      ),
                    ),
                    endRadius: 120,
                    glowColor: Colors.purple,
                    duration: Duration(milliseconds: 2000),
                    repeat: true,
                    // animate: true,
                    shape: BoxShape.circle,
                    showTwoGlows: true,
                    curve: Curves.easeOutQuad,
                  ),
                  new SizedBox(
                    height: sheight / 30,
                  ),
                  new RadialMenu(
                    centerButtonAlignment: Alignment.center,
                    centerButtonSize: 0.5,
                    children: [
                      new RadialButton(
                        icon: Icon(
                          Icons.favorite,
                          size: sheight / 40,
                        ),
                        buttonColor: Colors.pinkAccent,
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Favourite(),
                            ),
                          );
                        },
                      ),
                      new RadialButton(
                        icon: Icon(
                          Icons.share,
                          size: sheight / 40,
                        ),
                        buttonColor: Colors.green,
                        onPress: () {
                          Share.share('Downlad Fact Shop here.');
                        },
                      ),
                      new RadialButton(
                        icon: Icon(
                          Icons.star,
                          size: sheight / 40,
                        ),
                        buttonColor: Colors.yellow,
                        onPress: () {
                          LoginPageState loginPage = new LoginPageState();
                          loginPage.signOut();
                        },
                      ),
                      new RadialButton(
                        icon: Icon(
                          Icons.info,
                          size: sheight / 40,
                        ),
                        buttonColor: Colors.blueAccent,
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Creator(),
                            ),
                          );
                        },
                      ),
                      new RadialButton(
                        icon: Icon(
                          Icons.source,
                          size: sheight / 40,
                        ),
                        buttonColor: Colors.redAccent,
                        onPress: () {
                          launch('https://github.com/AndrewSpourgeon/Unleash');
                        },
                      ),
                      new RadialButton(
                        icon: Icon(
                          Icons.mail_sharp,
                          size: sheight / 40,
                        ),
                        buttonColor: Colors.black,
                        onPress: () async {
                          final Email sendEmail = Email(
                            body: 'Hello Andrew Spourgeon,....',
                            subject: 'Feedback regarding Unlesah App',
                            recipients: ['andrewspourgeon@gmail.com'],
                            isHTML: false,
                          );

                          await FlutterEmailSender.send(sendEmail);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void addToFavorites(String fact) async {
    LoginPageState loginPageState = LoginPageState();
    bool isOldUser = await loginPageState.checkUser();
    if (isOldUser) {
      await loginPageState.updateFact(fact);
    } else {
      await loginPageState.setFact(fact);
    }
  }
}
