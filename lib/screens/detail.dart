// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:bagsapp/widgets/Appbar_product.dart';
import 'package:bagsapp/widgets/ColorPicker.dart';
import 'package:bagsapp/widgets/quantitySelector.dart';

import 'package:o3d/o3d.dart';
import 'package:bagsapp/models/product_model.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  DetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  O3DController o3dController = O3DController();
  bool isShowMore = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProductAppBar(),
              Container(
                color: Colors.grey.shade200,
                height: 300,
                width: 600,
                child: O3D(
                  src: 'assets/${widget.product.modelPath}',
                  ar: false,
                  autoPlay: true,
                  autoRotate: false,
                  controller: o3dController,
                ),
              ),
              SizedBox(height: 15),
              TweenAnimationBuilder(
                tween: Tween(begin: 1.0, end: 0.0),
                duration: Duration(milliseconds: 1000),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(
                      0.0,
                      300 * value,
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(left: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.grey.withOpacity(0.17),
                                child: Text(
                                  '\$${widget.product.price}',
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.product.name,
                                    style: TextStyle(
                                      fontSize: 22.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      ...List.generate(5, (index) {
                                        return Icon(
                                          Icons.star,
                                          color: index < widget.product.rating
                                              ? Colors.amber
                                              : Colors.grey,
                                        );
                                      }),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: const Text(
                                  "Color",
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 100),
                                child: const Text(
                                  "Qty",
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              ColorPicker(),
                              SizedBox(width: 110),
                              QuantitySelector(),
                            ],
                          ),
                          SizedBox(height: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Description',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                widget.product.description,
                                style: TextStyle(fontSize: 16),
                                maxLines: isShowMore ? 3 : null,
                                overflow: TextOverflow.fade,
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    isShowMore = !isShowMore;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 120),
                                  child: Text(
                                    isShowMore ? "Show more" : "Show less",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 320,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 30,
                height: 29,
                child: Image.asset(
                  'assets/images/icons/add.png',
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 8),
              Text(
                "Add To Cart",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
