import 'package:ecommerce/Core/providers/Auth_provider.dart';
import 'package:ecommerce/my_theme.dart';
import 'package:ecommerce/ui/home/home_screen.dart';
import 'package:ecommerce/ui/login/login_screen.dart';
import 'package:ecommerce/ui/register/register_screen.dart';
import 'package:ecommerce/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) {
      return UserProvider();
    },
      child: const MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomAppBarTheme: BottomAppBarTheme(
          color: Theme.of(context).primaryColor
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0
        ),
        primaryColor: const Color(0xff004182),
        textTheme: const TextTheme(
          labelLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
              color: Mytheme.primarycolor
          ),
          labelSmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Mytheme.primarycolor
          ),
        )
      ),
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        HomeScreen.routeName: (_) => HomeScreen()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}


