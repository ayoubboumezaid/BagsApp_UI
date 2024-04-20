
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ProductAppBar extends StatelessWidget {
  const ProductAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 40),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
 Navigator.of(context).popUntil((route) => route.isFirst);
},
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(15),
              ),
              icon: const Icon(Ionicons.chevron_back),
            ),
            const Spacer(),
            
            IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: const EdgeInsets.all(10),
              ),
               icon: Image.asset(
              'assets/images/icons/heart.png', 
              color: Colors.red.shade300, 
              width: 40,
              height: 40, 
            ),
            iconSize: 35,
            padding: const EdgeInsets.all(15), 
            color: Colors.white, 
          ),
            
          ],
        ),
      ),
    );
  }
}