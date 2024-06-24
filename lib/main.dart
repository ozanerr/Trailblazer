// ignore_for_file: prefer_const_constructors
import 'package:Trailblazer_Flutter/pages/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Trailblazer_Flutter/util/provider.dart';
<<<<<<< HEAD
import 'package:Trailblazer_Flutter/util/paymentprov.dart';
import 'package:Trailblazer_Flutter/util/languageprov.dart';
import 'package:Trailblazer_Flutter/util/settingnotifprov.dart';
=======
import 'package:Trailblazer_Flutter/util/ProfileProvider.dart';
>>>>>>> f88b177d12b8fa6883aeb300c8a8f1f39f16498b

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CoffeeProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
<<<<<<< HEAD
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
=======
        ChangeNotifierProvider(create: (context) => PaymentProvider()),
>>>>>>> f88b177d12b8fa6883aeb300c8a8f1f39f16498b
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: Onboarding(),
        theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
        ),
      ),
    );
  }
}
