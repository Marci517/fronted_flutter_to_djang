import 'package:flutter/material.dart';
import 'package:fronted_to_djang/api/api.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookProvider(),
      child: MaterialApp(
        title: 'Flutter To Django backend',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookP = Provider.of<BookProvider>(context);
    print(bookP);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library system'),
      ),
      body: ListView.builder(
          itemCount: bookP.books.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Title ${bookP.books[index].title}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description: ${bookP.books[index].description}'),
                  Text('Category: ${bookP.books[index].category}'),
                  Text('Author ID: ${bookP.books[index].author}'),
                ],
              ),
            );
          }),
    );
  }
}
