import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fronted_to_djang/api/api.dart'; // Ensure you import the necessary files

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookP = Provider.of<BookProvider>(context);
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Book by Title'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Enter book title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String query = searchController.text;
                bookP.searchBooksByTitle(query);
              },
              child: const Text('Search'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: bookP.searchedBooks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Title: ${bookP.searchedBooks[index].title}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Description: ${bookP.searchedBooks[index].description}'),
                        Text(
                            'Category: ${bookP.searchedBooks[index].category}'),
                        Text('Author ID: ${bookP.searchedBooks[index].author}'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
