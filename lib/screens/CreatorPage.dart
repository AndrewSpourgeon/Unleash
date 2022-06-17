import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:lottie/lottie.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Creator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sheight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: sheight / 50, right: sheight / 50),
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: sheight / 40,
                              color: Colors.black,
                            ),
                            Text(
                              'Go Back',
                              style: TextStyle(
                                  fontFamily: 'AppleP',
                                  fontSize: sheight / 45,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            'Developer details',
                            style: TextStyle(
                                fontFamily: 'AppleP',
                                fontSize: sheight / 45,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          Lottie.asset(
                            'assets/droid.json',
                            width: 120,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Lottie.asset('assets/drew.json',
                    height: sheight / 3.5, width: sheight / 3.5),
                Padding(
                  padding:
                      EdgeInsets.only(left: sheight / 20, top: sheight / 19),
                  child: Row(
                    children: <Widget>[
                      Text('Andrew',
                          style: TextStyle(
                              fontFamily: 'AppleP',
                              fontWeight: FontWeight.w700,
                              color: Colors.purple,
                              fontSize: sheight / 35)),
                      SizedBox(width: 10.0),
                      Text(
                        'Spourgeon',
                        style: TextStyle(
                            fontFamily: 'AppleP',
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: sheight / 35),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: sheight / 30,
                ),
                Container(
                  height: sheight / 2.8,
                  width: sheight / 2.8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/drew.jpg'),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: sheight / 10, top: sheight / 19),
                  child: Row(
                    children: <Widget>[
                      Lottie.asset('assets/android.json',
                          height: 40, width: 40),
                      SizedBox(width: 19.0),
                      Text('Android',
                          style: TextStyle(
                              fontFamily: 'AppleP',
                              fontWeight: FontWeight.w700,
                              color: Colors.green,
                              fontSize: sheight / 35)),
                      SizedBox(width: 10.0),
                      Text(
                        'Developer',
                        style: TextStyle(
                            fontFamily: 'AppleP',
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: sheight / 45),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: sheight / 12, top: sheight / 50),
                  child: Row(
                    children: <Widget>[
                      Lottie.asset('assets/apple.json', height: 70, width: 70),
                      SizedBox(width: 5.0),
                      Text('iOS App',
                          style: TextStyle(
                              fontFamily: 'AppleP',
                              fontWeight: FontWeight.w700,
                              color: Colors.purple,
                              fontSize: sheight / 35)),
                      SizedBox(width: 10.0),
                      Text(
                        'Developer',
                        style: TextStyle(
                            fontFamily: 'AppleP',
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: sheight / 45),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: sheight / 12.5, top: sheight / 70),
                  child: Row(
                    children: <Widget>[
                      Lottie.asset(
                        'assets/photo.json',
                        height: 70,
                        width: 70,
                      ),
                      SizedBox(width: 10),
                      Text('UI ',
                          style: TextStyle(
                              fontFamily: 'AppleP',
                              fontWeight: FontWeight.w700,
                              color: Colors.blue,
                              fontSize: sheight / 35)),
                      SizedBox(width: 10.0),
                      Text(
                        'Designer',
                        style: TextStyle(
                            fontFamily: 'AppleP',
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: sheight / 45),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: sheight / 10, top: sheight / 40),
                  child: Row(
                    children: <Widget>[
                      Lottie.asset('assets/uidesign.json',
                          height: 40, width: 40),
                      SizedBox(width: 22.0),
                      Text('Photo',
                          style: TextStyle(
                              fontFamily: 'AppleP',
                              fontWeight: FontWeight.w700,
                              color: Colors.red,
                              fontSize: sheight / 35)),
                      SizedBox(width: 10.0),
                      Text(
                        'Editing',
                        style: TextStyle(
                            fontFamily: 'AppleP',
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: sheight / 45),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: sheight / 10, top: sheight / 25),
                  child: Row(
                    children: <Widget>[
                      Lottie.asset('assets/video.json', height: 50, width: 50),
                      SizedBox(width: 12.0),
                      Text('Video',
                          style: TextStyle(
                              fontFamily: 'AppleP',
                              fontWeight: FontWeight.w700,
                              color: Colors.teal,
                              fontSize: sheight / 35)),
                      SizedBox(width: 10.0),
                      Text(
                        'Editing',
                        style: TextStyle(
                            fontFamily: 'AppleP',
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: sheight / 45),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: sheight / 65,
                    top: sheight / 50,
                  ),
                  child: Column(
                    children: <Widget>[
                      Lottie.asset('assets/flutter.json',
                          height: 200,
                          width: 200,
                          animate: true,
                          reverse: true,
                          repeat: true),
                      SizedBox(
                        height: sheight / 100,
                      ),
                      Text('Flutter Framework',
                          style: TextStyle(
                              fontFamily: 'Google',
                              fontWeight: FontWeight.w700,
                              color: Colors.blue,
                              fontSize: sheight / 40)),
                    ],
                  ),
                ),
                SizedBox(
                  height: sheight / 30,
                ),
                Container(
                  margin: EdgeInsets.all(50),
                  child: Text(
                    'Eventhough my main stream is Computers I am also intereseted in many streams like drawing,psycyhology,science and fitness.',
                    style: TextStyle(
                      fontFamily: 'Mon',
                      fontSize: sheight / 45,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: sheight / 30,
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Works and Achievements:',
                    style: TextStyle(
                        fontFamily: 'AppleP',
                        fontSize: sheight / 40,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: Lottie.asset('assets/trophy.json',
                      height: sheight / 3.5, width: sheight / 3.5),
                ),
                SizedBox(
                  height: sheight / 15,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    '1.THE HUB',
                    style: TextStyle(
                        fontFamily: 'AppleP',
                        fontSize: sheight / 40,
                        color: Colors.red,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: 10,
                  ),
                  child: Text(
                    'HUB contains all the top and useful websites in different streams at a single place.Made with Flutter and Firebase',
                    style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: sheight / 45,
                      color: Colors.black,
                    ),
                  ),
                ),
                new Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      primary: Colors.transparent,
                    ),
                    onPressed: () => launch(
                        'https://play.google.com/store/apps/details?id=com.andrewspourgeon.thehub'),
                    child: Image.asset(
                      'assets/google.gif',
                      height: 150,
                      width: 150,
                    ),
                  ),
                ),
                SizedBox(
                  height: sheight / 40,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    '2.BMI CALCULATOR',
                    style: TextStyle(
                        fontFamily: 'AppleP',
                        fontSize: sheight / 40,
                        color: Colors.blue,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: 10,
                  ),
                  child: Text(
                    'Calculates your BMI according to your gender and provides you some tips',
                    style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: sheight / 45,
                      color: Colors.black,
                    ),
                  ),
                ),
                new Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      primary: Colors.transparent,
                    ),
                    onPressed: () => launch(
                        'https://play.google.com/store/apps/details?id=com.andrewspourgeon.bmicalculator'),
                    child: Image.asset(
                      'assets/google.gif',
                      height: 150,
                      width: 150,
                    ),
                  ),
                ),
                SizedBox(
                  height: sheight / 40,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    '3.AKA QUIZ',
                    style: TextStyle(
                        fontFamily: 'AppleP',
                        fontSize: sheight / 40,
                        color: Colors.green,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: 10,
                  ),
                  child: Text(
                    'A fun quiz app made for my friends',
                    style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: sheight / 45,
                      color: Colors.black,
                    ),
                  ),
                ),
                new Container(
                  // margin: EdgeInsets.only(left: 135, right: 141),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      primary: Colors.transparent,
                    ),
                    onPressed: () => launch(
                        'https://play.google.com/store/apps/details?id=com.andrewspourgeon.akaquiz'),
                    child: Image.asset(
                      'assets/google.gif',

                      height: 150,
                      width: 150,
                      //colorBlendMode: BlendMode.clear,
                    ),
                  ),
                ),
                SizedBox(
                  height: sheight / 40,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    '4.FACE RECOGNIZATION',
                    style: TextStyle(
                        fontFamily: 'AppleP',
                        fontSize: sheight / 40,
                        color: Colors.purple,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: 10,
                  ),
                  child: Text(
                    'Recognizes the face in the camera.Made with python using CV',
                    style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: sheight / 45,
                      color: Colors.black,
                    ),
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(left: 135, right: 141, top: 80),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: Colors.purple),
                      backgroundColor:
                          Color.alphaBlend(Colors.white, Colors.white),
                    ),
                    onPressed: () => launch(
                        'https://drive.google.com/drive/folders/1MNEue1JRQGmyGXUBWCvOpV3M6p6lCegG'),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Resume',
                          style: TextStyle(
                              fontFamily: 'AppleP',
                              fontSize: sheight / 45,
                              color: Colors.purple),
                        ),
                        Lottie.asset(
                          'assets/download.json',
                          height: sheight / 24,
                          width: sheight / 24,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: sheight / 15,
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Contact Drew:',
                    style: TextStyle(
                        fontFamily: 'AppleP',
                        fontSize: sheight / 40,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 1, top: sheight / 100),
                    child: Lottie.asset('assets/contact.json',
                        height: sheight / 3, width: sheight / 3)),
                Container(
                  margin: EdgeInsets.all(30),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          new Container(
                            child: GestureDetector(
                              onTap: () => launch('https://wa.me/916303961320'),
                              child: SvgPicture.asset(
                                'assets/whatsapp.svg',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          new Container(
                            child: GestureDetector(
                              onTap: () => launch(
                                  'https://discordapp.com/users/736161218577825842'),
                              child: SvgPicture.asset(
                                'assets/discord.svg',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          new Container(
                            child: GestureDetector(
                              onTap: () => launch(
                                  'https://www.instagram.com/andrew_spourgeon/'),
                              child: SvgPicture.asset(
                                'assets/instagram.svg',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          new Container(
                            child: GestureDetector(
                              onTap: () async {
                                final Email sendEmail = Email(
                                  body: 'Hello Andrew Spourgeon,....',
                                  subject: 'Feedback regarding Unlesah App',
                                  recipients: ['andrewspourgeon@gmail.com'],
                                  isHTML: false,
                                );

                                await FlutterEmailSender.send(sendEmail);
                              },
                              child: SvgPicture.asset(
                                'assets/gmail.svg',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          new Container(
                            child: GestureDetector(
                              onTap: () => launch('tel://+91630391320'),
                              child: SvgPicture.asset(
                                'assets/call.svg',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: sheight / 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          new Container(
                            child: GestureDetector(
                              onTap: () =>
                                  launch('https://twitter.com/ASpourgeon'),
                              child: SvgPicture.asset(
                                'assets/twitter.svg',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          new Container(
                            child: GestureDetector(
                              onTap: () =>
                                  launch('https://github.com/AndrewSpourgeon'),
                              child: SvgPicture.asset(
                                'assets/github.svg',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          new Container(
                            child: GestureDetector(
                              onTap: () => launch(
                                  'https://www.linkedin.com/in/andrew-spourgeon-829458205/'),
                              child: SvgPicture.asset(
                                'assets/linkedin.svg',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          new Container(
                            child: GestureDetector(
                              onTap: () => launch(
                                  'https://play.google.com/store/apps/developer?id=Andrew+Spourgeon'),
                              child: Image.asset(
                                'assets/playstore.png',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          new Container(
                            child: GestureDetector(
                              onTap: () => launch(
                                  'https://www.facebook.com/profile.php?id=100008269328597'),
                              child: SvgPicture.asset(
                                'assets/facebook.svg',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
