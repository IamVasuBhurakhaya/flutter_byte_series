import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class BadgeScreen extends StatefulWidget {
  @override
  _BadgeScreenState createState() => _BadgeScreenState();
}

class _BadgeScreenState extends State<BadgeScreen> {
  int cartBadgeAmount = 3;
  late bool showCartBadge;
  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    showCartBadge = cartBadgeAmount > 0;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        bottomNavigationBar: _bottomNavigationBar(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          leading: badges.Badge(
            position: badges.BadgePosition.topEnd(top: 10, end: 10),
            badgeContent: const SizedBox.shrink(),
            child: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {},
            ),
          ),
          title: const Text(
            'ShopEase',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[shoppingCartBadge()],
          bottom: _tabBar(),
        ),
        body: Column(
          children: <Widget>[
            addRemoveCartButtons(),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return buildProductCard(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget shoppingCartBadge() {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: 0, end: 3),
      showBadge: showCartBadge,
      badgeStyle: badges.BadgeStyle(
        badgeColor: color,
      ),
      badgeContent: Text(
        cartBadgeAmount.toString(),
        style: const TextStyle(color: Colors.white),
      ),
      child: IconButton(
        icon: const Icon(Icons.shopping_cart, color: Colors.black),
        onPressed: () {},
      ),
    );
  }

  PreferredSizeWidget _tabBar() {
    return TabBar(
      indicatorColor: Colors.blue,
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.grey,
      tabs: [
        Tab(
          icon: badges.Badge(
            badgeStyle: const badges.BadgeStyle(badgeColor: Colors.blue),
            position: badges.BadgePosition.topEnd(top: -14),
            badgeContent: const Text(
              '3',
              style: TextStyle(color: Colors.white),
            ),
            child: const Icon(Icons.category),
          ),
        ),
        Tab(
          icon: badges.Badge(
            badgeStyle: badges.BadgeStyle(
              shape: badges.BadgeShape.square,
              borderRadius: BorderRadius.circular(5),
              badgeGradient: const badges.BadgeGradient.linear(
                colors: [Colors.purple, Colors.blue],
              ),
            ),
            badgeContent: const Text(
              'NEW',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            child: const Icon(Icons.local_offer),
          ),
        ),
      ],
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: [
        const BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        const BottomNavigationBarItem(
          label: 'Messages',
          icon: Icon(Icons.message),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: badges.Badge(
            position: badges.BadgePosition.topEnd(),
            badgeStyle: const badges.BadgeStyle(
              padding: EdgeInsets.all(6),
            ),
            badgeContent: const SizedBox.shrink(),
            child: const Icon(Icons.person),
          ),
        ),
      ],
    );
  }

  Widget addRemoveCartButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ElevatedButton.icon(
            onPressed: () => setState(() {
              cartBadgeAmount++;
              color = Colors.red;
            }),
            icon: const Icon(Icons.add),
            label: const Text('Add to Cart'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
          ElevatedButton.icon(
            onPressed: showCartBadge
                ? () => setState(() {
                      cartBadgeAmount--;
                      color = Colors.blue;
                    })
                : null,
            icon: const Icon(Icons.remove),
            label: const Text('Remove from Cart'),
            style: ElevatedButton.styleFrom(
              backgroundColor: showCartBadge ? Colors.red : Colors.grey,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductCard(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                'https://via.placeholder.com/150',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product ${index + 1}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${(index + 1) * 10}',
                  style: const TextStyle(color: Colors.green, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
