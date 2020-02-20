

import 'package:flutter/material.dart';
import 'package:fundall/ui/screens/auth.dart';
import 'package:fundall/ui/screens/card.dart';
import 'package:fundall/ui/screens/funding.dart';
import 'package:fundall/ui/screens/login.dart';
import 'package:fundall/ui/screens/notfound/notfound_page.dart';
import 'package:fundall/ui/screens/register.dart';
import 'package:fundall/ui/screens/splash.dart';
import 'package:fundall/ui/screens/update.dart';
import 'package:fundall/ui/screens/userLogin.dart';
import 'package:fundall/ui/screens/wallet.dart';
import 'package:fundall/utils/uiData.dart';



class Router {


    static Route<dynamic> generateRoute(settings) {
      switch (settings.name) {
        case UIData.splashRoute:
          return MaterialPageRoute(builder: (_) => Splash());
          break;
        case UIData.authRoute:
          return MaterialPageRoute(builder: (_) => Auth());
          break;
        case UIData.loginRoute:
          return MaterialPageRoute(builder: (_) => Login());
          break;
        case UIData.registerRoute:
          return MaterialPageRoute(builder: (_) => Register());
          break;
        case UIData.cardsRoute:
          return MaterialPageRoute(builder: (_) => Cards());
          break;
        case UIData.fundingRoute:
          return MaterialPageRoute(builder: (_) => Funding());
          break;
        case UIData.updateRoute:
          return MaterialPageRoute(builder: (_) => Update());
          break;
        case UIData.userLoginRoute:
          return MaterialPageRoute(builder: (_) => UserLogin());
          break;
        case UIData.walletRoute:
          return MaterialPageRoute(builder: (_) => Wallet());
          break;
      }
    }

    static Route<dynamic>  unknownRoute (settings) {
      return new MaterialPageRoute(
        builder: (context) => new NotFoundPage(
        ));
    }

}




