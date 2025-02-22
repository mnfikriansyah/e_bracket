import 'package:e_bracket/pages/home/home_page.dart';
import 'package:e_bracket/pages/screens.dart';
import 'package:flutter/material.dart';

import '../model/models.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomePage.route();
      case HomePage.routeName:
        return HomePage.route();
      case CartPage.routeName:
        return CartPage.route();
      case ProductPage.routeName:
        return ProductPage.route(product: settings.arguments as Product);
      case CatalogPage.routeName:
        return CatalogPage.route(category: settings.arguments as Category);
      case WishlistPage.routeName:
        return WishlistPage.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('Error')),
      ),
    );
  }
}
