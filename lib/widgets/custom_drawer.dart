import 'package:biblio_vault/model/book.dart';
import 'package:biblio_vault/screens/favorites.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final List<Book> books;

  const CustomDrawer({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: CupertinoColors.systemOrange),
            child: Text(
              'Biblio Vault',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.systemBackground),
            ),
          ),
          const ListTile(
            title: Text('Dashboard'),
          ),
          ListTile(
            title: const Text('Favorites'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => FavoriteBooks(books: books),
              ),
            ),
          ),
          const ListTile(
            title: Text('Settings'),
          ),
          const ListTile(
            title: Text('About Us'),
          ),
        ],
      ),
    );
  }
}
