// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

import 'dart:math';
import 'dart:ui';

import 'package:bagsapp/Const.dart';
import 'package:bagsapp/models/category_model.dart';
import 'package:bagsapp/models/product_model.dart';
import 'package:bagsapp/screens/detail.dart';
import 'package:bagsapp/widgets/category_item.dart';
import 'package:bagsapp/widgets/product_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int currentCategory = 0;
  int currentProduct = 0;
  PageController? controller;
  double viewPortFraction = 0.6;
  double? pageOffset = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        PageController(initialPage: 1, viewportFraction: viewPortFraction)
          ..addListener(() {
            setState(() {
              pageOffset = controller!.page;
            });
          });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Product> dataProducts = products
        .where((element) => element.category == categories[currentCategory])
        .toList();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 5),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.pinkAccent.withOpacity(0.17),
                  child: Image.asset("assets/images/profilew1.png"),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Text(
                      'Floyd Miles',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 15),
                child:  Image.asset(
                    "assets/images/icons/shopping_icon1.png",
                    height: 150,
                   
                  
                ),
              ),
            ),
          ],
        ),
        body: Stack(children: [
          Positioned(top: 30,left: 23,
            child: TweenAnimationBuilder(
                tween: Tween(begin: 1.0, end: 0.0),
                duration: Duration(milliseconds: 800),
                child:  Text(
                      'Discover Your Best \nHandBag!',
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
                    ),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(200 * value, 0.0),
                    child: child,
                  );
                }),
          ),
          Positioned(
            top: 150,
            child: ClipPath(
              clipper: Clip(),
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                color: green,
                child: Row(
                  children: [
                    ...List.generate(
                        categories.length,
                        (index) => Container(
                              height: 250,
                              width: MediaQuery.of(context).size.width /
                                  categories.length,
                              color: currentCategory == index
                                  ? brown
                                  : transparent,
                            ))
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 155,
            child: ClipPath(
              clipper: Clip(),
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                color: green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(categories.length, (index) {
                      int decrease = 0;
                      int max = 1;
                      int bottomPadding = 0;
                      for (var i = 0; i < categories.length; i++) {
                        bottomPadding =
                            index > max ? index - decrease++ : index;
                      }
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentCategory = index;
                            dataProducts = products
                                .where((element) =>
                                    element.category ==
                                    categories[currentCategory])
                                .toList();
                            if (controller!.hasClients) {
                              controller!.animateToPage(1,
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.easeInOut);
                            }
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 10, bottom: bottomPadding.abs() * 70),
                          child: CategoryItem(
                            category: categories[index],
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: Clip(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.52,
                width: MediaQuery.of(context).size.width,
                color: green1,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                ClipPath(
                  clipper: Clip(),
                  child: Container(
                    color: transparent,
                    height: MediaQuery.of(context).size.height * 0.55,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      controller: controller,
                      onPageChanged: (value) {
                        setState(() {
                          currentProduct = value % dataProducts.length;
                        });
                      },
                      itemBuilder: (context, index) {
                        double scale = max(
                            viewPortFraction,
                            (1 -
                                (pageOffset! - index).abs() +
                                viewPortFraction));
                        double angle = 0.0;
                        if (controller!.position.haveDimensions) {
                          angle = index.toDouble() - (controller!.page ?? 0);
                          angle = (angle * 0.05).clamp(-1, 1);
                        } else {
                          angle = index.toDouble() - (1);
                          angle = (angle * 0.05).clamp(-1, 1);
                        }
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                    product: dataProducts[
                                        index % dataProducts.length]),
                              ),
                            );
                          },
                          child: Hero(
                            tag: dataProducts[index % dataProducts.length].name,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 180 - (scale / 1.6 * 180)),
                              child: Transform.rotate(
                                angle: angle * pi,
                                child: Stack(
                                  alignment: AlignmentDirectional.topCenter,
                                  children: [
                                    ProductImage(
                                      product: dataProducts[
                                          index % dataProducts.length],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dataProducts[currentProduct % dataProducts.length]
                                .name,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: white,
                                fontSize: 18,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '\$${dataProducts[currentProduct % dataProducts.length].price.toStringAsFixed(2)}',
                            style: const TextStyle(
                                color: white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        ...List.generate(
                            dataProducts.length, (index) => indicator(index))
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ),
        ]));
  }

  AnimatedContainer indicator(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              width: 3,
              color: index == currentProduct
                  ? brown.withOpacity(0.6)
                  : transparent)),
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 5,
        height: 5,
        decoration: BoxDecoration(
            color: index == currentProduct ? white : white.withOpacity(0.6),
            shape: BoxShape.circle),
      ),
    );
  }
}

class Clip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 70);
    path.quadraticBezierTo(size.width / 2, -30, 0, 70);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
