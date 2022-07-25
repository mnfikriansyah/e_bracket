import '../../model/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
