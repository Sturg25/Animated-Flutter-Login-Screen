import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';
import 'package:finals_output/menu.dart';
import 'package:finals_output/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _key = new GlobalKey<FormState>();
  bool _validate = false;

  static Widget buildEmailTF(TextEditingController myText) { ///Email Box
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            textCapitalization: TextCapitalization.words,
            controller: myText,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Color(0xFF3a27b0),
              fontFamily: 'SubZER0',
              fontWeight: FontWeight.bold,
            ),
            validator: emailValidate,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xFF755395),
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  static Widget buildPasswordTF(TextEditingController myText) { ///Password Box
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child:  TextFormField(
            controller: myText,
            obscureText: true,
            style: TextStyle(
              color: Color(0xFF3a27b0),
              fontFamily: 'SubZER0',
            ),
            validator: passwordValidate,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xFF755395),
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  static Widget buildLoginBtn(var buttonTitle, Function function) { ///Login Button
    return Container(
      padding: EdgeInsets.only(right: 40,left: 40,bottom: 15),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          function();
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Color(0xFF755395),
        child: Text(
          buttonTitle,
          style: TextStyle(
            color: Color(0xFFccd4b8),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'SubZER0',
          ),
        ),
      ),
    );
  }

  static String emailValidate(String value) { ///Email Validation
    String pattern = r'cictapps@wvsu.edu.ph' ;
    RegExp regExpEmail = new RegExp(pattern);
    if (value.length == 0) {
      return "  Please enter a valid email";
    } else if(!regExpEmail.hasMatch(value)){
      return "  Invalid Email";
    } else if (value.length > 20) {
      return "  Invalid Email";
    }else
      return null;
  }

  static String passwordValidate(String passValue) { ///Password Validation
    String pattern = r'1234';
    RegExp regExpPass = new RegExp(pattern);
    if (passValue.length == 0) {
      return "  Please enter a valid password";
    } else if(!regExpPass.hasMatch(passValue)){
      return "  Invalid Password";
    } else if (passValue.length > 4) {
      return "  Invalid Password";
    } else
      return null;
  }

  validateData() { ///Email and Password Validation
    if (_key.currentState.validate()) {
      scaffoldKey.currentState.showSnackBar(new SnackBar(
        backgroundColor: Colors.transparent,
        duration: new Duration(seconds: 9),
        content: new Row(
          children: <Widget>[
            new CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            new Text(
              "Submitting...",
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ));

      _key.currentState.save();
    } else {
      // validation error
      setState(() {
        scaffoldKey.currentState.hideCurrentSnackBar();
        _validate = true;
      });
    }
  }

  Future addData() {
    print("Email:${emailController.text}");
    print("Password:${passwordController.text}");
    setState(() {
      scaffoldKey.currentState.hideCurrentSnackBar();
    });
  }

  ///Background and Animation thing starts here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF102039),
        body: Form(
          key: _key,
          autovalidate: _validate,
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF2f1e88),
                          Color(0xFF2f1e88),
                          Color(0xFF142a4a),
                          Color(0xFF102039),
                        ],
                        stops: [0.1, 0.3, 0.7, 0.9],
                      ),
                    ),
                  ),
                  Lottie.asset( ///The Lottie Animation
                    'assets/synthrunner.json',
                    repeat: true,
                    reverse: false,
                    animate: true,
                  ),
                  Container(
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 40.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 415,
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            height: 315,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFe2eacd), width:3),
                              borderRadius: BorderRadius.circular(13),
                              color: Color(0xFFf7459a),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 5.0),
                                buildEmailTF(emailController),
                                SizedBox(height: 15.0,),
                                buildPasswordTF(passwordController),
                                SizedBox(height: 20.0,),
                                Container(
                                  height: 50,
                                  width: 200,
                                  padding: EdgeInsets.only(top: 8, right: 40,left: 40,bottom: 15),
                                  decoration: BoxDecoration(
                                      color: Color(0xFF755395),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: FlatButton(
                                    onPressed: () {
                                      if (_key.currentState.validate()) { ///Login Validator
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (_) => MenuPage()));
                                        print("Validated");
                                      } else {
                                        print("Not Validated");
                                      }
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Color(0xFFccd4b8),
                                          letterSpacing: 1.5,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'SubZER0'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}