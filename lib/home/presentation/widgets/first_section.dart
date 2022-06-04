import 'package:flutter/material.dart';

class FirstSection extends StatelessWidget {
  final int value;

  const FirstSection(this.value);

  @override
  Widget build(BuildContext context) {
    print("Building FirstSection");
    return Center(
      child: Text(value.toString()),
    );
  }
}
