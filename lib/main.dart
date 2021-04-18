import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loja_virtual/models/product_manager.dart';
import 'package:loja_virtual/models/routes.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ProductManager(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
          title: 'Loja do Khallil',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Color.fromARGB(255, 4, 125, 141),
            scaffoldBackgroundColor: Color.fromARGB(255, 4, 125, 141),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            appBarTheme: const AppBarTheme(elevation: 0),
          ),
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute),
    );
  }
}
