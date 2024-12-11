import 'package:flutter/material.dart';
import 'homescreen.dart'; // Pastikan Anda mengganti dengan path file HomeScreen Anda

class BuyScreen extends StatefulWidget {
  const BuyScreen({Key? key}) : super(key: key);

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  final List<Product> products = [
    Product(
      name: 'Orange',
      category: 'Fruit',
      price: 9999,
      image: 'https://cdn.loveandlemons.com/wp-content/uploads/2021/04/green-salad-500x375.jpg',
      quantity: 1,
      isSelected: true,
    ),
    Product(
      name: 'Strawberry',
      category: 'Fruit',
      price: 7999,
      image: 'https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/ayobandung/bank_image/medium/5-resep-salad-sayur-untuk-diet-enak-dan-tetap-bergizi.jpg',
      quantity: 1,
      isSelected: true,
    ),
    Product(
      name: 'Carrot',
      category: 'Vegetable',
      price: 8999,
      image: 'https://res.cloudinary.com/dk0z4ums3/image/upload/v1721267732/attached_image/strawberry-inilah-kandungan-nutrisi-dan-manfaatnya.jpg',
      quantity: 1,
      isSelected: false,
    ),
    Product(
      name: 'Pineapple',
      category: 'Fruit',
      price: 12000,
      image: 'https://www.healthxchange.sg/sites/hexassets/Assets/food-nutrition/pineapple-health-benefits-and-ways-to-enjoy.jpg',
      quantity: 1,
      isSelected: false,
    ),
  ];

  bool selectAll = false;

  void updateSelectAll(bool? value) {
    setState(() {
      selectAll = value ?? false;
      for (var product in products) {
        product.isSelected = selectAll;
      }
    });
  }

  double get totalAmount {
    return products
        .where((product) => product.isSelected)
        .fold(0, (sum, product) => sum + (product.price * product.quantity));
  }

  int get selectedItemsCount {
    return products.where((product) => product.isSelected).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        title: const Text(
          'My Order',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Checkbox(
                  value: selectAll,
                  onChanged: updateSelectAll,
                  activeColor: Colors.green,
                ),
                Text(
                  'Select All (${products.length} items)',
                  style: const TextStyle(fontSize: 16),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // Handle delete action
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  product: product,
                  onQuantityChanged: (value) {
                    setState(() {
                      product.quantity = value;
                    });
                  },
                  onSelectionChanged: (value) {
                    setState(() {
                      product.isSelected = value ?? false;
                      selectAll = products.every((p) => p.isSelected);
                    });
                  },
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Delivery',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Free',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Rp${totalAmount.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: selectedItemsCount > 0
                        ? () {
                            // Handle checkout
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Check Out ( $selectedItemsCount )',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String category;
  final double price;
  final String image;
  int quantity;
  bool isSelected;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    this.quantity = 1,
    this.isSelected = false,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;
  final ValueChanged<int> onQuantityChanged;
  final ValueChanged<bool?> onSelectionChanged;

  const ProductCard({
    Key? key,
    required this.product,
    required this.onQuantityChanged,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.grey[100],
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Checkbox(
              value: product.isSelected,
              onChanged: onSelectionChanged,
              activeColor: Colors.green,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                product.image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product.category,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rp${product.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: product.quantity > 1
                      ? () => onQuantityChanged(product.quantity - 1)
                      : null,
                ),
                Text(
                  '${product.quantity}',
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => onQuantityChanged(product.quantity + 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
