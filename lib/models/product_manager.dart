import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:loja_virtual/models/product.dart';

class ProductManager extends ChangeNotifier {
  ProductManager() {
    _loadAllProducts();
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Product> allProducts = [];

  String _search = '';

  String get search => _search;

  set search(String value) {
    _search = value;
    notifyListeners();
  }

  List<Product> get filteredProduct {
    final List<Product> filteredProduct = [];

    if (search.isEmpty) {
      filteredProduct.addAll(allProducts);
    } else {
      filteredProduct.addAll(allProducts
          .where((p) => p.name.toLowerCase().contains(search.toLowerCase())));
      //Pegou cada um dos produtos de todos os produtos
      // e verificou se o nome dele contem a mesma pesquisa em minusculo
    }

    return filteredProduct;
  }

  Future<void> _loadAllProducts() async {
    final QuerySnapshot snapshot = await firestore.collection('products').get();

    allProducts = snapshot.docs.map((e) => Product.fromDocument(e)).toList();

    notifyListeners();
  }
}
