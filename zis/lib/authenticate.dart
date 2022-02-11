import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zis/screens/home_screen/homeView.dart';
import 'package:zis/screens/login_screen/loginView.dart';
import 'package:zis/utils/auth.dart';

import 'models/userModel.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<Auth>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null ? const LoginView() : const HomeView();
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
