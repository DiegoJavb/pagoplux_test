import 'package:flutter/material.dart';
import 'package:pagoplux_flutter/ui/input_decorations.dart';
import 'package:pagoplux_flutter/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(height: 30),
                    _LoginForm()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _userController,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Usuario',
              prefixIcon: Icons.alternate_email_sharp,
            ),
          ),
          const SizedBox(height: 40),
          TextFormField(
            controller: _passwordController,
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: '******',
              labelText: 'Contraseña',
              prefixIcon: Icons.lock_outline,
            ),
          ),
          const SizedBox(height: 40),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Colors.deepPurple,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: const Text(
                'Ingresar',
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPressed: () {
              //TODO: submit form:
              if (_userController.text == 'Pagoplux' &&
                  _passwordController.text == 'Pagoplux') {
                Navigator.of(context).pushNamed('form');
              }
            },
          )
        ],
      ),
    );
  }
}
