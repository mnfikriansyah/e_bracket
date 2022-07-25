// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:e_bracket/model/cart_model.dart';
import 'package:e_bracket/model/models.dart';
import 'package:e_bracket/widgets/custom_appbar.dart';
import 'package:e_bracket/widgets/custom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/widgets.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CartPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {},
                child: Text(
                  'CHECKOUT',
                  style: Theme.of(context).textTheme.headline3!,
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Cart().freeDeliveryString,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(),
                        elevation: 0,
                      ),
                      child: Text(
                        'Add More',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                    itemCount: Cart().products.length,
                    itemBuilder: (context, index) {
                      return CartProductCard(product: Cart().products[index]);
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Divider(thickness: 2),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SUBTOTAL',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            'RM${Cart().subtotalString}',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'DELIVERY',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            'RM${Cart().deliveryFeeString}',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(50),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.all(5.0),
                            height: 50,
                            decoration: BoxDecoration(color: Colors.black),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'TOTAL',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    'RM${Cart().totalString}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
