import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/ui/content/listate.dart';
import 'package:flutter_application_2/ui/content/user.dart';
import 'package:flutter_application_2/ui/content/user_repository.dart';
import 'package:flutter_application_2/ui/pages/create_page.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  UserRepository userRepositoryData;
  LoginPage(this.userRepositoryData, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<LoginPage> createState() => _LoginPageState(userRepositoryData);
}

class _LoginPageState extends State<LoginPage> {
  // Repository initialization
  UserRepository userRepositoryData;
  _LoginPageState(this.userRepositoryData);

  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _loginDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Inicio de Sesión'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Parece que tu usuario no fue encontrado'),
                Text('Quieres intentar de nuevo el ingreso?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _textFieldAlert(String text1, String text2) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Inicio de Sesión'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(text1),
                Text(text2),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('De acuerdo!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // ignore: non_constant_identifier_names
  bool ValidateEmptyEntries() {
    if (_emailController.text == "" && _passwordController.text == "") {
      _textFieldAlert(
          'Hey! parece que has olvidado llenar la informacion de ingreso',
          'Completa los campos');
      return false;
    } else if (_emailController.text == "") {
      _textFieldAlert('Ups, parece que has olvidado colocar tu email',
          'Llena ese campo e intenta de nuevo');
      return false;
    } else if (_passwordController.text == "") {
      _textFieldAlert('Ups, parece que has olvidado colocar tu contraseña',
          'Llena ese campo e intenta de nuevo');
      return false;
    } else {
      return true;
    }
  }

  // ignore: non_constant_identifier_names
  bool ValidateUserLogin() {
    User user =
        User.withoutName(_emailController.text, _passwordController.text);
    var responseValue = userRepositoryData.validateUser(user);
    if (responseValue != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.person_crop_circle,
                  size: 100,
                ),
                // Hello Again!
                Text(
                  'Hola de nuevo!',
                  style: GoogleFonts.bebasNeue(
                      fontSize: 52, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Bienvenido',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                const SizedBox(
                  height: 50,
                ),
                // Email TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Password TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Contraseña',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Sign In Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () => {
                      if (ValidateEmptyEntries())
                        {
                          if (ValidateUserLogin())
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ListateSubjects()),
                              )
                            }
                          else
                            {_loginDialog()}
                        }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Iniciar Sesion',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('No eres usuario?',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CreateNewUser(userRepositoryData)),
                        )
                      },
                      child: const Text(' Registrate ya',
                          style: TextStyle(
                              color: Colors.lightGreen,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
