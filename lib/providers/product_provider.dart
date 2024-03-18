import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopsmart_admin_ar/services/product_services.dart';

import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  final List<ProductModel> _products = [];
  List<ProductModel> get getProducts {
    return _products;
  }

  ProductModel? findByProdId(String productId) {
    if (_products.where((element) => element.productId == productId).isEmpty) {
      return null;
    }
    return _products.firstWhere((element) => element.productId == productId);
  }

  List<ProductModel> findByCategory({required String ctgName}) {
    List<ProductModel> ctgList = _products
        .where((element) => element.productCategory
            .toLowerCase()
            .contains(ctgName.toLowerCase()))
        .toList();
    return ctgList;
  }

  List<ProductModel> searchQuery(
      {required String searchText, required List<ProductModel> passedList}) {
    List<ProductModel> searchList = passedList
        .where((element) => element.productTitle
            .toLowerCase()
            .contains(searchText.toLowerCase()))
        .toList();
    return searchList;
  }

  final ProductsService _productsService = ProductsService();

  Future<void> addProduct(ProductModel product) async {
    await _productsService.addProduct(product);
    // Notify listeners when products change (for potential UI updates)
  }

  Future<void> updateProduct(ProductModel product) async {
    await _productsService.updateProduct(product);
    // Notify listeners when products change (for potential UI updates)
  }

  Future<String> uploadImage(
      {required String imageFilePath, required String imageId}) async {
    String res = await _productsService.uploadImage(
      imageFilePath: imageFilePath,
      imageId: imageId,
    );
    return res;
  }

  final productDB = FirebaseFirestore.instance.collection("products");

  Stream<List<ProductModel>> fetchProductsStream() {
    try {
      return productDB.snapshots().map((snapshot) {
        _products.clear();
        for (var element in snapshot.docs) {
          _products.insert(0, ProductModel.fromSnapshot(element));
        }
        return _products;
      });
    } catch (e) {
      rethrow;
    }
  }
}
