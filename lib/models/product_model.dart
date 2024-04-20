import 'package:bagsapp/models/category_model.dart';

class Product {
  final String description;
  final String name;
  final double price;
  final Category category;
  final String imagePath;
  final String modelPath;
  double rating;

  Product({required this.description, 
    required this.category,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.modelPath,
    this.rating = 0.0,
  });
}

List<Product> products = [
 
  Product(
      rating: 4,
      modelPath: 'images/chanel_leather_bag.glb',
      imagePath: 'images/backbag/backpack_boss.png',
      name: 'Boss logo-rubberised backpack',
      category: categories[1],
      price: 219,
       description:''),
        Product(
    rating: 5,
    modelPath: 'images/backpack_dior_hit.glb',
    imagePath: 'images/backbag/backpack_dior1.png',
    name: 'Small Dior Hit The Road ',
    category: categories[1],
    price: 2900,
    description:'The Dior Hit The Road backpack is a new style this season that combines modernity with the House couture spirit. Crafted in black CD Diamond canvas inspired by the House archives, it is embellished with smooth calfskin details. Adorned with a Christian Dior nylon jacquard band and a Christian Dior buckle, the design has a spacious main compartment and a large flap pocket on the front. The practical small backpack will lend the finishing touch to all casual outfits.'
  ),
  Product(
      rating: 5,
      modelPath: '',
      imagePath: 'images/backbag/backpack_gucci.png',
      name: 'Gucci',
      category: categories[1],
      price: 2490,
       description:''),
  Product(
      rating: 5,
      modelPath: 'images/dior_dlite1.glb',
      imagePath: 'images/backbag/backpack_armani.png',
      name: 'Armani womens backpack',
      category: categories[1],
      price: 200,
       description:''),
  Product(
      rating: 5,
      modelPath: '',
      imagePath: 'images/clutchbag/clutch_lv.png',
      name: 'LOUIS VUITTON',
      category: categories[2],
      price: 420,
       description:''),
  Product(
      rating: 5,
      modelPath: '',
      imagePath: 'images/clutchbag/clutch_chanel.png',
      name: 'Chanel Leather',
      category: categories[2],
      price: 4000, description:''),
  Product(
      rating: 5,
      modelPath: '',
      imagePath: 'images/clutchbag/clutch_bios.png',
      name: 'Bios faux leather clutch bag',
      category: categories[2],
      price: 248,
       description:''),
  Product(
      rating: 5,
      modelPath: '',
      imagePath: 'images/clutchbag/clutch_armani.png',
      name: 'Armani',
      category: categories[2],
      price: 50,
       description:''),
  Product(
      rating: 5,
      modelPath: '',
      imagePath: 'images/boxbag/boxbag_LV.png',
      name: 'Gucci',
      category: categories[3],
      price: 13,
       description:''),
  Product(
      rating: 5,
      modelPath: '',
      imagePath: 'images/boxbag/boxbag_LV.png',
      name: 'Chanel Leather',
      category: categories[3],
      price: 12,
       description:''),
  Product(
      rating: 5,
      modelPath: '',
      imagePath: 'images/boxbag/boxbag_LV.png',
      name: 'Chanel',
      category: categories[3],
      price: 10,
       description:''),
      
  Product(
      rating: 5,
      modelPath: '',
      imagePath: 'images/boxbag/boxbag_LV.png',
      name: 'Dior ',
      category: categories[3],
      price: 13,
       description:''),
  Product(
      rating: 5,
      modelPath: 'images/gucci.glb',
      imagePath: 'images/handsbag/Gucci.png',
      name: 'Chanel Leather',
      category: categories[0],
      price: 8850
      , description:''),
  Product(
      rating: 5,
      modelPath: 'images/chanel_leather_bag.glb',
      imagePath: 'images/handsbag/chanel.png',
      name: 'Chanel Leather',
      category: categories[0],
      price: 8850,
       description:''),

  Product(
      rating: 5,
      modelPath: '',
      imagePath: 'images/handsbag/chanel2.png',
      name: 'Hermes',
      category: categories[0],
      price: 8980,
       description:''),
  Product(
      rating: 5,
      modelPath: 'images/dior_dlite1.glb',
      imagePath: 'images/handsbag/dior3.png',
      name: 'Medium Lady D-Lite Bag',
      category: categories[0],
      price: 4600,
       description:'Unveiled at the Cruise 2024 Fashion Show, the refined style showcases the iconic blue Dior Oblique embroidery and calfskin. Designed to keep all the daily essentials organized, the interior is equipped with a zipped pocket and patch pockets. Featuring an embroidered adjustable, removable shoulder strap, the practical, medium tote exemplifies Dior savoir-faire and can be carried by hand or worn over the shoulder.'),
];
