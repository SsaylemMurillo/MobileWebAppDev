import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/ui/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../content/user.dart';
import '../content/user_repository.dart';

// ignore: must_be_immutable
class CreateNewUser extends StatefulWidget {
  UserRepository userRepositoryData;
  CreateNewUser(this.userRepositoryData, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<CreateNewUser> createState() => _CreateNewUserState(userRepositoryData);
}

class _CreateNewUserState extends State<CreateNewUser> {
  // Repository initialization
  UserRepository userRepositoryData;
  _CreateNewUserState(this.userRepositoryData);

  // text controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
    if (_nameController.text == "" &&
        _emailController.text == "" &&
        _passwordController.text == "") {
      _textFieldAlert(
          'Hey! parece que has olvidado llenar la informacion para el registro',
          'Completa los campos');
      return false;
    } else if (_nameController.text == "") {
      _textFieldAlert(
          'Ups, parece que has olvidado colocar tu nombre de usuario',
          'Llena ese campo e intenta de nuevo');
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
  bool CreateNewUser() {
    User user = User(
        _nameController.text, _emailController.text, _passwordController.text);
    return userRepositoryData.addUser(user);
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
                  CupertinoIcons.person_crop_circle_badge_plus,
                  size: 100,
                ),
                Text(
                  'Registro de Usuario',
                  style: GoogleFonts.bebasNeue(
                      fontSize: 52, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Bienvenido, vamos a registrarnos',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                const SizedBox(
                  height: 50,
                ),
                // Name TextField
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
                        controller: _nameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nombre',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                          if (CreateNewUser())
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LoginPage(userRepositoryData)),
                              ),
                              _textFieldAlert("Usuario Creado Con Exito!",
                                  "Bienvenido, por favor inicia sesion nuevamente"),
                            }
                          else
                            {
                              _textFieldAlert(
                                  "Parece que tu usuario no pudo ser creado",
                                  "Revisa que la informacion no corresponda a un usuario registrado")
                            }
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
                          'Registrar Usuario',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
