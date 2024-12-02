import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Providers/json_providing.dart';
import '../DetaileScreen/detailed_screen.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    JsonProvider provider = Provider.of<JsonProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Planets'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: provider.bookmarkedList.length,
        itemBuilder: (context, index) {
          final planet = provider.bookmarkedList[index];
          return ListTile(
            leading: Image.asset(planet.image),
            title: Text(
              planet.name,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              planet.subtitle,
              style: TextStyle(color: Colors.grey),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.white),
              onPressed: () {
                provider.toggleBookmark(planet);
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(planet: planet),
                ),
              );
            },
          );
        },
      ),
      backgroundColor: Colors.black,
    );
  }
}
