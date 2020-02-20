import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:fundall/utils/sizeConfig.dart';
import 'package:fundall/utils/uiData.dart';
import 'dart:async';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  static final _scaffoldKey = GlobalKey<ScaffoldState>();
  final min = 500.0;
  Timer _timer;
  int _begin = 40;
  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics;
  String _authorized = 'Authenticating';

  Future<bool> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return false;
    _canCheckBiometrics = canCheckBiometrics;
    return canCheckBiometrics;
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    if (authenticated) {
      Navigator.pushNamed(context, UIData.fundingRoute);
    } else {
      showInSnackBar("You are not authorized");
    }
    _timer.cancel();
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
    _timer.cancel();
    _authorized = "Authentication period has elapsed";
    showInSnackBar(_authorized);
  }

  void _beginAuthentication() {
    _checkBiometrics().whenComplete(() {
      if (_canCheckBiometrics) {
        _authenticate();
        _startTimer();
      } else {
        _authorized = "Device does not have finger print hardware set up";
        showInSnackBar(_authorized, action: false);
      }
    });
  }

  _startTimer() {
    const aSec = Duration(seconds: 1);
    _timer = Timer.periodic(aSec, (Timer timer) {
      if (_begin < 1) {
        _cancelAuthentication();
      } else {
        _begin = _begin - 1;
      }
    });
  }

  void showInSnackBar(String value, {bool action = true}) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(value),
      duration: Duration(seconds: 10),
      action: action
          ? SnackBarAction(
              label: "Retry Authentication",
              onPressed: () {
                _begin = 40;
                _beginAuthentication();
              })
          : null,
    ));
  }

  @override
  void dispose() {
    _timer.cancel();
    auth.stopAuthentication();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          constraints: const BoxConstraints.expand(),
          child: SingleChildScrollView(
              child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: min,
                maxHeight: SizeConfig.blockSizeVertical * 100 > min
                    ? SizeConfig.blockSizeVertical * 100
                    : min),
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(children: [
                Flexible(
                    child: Center(
                      child: SizedBox(
                        height: 400.0,
                        child: Column(
                          children: [
                            Image.asset("assets/images/logo.png",
                                width: 200.0, height: 67.0, fit: BoxFit.cover),
                            SizedBox(height: 30),
                            RichText(
                                text: TextSpan(
                                    text: "Chimdi's ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold),
                                    children: [
                                  TextSpan(
                                      text: "lifestyle",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 27))
                                ])),
                            SizedBox(height: 20),
                            Row(
                              children: <Widget>[
                                Text("Not chimdi? ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                                GestureDetector(
                                    child: Text("Switch Account",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    onTap: () => Navigator.pushNamed(
                                        context, UIData.authRoute))
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Text("New here? ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                                GestureDetector(
                                    child: Text("Create Account",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    onTap: () => Navigator.pushNamed(
                                        context, UIData.registerRoute))
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        ),
                      ),
                    ),
                    flex: 10),
                Flexible(
                    child: Center(
                      child: SizedBox(
                        height: 200.0,
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                GestureDetector(
                                    child: Container(
                                      // color: Colors.blue,
                                      height: 60.0, // height of the button
                                      width: 60.0,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.tealAccent,
                                              width: 1.0),
                                          color: Colors.black,
                                          shape: BoxShape
                                              .circle), // width of the button
                                      child: Center(
                                        child: Icon(
                                          Icons.lock_outline,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                      ),
                                    ),
                                    onTap: () => Navigator.pushNamed(
                                        context, UIData.userLoginRoute)),
                                Text("Password",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13))
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ),
                            Column(
                              children: <Widget>[
                                GestureDetector(
                                    child: Container(
                                      // color: Colors.blue,
                                      height: 60.0, // height of the button
                                      width: 60.0,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.tealAccent,
                                              width: 1.0),
                                          color: Colors.black,
                                          shape: BoxShape
                                              .circle), // width of the button
                                      child: Center(
                                        child: Icon(
                                          Icons.fingerprint,
                                          color: Colors.white,
                                          size: 35.0,
                                        ),
                                      ),
                                    ),
                                    onTap: () => _beginAuthentication()),
                                // CircleAvatar(foregroundColor: Colors.green,child: Icon(Icons.fingerprint,color: Colors.white,),maxRadius: 30.0,minRadius: 30.0,backgroundColor: Colors.black,),
                                Text("Biometrics ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13))
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                        ),
                      ),
                    ),
                    flex: 2)
              ]),
            ),
          )),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.jpg"),
                  fit: BoxFit.cover)),
        ));
  }
}
