import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/auth_screens1/signIn.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/screens/onboarding/onboarding.dart';
import 'package:travel_app/services/Provider/userProvider.dart';
import 'package:travel_app/services/Provider/tour_provider.dart';
import 'package:travel_app/services/Provider/activity_provider.dart';

void main(){
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => User()),
      ChangeNotifierProvider(create: (_) => TourProvider()),
    ChangeNotifierProvider(create: (_) => ActivityProvider())
      ],
  
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F I N O T Travel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF3EBACE),
        scaffoldBackgroundColor: const Color(0xFFF3F5F7),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xFFD8ECF1)),
      ),
      // home: HomeScreen(),
      home: Builder(
        builder: (BuildContext context) {
          final screenHeight = MediaQuery.of(context).size.height;

          return Onboarding(screenHeight: screenHeight);
        },
      ),
    );
  }
}
