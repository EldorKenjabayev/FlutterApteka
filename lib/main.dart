import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.grey),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for medicine',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://www.biotichealthcare.com/storage/Blogs/ihyho9SOmLTQfFOzTWOT1N3DudTZd4CmEhg741mV.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.black54,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'The wish for healing has always been half of health.',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shop By Category',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CategoriesPage()),
                      );
                    },
                    child: Text('See All'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryCard(
                    icon: Icons.healing, // Changed icon
                    title: 'Lungs Drug',
                  ),
                  CategoryCard(
                    icon: Icons.local_drink, // Changed icon
                    title: 'Kidney Drug',
                  ),
                  CategoryCard(
                    icon: Icons.visibility,
                    title: 'Eye Drug',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recommend for you',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: 15,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
                            imageUrl: 'https://www.pharmengineering.uz/sitepad-data/uploads/2023/03/4.png',
                            productName: 'Product Demo',
                            productPrice: '\$10.1',
                          ),
                        ),
                      );
                    },
                    child: ProductCard(
                      imageUrl: 'https://www.pharmengineering.uz/sitepad-data/uploads/2023/03/4.png',
                      productName: 'Product Demo',
                      productPrice: '\$10.1',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
            ),
            SizedBox(width: 40), // The dummy child for spacing
            IconButton(
              icon: Icon(Icons.account_balance_wallet),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.file_upload),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Home',
        child: Icon(Icons.home),
        elevation: 2.0,
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;

  CategoryCard({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: Colors.blue), // Increased icon size and added color
            SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productPrice;

  ProductCard({required this.imageUrl, required this.productName, required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(imageUrl),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(productName),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(productPrice),
          ),
        ],
      ),
    );
  }
}

class ProductDetailPage extends StatefulWidget {
  final String imageUrl;
  final String productName;
  final String productPrice;

  ProductDetailPage({required this.imageUrl, required this.productName, required this.productPrice});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;

  void addToCart() {
    // Add product to cart logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(widget.imageUrl),
            SizedBox(height: 16),
            Text(
              widget.productName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.productPrice,
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) quantity--;
                    });
                  },
                ),
                Text(
                  quantity.toString(),
                  style: TextStyle(fontSize: 20),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: addToCart,
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy cart items for demonstration
    final List<Map<String, String>> cartItems = [
      {
        'imageUrl': 'https://www.pharmengineering.uz/sitepad-data/uploads/2023/03/4.png',
        'productName': 'Product Demo',
        'productPrice': '\$10.1',
      },
      {
        'imageUrl': 'https://www.pharmengineering.uz/sitepad-data/uploads/2023/03/4.png',
        'productName': 'Another Product',
        'productPrice': '\$20.2',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(cartItems[index]['imageUrl']!),
            title: Text(cartItems[index]['productName']!),
            subtitle: Text(cartItems[index]['productPrice']!),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Implement order functionality here
          },
          child: Text('Order Now'),
        ),
      ),
    );
  }
}

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Lungs Drug'),
            leading: Icon(Icons.healing),
            onTap: () {
              // Navigate to category products
            },
          ),
          ListTile(
            title: Text('Kidney Drug'),
            leading: Icon(Icons.local_drink),
            onTap: () {
              // Navigate to category products
            },
          ),
          ListTile(
            title: Text('Eye Drug'),
            leading: Icon(Icons.visibility),
            onTap: () {
              // Navigate to category products
            },
          ),
        ],
      ),
    );
  }
}
