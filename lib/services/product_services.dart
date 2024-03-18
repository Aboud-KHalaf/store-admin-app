import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shopsmart_admin_ar/models/product_model.dart';

class ProductsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _productsCollection = 'products';

  Stream<QuerySnapshot<Map<String, dynamic>>> getProductsStream() {
    return _firestore.collection(_productsCollection).snapshots();
  }

  Future<void> addProduct(ProductModel product) async {
    try {
      await _firestore.collection(_productsCollection).add(product.toMap());
    } catch (error) {
      debugPrint('Error adding product: $error');
      throw Exception('Failed to add product'); // Re-throw for handling in UI
    }
  }

  Future<void> updateProduct(ProductModel product) async {
    try {
      await _firestore
          .collection(_productsCollection)
          .doc(product.productId)
          .update(product.toMap());
    } catch (error) {
      debugPrint('Error update product: $error');
      throw Exception(
          'Failed to update product'); // Re-throw for handling in UI
    }
  }

  UploadTask? _uploadTask;
  Future<String> uploadImage(
      {required String imageFilePath, required String imageId}) async {
    final storage = FirebaseStorage.instance;
    final filename = '$imageId.jpg'; // Generate unique filename
    final reference = storage.ref().child('productsImages').child(filename);

    _uploadTask = reference.putFile(File(imageFilePath));
    final snapshot = await _uploadTask!.whenComplete(() => null);

    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }
}
