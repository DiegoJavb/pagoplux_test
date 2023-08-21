import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:pagoplux_flutter/screens/screens.dart';
import 'package:pagoplux_flutter/services/user_service.dart';
import 'package:pagoplux_flutter/src/pages/demoppx.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserService(),
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: 'login',
      routes: {
        'login': (_) => const LoginScreen(),
        'form': (_) => FormScreen(),
        '/': (_) => const PayboxDemoPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
