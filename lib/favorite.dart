import 'package:flutter/material.dart';
import 'buy.dart';
import 'homescreen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[50],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.green),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.green),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BuyScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Favorite",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: favoriteItems.length,
                itemBuilder: (context, index) {
                  final item = favoriteItems[index];
                  return _buildFavoriteCard(
                      item.title, item.assetPath, item.pricePerKg);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteCard(String title, String assetPath, int pricePerKg) {
    String formatCurrency(int amount) {
      return "Rp${amount.toString()}";
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.green[800]!,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              assetPath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  "${formatCurrency(pricePerKg)} / kg",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteItem {
  final String title;
  final String assetPath;
  final int pricePerKg;

  FavoriteItem({
    required this.title,
    required this.assetPath,
    required this.pricePerKg,
  });
}

final List<FavoriteItem> favoriteItems = [
  FavoriteItem(
      title: "Strawberry",
      assetPath: "assets/images/STR.jpg",
      pricePerKg: 56000),
  FavoriteItem(
      title: "Carrot", assetPath: "assets/images/cr.jpg", pricePerKg: 8500),
  FavoriteItem(
      title: "Pineapple",
      assetPath: "assets/images/pnl.jpg",
      pricePerKg: 56000),
  FavoriteItem(
      title: "Orange", assetPath: "assets/images/Jeruk.jpg", pricePerKg: 50000),
];
