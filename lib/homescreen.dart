import 'package:flutter/material.dart';
import 'buy.dart'; // Impor file buy.dart sesuai path

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[50],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              // Navigasi ke layar BuyScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BuyScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, What fruit or Vegetable do you want today?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Search for fruit or vegetable",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Recommended",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRecommendedCard("Salad combo", "\Rp.20,000", "https://cdn.loveandlemons.com/wp-content/uploads/2021/04/green-salad-500x375.jpg"),
                  _buildRecommendedCard("Salad mango combo", "\Rp.8,000", "https://cdn.loveandlemons.com/wp-content/uploads/2021/04/green-salad-500x375.jpg"),
                ],
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hottest",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Popular | New combo | Top"),
                ],
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildHorizontalCard("Quinoa fruit salad", "\Rp.10,000", "https://cdn.loveandlemons.com/wp-content/uploads/2021/04/green-salad-500x375.jpg"),
                    _buildHorizontalCard("Tropical fruit salad", "\Rp.10,000", "https://cdn.loveandlemons.com/wp-content/uploads/2021/04/green-salad-500x375.jpg"),
                    _buildHorizontalCard("Melon mix", "\Rp.10,000", "https://cdn.loveandlemons.com/wp-content/uploads/2021/04/green-salad-500x375.jpg"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendedCard(String title, String price, String imageUrl) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(imageUrl, height: 80, fit: BoxFit.cover),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(price, style: TextStyle(color: Colors.green[700])),
          SizedBox(height: 8),
          IconButton(
            icon: Icon(Icons.add_circle, color: Colors.green),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalCard(String title, String price, String imageUrl) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(imageUrl, height: 80, fit: BoxFit.cover),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(price, style: TextStyle(color: Colors.green[700])),
          SizedBox(height: 8),
          IconButton(
            icon: Icon(Icons.add_circle, color: Colors.green),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
