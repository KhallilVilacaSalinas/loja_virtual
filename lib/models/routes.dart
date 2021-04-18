import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/base/base_screen.dart';
import 'package:loja_virtual/screens/login/login_screen.dart';
import 'package:loja_virtual/screens/notfound/notfound_screen.dart';
import 'package:loja_virtual/screens/product/product_screen.dart';
import 'package:loja_virtual/screens/products_itens/products_itens_screen.dart';
import 'package:loja_virtual/screens/singup/singup_screen.dart';

class RouteGenerator {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BaseScreen(),
        );
      case '/singup':
        return MaterialPageRoute(
          builder: (_) => SingupScreen(),
        );
      case '/singin':
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case '/notfound':
        return MaterialPageRoute(
          builder: (_) => NotFound(),
        );
      case '/products_itens':
        return MaterialPageRoute(
          builder: (_) => ProductsItensScreen(),
        );
      case '/product':
        return MaterialPageRoute(
          builder: (_) => ProductScreen(args),
        );
      // case '/config':
      //   return MaterialPageRoute(
      //     builder: (_) => (),
      //   );

      default:
        _erroRota();
    }
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(
      builder: (_) => NotFound(),
    );
  }
}
