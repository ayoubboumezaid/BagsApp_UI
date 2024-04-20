// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int _quantity = 0;

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    setState(() {
      if (_quantity > 0) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color:  Color.fromRGBO(221, 218, 208, 1.0),
            borderRadius: BorderRadius.circular(20)
          ),
          child: IconButton(
            onPressed: _decrement,
            icon: Icon(Icons.remove,size: 16,),
            color: Colors.black
          ),
        ),
        SizedBox(width: 8),
        Text(
          '$_quantity',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(width: 8),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color:  Color.fromRGBO(221, 218, 208, 1.0),
            borderRadius: BorderRadius.circular(20)
          ),
          child: IconButton(
            onPressed: _increment,
            icon: Icon(Icons.add,size: 16,),
            color: Colors.black
          ),
        ),
      ],
    );
  }
}
