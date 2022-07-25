// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:e_bracket/blocs/wishlist/wishlist_bloc.dart';
import 'package:e_bracket/model/product_model.dart';
import 'package:e_bracket/widgets/custom_appbar.dart';
import 'package:e_bracket/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/widgets.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});
  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => WishlistPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist'),
      bottomNavigationBar: CustomNavBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WishlistLoaded) {
            return GridView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 2.4),
              itemCount: state.wishlist.products.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: ProductCard(
                    product: state.wishlist.products[index],
                    widthFactor: 1.1,
                    leftPosition: 100,
                    isWhishlist: true,
                  ),
                );
              },
            );
          } else {
            return Text('Something went wrong');
          }
        },
      ),
    );
  }
}
