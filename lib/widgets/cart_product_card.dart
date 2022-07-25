// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:e_bracket/model/models.dart';
import 'package:e_bracket/widgets/custom_appbar.dart';
import 'package:e_bracket/widgets/custom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_bloc.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            height: 100,
            width: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  'RM${product.price}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoading) {
                return CircularProgressIndicator();
              }
              if (state is CartLoaded) {
                return Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(CartProductRemoved(product));
                      },
                    ),
                    Text(
                      '$quantity',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    IconButton(
                      icon: Icon(Icons.add_circle),
                      onPressed: () {
                        context.read<CartBloc>().add(CartProductAdded(product));
                      },
                    ),
                  ],
                );
              } else {
                return Text('Something went wrong');
              }
            },
          ),
        ],
      ),
    );
  }
}
