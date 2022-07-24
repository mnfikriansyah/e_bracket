// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_bracket/widgets/widgets.dart';

import '../../model/models.dart';

class CatalogPage extends StatelessWidget {
  // const CatalogPage({super.key});
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CatalogPage(category: category),
    );
  }

  final Category category;

  const CatalogPage({required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();

    return Scaffold(
        appBar: CustomAppBar(title: category.name),
        bottomNavigationBar: CustomNavBar(),
        body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.15),
          itemCount: categoryProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: ProductCard(
                product: categoryProducts[index],
                widthFactor: 2.2,
              ),
            );
          },
        ));
  }
}
