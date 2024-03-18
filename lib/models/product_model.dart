import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  final String productId,
      productTitle,
      productPrice,
      productCategory,
      productDescription,
      productImage,
      productQuantity;

  ProductModel({
    required this.productId,
    required this.productTitle,
    required this.productPrice,
    required this.productCategory,
    required this.productDescription,
    required this.productImage,
    required this.productQuantity,
  });
  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productTitle': productTitle,
      'productPrice': productPrice,
      'productCategory': productCategory,
      'productDescription': productDescription,
      'productImage': productImage,
      'productQuantity': productQuantity,
      'productTime': Timestamp.now(),
    };
  }

  // Optionally, create a factory constructor from a Firestore document snapshot (for deserialization)
  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return ProductModel(
      productId: snapshot.id,
      productTitle: snapshot.get('productTitle'),
      productPrice: snapshot.get('productPrice'),
      productCategory: snapshot.get('productCategory'),
      productDescription: snapshot.get('productDescription'),
      productImage: snapshot.get('productImage'),
      productQuantity: snapshot.get('productQuantity'),
    );
  }
}
