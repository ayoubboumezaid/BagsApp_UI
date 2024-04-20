import 'package:bagsapp/models/product_model.dart';
import 'package:flutter/material.dart';

class RatingProduct extends StatefulWidget {
  final Product product;

  const RatingProduct({Key? key, required this.product}) : super(key: key);

  @override
  State<RatingProduct> createState() => _RatingProductState();
}

class _RatingProductState extends State<RatingProduct> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Wrap(
          children: List.generate(5, (index) {
            return Icon(
              Icons.star,
              color: index < widget.product.rating ? Colors.amber : Colors.grey,
            );
          }),
        ),
        SizedBox(width: 5),
      ],
    );
  }
}
