import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:badges/badges.dart' as badges;

class SideMenuScreen extends StatefulWidget {
  const SideMenuScreen({super.key});

  @override
  State<SideMenuScreen> createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen> {
  final _controller = SideMenuController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideMenu(
            controller: _controller,
            backgroundColor: const Color(0xFFF5F7FA),
            mode: SideMenuMode.open,
            builder: (data) {
              return SideMenuData(
                defaultTileData: const SideMenuItemTileDefaults(
                  hoverColor: Colors.blueAccent,
                ),
                animItems: const SideMenuItemsAnimationData(),
                items: [
                  const SideMenuItemDataTitle(
                    title: 'PERSONAL',
                    titleStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SideMenuItemDataTile(
                    isSelected: _currentIndex == 0,
                    onTap: () => setState(() => _currentIndex = 0),
                    title: 'Dashboard',
                    titleStyle: const TextStyle(color: Colors.black),
                    icon: const Icon(Icons.dashboard_outlined),
                    selectedIcon: const Icon(Icons.dashboard),
                  ),
                  SideMenuItemDataTile(
                    isSelected: _currentIndex == 1,
                    onTap: () => setState(() => _currentIndex = 1),
                    title: 'Products',
                    titleStyle: const TextStyle(color: Colors.black),
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                  SideMenuItemDataTile(
                    isSelected: _currentIndex == 2,
                    onTap: () => setState(() => _currentIndex = 2),
                    title: 'Mail',
                    titleStyle: const TextStyle(color: Colors.black),
                    icon: const Icon(Icons.mail_outline),
                  ),
                  SideMenuItemDataTile(
                    isSelected: _currentIndex == 3,
                    onTap: () => setState(() => _currentIndex = 3),
                    title: 'Campaigns',
                    titleStyle: const TextStyle(color: Colors.black),
                    icon: const Icon(Icons.campaign_outlined),
                  ),
                  SideMenuItemDataTile(
                    isSelected: _currentIndex == 4,
                    onTap: () => setState(() => _currentIndex = 4),
                    title: 'Calendar',
                    titleStyle: const TextStyle(color: Colors.black),
                    icon: const Icon(Icons.calendar_today_outlined),
                  ),
                  SideMenuItemDataTile(
                    isSelected: _currentIndex == 5,
                    onTap: () => setState(() => _currentIndex = 5),
                    title: 'Contacts',
                    titleStyle: const TextStyle(color: Colors.black),
                    icon: const Icon(Icons.contacts_outlined),
                  ),
                  const SideMenuItemDataTitle(
                    title: 'ACCOUNT',
                    titleStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SideMenuItemDataTile(
                    isSelected: _currentIndex == 6,
                    onTap: () => setState(() => _currentIndex = 6),
                    title: 'Notifications',
                    badgeBuilder: (tile) => badges.Badge(
                      badgeContent: const Text(
                        '24',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      position: badges.BadgePosition.topEnd(),
                      child: tile,
                    ),
                    titleStyle: const TextStyle(color: Colors.black),
                    icon: const Icon(Icons.notifications_outlined),
                  ),
                  SideMenuItemDataTile(
                    isSelected: _currentIndex == 7,
                    onTap: () => setState(() => _currentIndex = 7),
                    title: 'Chat',
                    badgeBuilder: (tile) => badges.Badge(
                      badgeContent: const Text(
                        '8',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      position: badges.BadgePosition.topEnd(),
                      child: tile,
                    ),
                    titleStyle: const TextStyle(color: Colors.black),
                    icon: const Icon(Icons.chat_bubble_outline),
                  ),
                  SideMenuItemDataTile(
                    isSelected: _currentIndex == 8,
                    onTap: () => setState(() => _currentIndex = 8),
                    title: 'Settings',
                    titleStyle: const TextStyle(color: Colors.black),
                    icon: const Icon(Icons.settings_outlined),
                  ),
                ],
                footer: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/user.jpg'),
                        radius: 24,
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nina Ergemla',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'nina_erg@ergemla.com',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  'Dashboard Content',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
