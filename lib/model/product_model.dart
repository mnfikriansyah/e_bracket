import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
        isRecommended,
        isPopular,
      ];
  static List<Product> products = [
    Product(
      name: 'Soft Drink #1',
      category: 'Soft Drink',
      imageUrl:
          'https://images.unsplash.com/photo-1632161927166-0aea13d8f7e6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=698&q=80',
      price: 2.00,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      name: 'Smoothies #1',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1502741224143-90386d7f8c82?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2669&q=80',
      price: 5.00,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: 'Coffee #2',
      category: 'Water',
      imageUrl:
          'https://images.unsplash.com/photo-1593652023641-56dbabbb5e37?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
      price: 1.80,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Smoothies #3',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1654084789555-a12dd9ec060b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
      price: 4.00,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: 'Soft Drink #2',
      category: 'Soft Drink',
      imageUrl:
          'https://images.unsplash.com/photo-1581006852262-e4307cf6283a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
      price: 3.00,
      isRecommended: false,
      isPopular: false,
    ),
  ];
}
