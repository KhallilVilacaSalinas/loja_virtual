import 'package:flutter/material.dart';
import 'package:loja_virtual/models/product.dart';

class SnackbarDescription extends StatelessWidget {
  const SnackbarDescription(this.product);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              ),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                          ),
                          child: Icon(Icons.close_rounded),
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment(-1, -10),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        "Descrição:",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-1, -10),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        product.description,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            duration: Duration(days: 356),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Divider(
              thickness: 0.9,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7, bottom: 7),
                  child: Text(
                    'Descrição',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                )
              ],
            ),
            Divider(
              thickness: 0.9,
            ),
          ],
        ),
      ),
    );
  }
}
