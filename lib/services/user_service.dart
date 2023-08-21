import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserService extends ChangeNotifier {
  Future loadTransactions(
    TextEditingController nombre,
    TextEditingController telefono,
    TextEditingController direccion,
    TextEditingController email,
    TextEditingController valorPago,
    TextEditingController identificacion,
  ) async {
    String username = 'o3NXHGmfujN3Tyzp1cyCDu3xst';
    String password = 'TkBhZQP3zwMyx3JwC5HeFqzXM4p0jzsXp0hTbWRnI4riUtJT';
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    print(basicAuth);
    final Map<String, String> data = {
      "numeroIdentificacion": "0992664673001",
      "initialDate": "2020-07-08",
      "finalDate": "2020-07-20",
      "tipoPago": "unico",
      "estado": "aprobado",
      "identificacionCliente": "09199223221"
    };
    final r = await http.post(
      Uri.parse(
          'https://apipre.pagoplux.com/intv1/integrations/getTransactionsEstablishmentResource'),
      headers: <String, String>{
        'authorization': basicAuth,
      },
      body: json.encode(data),
    );
    print(r.statusCode);
    print(r.body);
  }
}
