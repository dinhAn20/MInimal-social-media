import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learn_material_3/di/injection.dart';
import 'package:learn_material_3/modules/auth/pages/login_or_register.dart';
import 'package:learn_material_3/firebase_options.dart';
import 'package:learn_material_3/theme/dark_mode.dart';
import 'package:learn_material_3/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diannguyxn',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: lightMode,
      darkTheme: darkMode,
      home: const LoginOrRegister(),
    );
  }
}
