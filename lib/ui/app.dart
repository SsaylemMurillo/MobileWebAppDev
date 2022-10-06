import 'package:flutter/material.dart';
import 'package:flutter_application_2/ui/pages/login_page.dart';

import 'content/user_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD Subjects',
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: LoginPage(UserRepository()),
      debugShowCheckedModeBanner: false,
    );
  }
}
