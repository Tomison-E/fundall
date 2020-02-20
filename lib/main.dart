import 'package:flutter/material.dart';
import 'package:fundall/router/router.dart';
import 'package:fundall/utils/uiData.dart';
import 'package:provider/provider.dart';
import 'core/viewModels/userVM.dart';
import 'package:google_fonts/google_fonts.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => locator<UserVM>(),
          ),
        ],
        child: MaterialApp(
          title: 'Fundall',
          theme: ThemeData(
              textTheme: GoogleFonts.openSansTextTheme(
            Theme.of(context).textTheme,
          )),
          onGenerateRoute: Router.generateRoute,
          onUnknownRoute: Router.unknownRoute,
          initialRoute: UIData.splashRoute,
          debugShowCheckedModeBanner: false,
        ));
  }
}
