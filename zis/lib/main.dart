import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zis/authenticate.dart';
import 'package:zis/screens/home_screen/homeView.dart';
import 'package:zis/screens/login_screen/loginView.dart';
import 'package:zis/screens/registration_screen/registrationView.dart';
import 'package:zis/utils/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Auth>(create: (_) => Auth(),),
      ],
      child: MaterialApp(
        title: 'Zis - The Ultimate Tool Share App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const Authenticate(),
          '/home': (context) => const HomeView(),
          '/login': (context) => const LoginView(),
          '/registration': (context) => const RegistrationView(),
        },
      ),
    );
  }
}
