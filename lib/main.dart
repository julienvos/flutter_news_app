import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/data/main_news_item_dao.dart';
import 'package:flutter_news/managers/app_state_manager.dart';
import 'package:flutter_news/navigation/navigation.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appStateManager.initializeApp();
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  sharedPrefs.containsKey('boarded') ? appStateManager.onBoarded() : null;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(
            create: (_) => MainNewsDAO(),
            lazy: false,
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => appStateManager,
            lazy: false,
          )
        ],
        child: MaterialApp.router(
          localizationsDelegates: [
            FormBuilderLocalizations.delegate,
          ],
          scrollBehavior: ScrollConfiguration.of(context).copyWith(
              scrollbars:
                  false), // to avoid scroll errors in chrome // other option is to name every scrollcontroller
          routeInformationParser: goRouter.routeInformationParser,
          routerDelegate: goRouter.routerDelegate,
          debugShowCheckedModeBanner: false,
          title: 'News App',
          theme: ThemeData(
              dividerTheme:
                  DividerThemeData(color: Colors.grey[350], thickness: 1),
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                      textStyle:
                          GoogleFonts.poppins(fontWeight: FontWeight.w700))),
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                      textStyle:
                          GoogleFonts.poppins(fontWeight: FontWeight.w400),
                      primary: Color.fromARGB(255, 6, 115, 205))),
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.grey[600]),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              scaffoldBackgroundColor: Color.fromARGB(255, 235, 234, 234),
              textTheme:
                  GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
        ));
  }
}
