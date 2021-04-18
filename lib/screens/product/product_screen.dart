import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/models/product.dart';
import 'package:loja_virtual/screens/product/components/snabar_size.dart';
import 'package:loja_virtual/screens/product/components/snackbar_desscription.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen(this.product);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(product.name),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, "/products_itens"); //Precisa ser Pop, senão da erro no Drawer
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.33, 0.8],
            colors: [
              Colors.white,
              Theme.of(context).primaryColor,
            ],
          ),
        ),
        child: ListView(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Carousel(
                images: product.images.map((e) {
                  return Container(
                    width: 100.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(e)),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45),
                      ),
                      color: Colors.redAccent,
                    ),
                  );
                }).toList(),
                dotSize: 4,
                dotSpacing: 15,
                dotBgColor: Colors.transparent,
                dotColor: Theme.of(context).primaryColor,
                autoplay: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'A partir de',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      "R\$ 19.99",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                  SnackbarDescription(product),
                  SnackbarSize(product),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
