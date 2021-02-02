import 'package:flutter/material.dart';
import 'package:finals_output/login.dart';
import 'package:lottie/lottie.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MenuPage extends StatefulWidget {
  @override
 MenuPageState createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage> {

  static Widget buildLogoutBtn(var buttonTitle, Function function) { ///Logout Button
    return Container(
      padding: EdgeInsets.only(right: 40,left: 40,bottom: 15),
      width: double.infinity,
      child:Container(
      decoration: BoxDecoration( ///Glow Effect
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF2de6f6),
            blurRadius: 5.0,
            spreadRadius: 5.0,
            offset: Offset(
              0.0,
              0.0,
            ),
          ),
        ]
      ),
      child: RaisedButton(
        onPressed: () {
          function();
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Color(0xFF1d2637),
        child: Text(
          buttonTitle,
          style: TextStyle(
            color: Color(0xFF2de6f6),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'SubZER0',
          ),
        ),
      ),
    ),
    );
  }

  /// audio
  bool _play = true;

  Future loginPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  ///Background and Animation thing starts here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF102039),
      body: Form(
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Lottie.asset(

                ///The Lottie Animation
                'assets/synthrunner.json',
                repeat: true,
                reverse: false,
                animate: true,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Lottie.asset(

                      ///Another Lottie Animation
                      'assets/CassetteParadise.json',
                      repeat: true,
                      reverse: false,
                      animate: true,
                    ),
                  ],
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 334.0,
                  ),
                  child: AudioWidget.assets(

                    ///Audio Playing in Background
                    path: "assets/audios/Paradox.mp3",
                    play: _play,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text("      Radio is now Playing ♫",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Color(0xFFff2a8d),
                              shadows: [
                                Shadow( // bottomLeft
                                  offset: Offset(-1.5, -1.5),
                                  color: Color(0xFFe2efca),
                                ),
                                Shadow( // bottomRight
                                  offset: Offset(1.5, -1.5),
                                  color: Color(0xFFe2efca),
                                ),
                                Shadow( // topRight
                                  offset: Offset(.5, 2.5),
                                  color: Color(0xFFe2efca),
                                ),
                                Shadow( // topLeft
                                  offset: Offset(-2.5, 2.5),
                                  color: Color(0xFFe2efca),
                                ),
                              ],
                              letterSpacing: 1.5,
                              fontSize: 23,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SubZER0'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 780.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildLogoutBtn("Logout", loginPage),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}