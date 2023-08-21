import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pagoplux_flutter/services/user_service.dart';
import 'package:pagoplux_flutter/ui/input_decorations.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  final _nombre = TextEditingController();
  final _telefono = TextEditingController();
  final _direccion = TextEditingController();
  final _email = TextEditingController();
  final _valorPago = TextEditingController();
  final _identificacion = TextEditingController();

  FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form screen'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop,
            icon: const Icon(Icons.sensor_door_outlined),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nombre,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 3) {
                      return 'El nombre es obligatorio';
                    }
                  },
                  decoration: InputDecorations.authInputDecoration(
                    hintText: '',
                    labelText: 'Nombre',
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _telefono,
                  validator: (value) {
                    String pattern = r'^09\d{8}$';
                    RegExp regExp = RegExp(pattern);
                    return regExp.hasMatch(value ?? '')
                        ? null
                        : 'El numero no es correcto';
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: '098 999 9999',
                    labelText: 'Número de teléfono',
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _direccion,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: '',
                    labelText: 'Dirección',
                  ),
                  validator: (value) {
                    if (value != null && value.length >= 6) return null;
                    return 'La dirección debe tener mas de 6 caracteres';
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _email,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: '',
                    labelText: 'Correo Electrónico',
                  ),
                  validator: (value) {
                    String pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = RegExp(pattern);
                    return regExp.hasMatch(value ?? '')
                        ? null
                        : 'El correo no es correcto';
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _valorPago,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: '\$150',
                    labelText: 'Valor de Pago',
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _identificacion,
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: '',
                    labelText: 'Identificación',
                  ),
                  validator: (value) {
                    String pattern = r'^\d{10}$';
                    RegExp regExp = RegExp(pattern);
                    return regExp.hasMatch(value ?? '')
                        ? null
                        : 'El numero no es correcto';
                  },
                ),
                const SizedBox(height: 100)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Pagar'),
        onPressed: () {
          userService.loadTransactions(
            _nombre,
            _telefono,
            _direccion,
            _email,
            _valorPago,
            _identificacion,
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
