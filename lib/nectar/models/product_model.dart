import 'dart:ui';

class ProductModel {
  String icon;
  String name;
  Color backgroundColor;
  Color borderColor;

  ProductModel({
    required this.icon,
    required this.name,
    required this.backgroundColor,
    required this.borderColor,
  });

  static List<ProductModel> products = [
    ProductModel(
      icon: 'assets/images/fruits.png',
      name: 'Fresh Fruits & Vegetables',
      backgroundColor: const Color(0xffedf8f2),
      borderColor: const Color(0xff9bc1a5),
    ),
    ProductModel(
      icon: 'assets/images/oil.png',
      name: 'Cooking Oil & Ghee',
      backgroundColor: const Color(0xfffff6ed),
      borderColor: const Color(0xffe6d0bb),
    ),
    ProductModel(
      icon: 'assets/images/meat.png',
      name: 'Meat & Fish',
      backgroundColor: const Color(0xfffde8e3),
      borderColor: const Color(0xffd8bcb6),
    ),
    ProductModel(
      icon: 'assets/images/snacks.png',
      name: 'Bakery & Snacks',
      backgroundColor: const Color(0xfff5ebf6),
      borderColor: const Color(0xffd4c8df),
    ),
    ProductModel(
      icon: 'assets/images/dairy.png',
      name: 'Dairy & Eggs',
      backgroundColor: const Color(0xfffff8e5),
      borderColor: const Color(0xfff0ecbe),
    ),
    ProductModel(
      icon: 'assets/images/beverages.png',
      name: 'Beverages',
      backgroundColor: const Color(0xffeef7fc),
      borderColor: const Color(0xffd1e1ee),
    ),
  ];
}
