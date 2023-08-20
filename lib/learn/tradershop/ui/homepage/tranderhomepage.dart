import 'dart:io';

import 'package:flutter/material.dart';

class TraderApplication extends StatelessWidget {
  const TraderApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Trader Store"),
          actions: [
            MaterialButton(
              child: Text("Home"),
              onPressed: () => print("object"),
            ),
            MaterialButton(
              child: Text("Youtube"),
              onPressed: () => print("object"),
            ),
            MaterialButton(
              child: Text("Facebook"),
              onPressed: () => print("object"),
            ),
            MaterialButton(
              child: Text("Tiktok"),
              onPressed: () => print("object"),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CategoryItem(icon: Icons.phone_android, title: 'Phones'),
                    CategoryItem(icon: Icons.laptop, title: 'Laptops'),
                    CategoryItem(icon: Icons.tv, title: 'TVs'),
                  ]),
            ),
            Container(
              color: Colors.purple,
              height: 234,
            )
          ],
        ),
      ),
    );
  }
}

class ShopeeHomePage extends StatelessWidget {
  const ShopeeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopee'),
      ),
      body: Column(
        children: [
          // Top banner
          Container(
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Text(
                'Top Banner',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          // Categories
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryItem(icon: Icons.phone_android, title: 'Phones'),
                CategoryItem(icon: Icons.laptop, title: 'Laptops'),
                CategoryItem(icon: Icons.tv, title: 'TVs'),
                // Add more category items here
              ],
            ),
          ),
          SizedBox(height: 10),
          // Products
          Expanded(
            child: GridView.count(
              crossAxisCount: 5,
              children: [
                ProductItem(
                  image: 'product1.jpg',
                  title: 'Product 1',
                  price: '100',
                ),
                ProductItem(
                  image: 'product2.jpg',
                  title: 'Product 2',
                  price: '200',
                ),
                ProductItem(
                  image: 'product3.jpg',
                  title: 'Product 3',
                  price: '400',
                ),
                ProductItem(
                  image: 'product4.jpg',
                  title: 'Product 4',
                  price: '300',
                ),
                ProductItem(
                  image: 'product5.jpg',
                  title: 'Product 5',
                  price: '500',
                ),
                ProductItem(
                  image: 'product6.jpg',
                  title: 'Product 6',
                  price: '200',
                ),
                ProductItem(
                  image: 'product7.jpg',
                  title: 'Product 7',
                  price: '200',
                ),
                // Add more product items here
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          SizedBox(height: 5),
          Text(title),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  const ProductItem({
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Image.asset(
            'assets/$image',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 5),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text('\$$price'),
        ],
      ),
    );
  }
}