import 'package:flutter/material.dart';

// Import your feature screens
import '../features/clients/screens/client_list_screen.dart';
import '../features/catalog/screens/item_list_screen.dart';
import '../features/business_profile/screens/business_profile_screen.dart';
import '../features/invoices/screens/invoice_list_screen.dart'; // <-- Imported here

class MainNavigationHub extends StatefulWidget {
  const MainNavigationHub({super.key});

  @override
  State<MainNavigationHub> createState() => _MainNavigationHubState();
}

class _MainNavigationHubState extends State<MainNavigationHub> {
  // We now start on index 0 (Invoices) since the dashboard is built
  int _selectedIndex = 0;

  // The list of screens in exact order of the navigation tabs
  final List<Widget> _screens = [
    // 0: Invoices Dashboard
    const InvoiceListScreen(),
    // 1: Clients CRM
    const ClientListScreen(),
    // 2: Item Catalog
    const ItemListScreen(),
    // 3: Business Profile
    const BusinessProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The body switches out the screen based on the selected tab
      body: _screens[_selectedIndex],

      // Modern Material 3 Navigation Bar
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long),
            label: 'Invoices',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: 'Clients',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2),
            label: 'Catalog',
          ),
          NavigationDestination(
            icon: Icon(Icons.store_outlined),
            selectedIcon: Icon(Icons.store),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
