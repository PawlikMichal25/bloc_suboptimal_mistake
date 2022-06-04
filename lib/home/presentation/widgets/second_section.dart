import 'package:flutter/material.dart';

class SecondSection extends StatelessWidget {
  final List<String> products;

  const SecondSection(this.products);

  @override
  Widget build(BuildContext context) {
    print("Building SecondSection");
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => Text(products[index]),
    );
  }
}
