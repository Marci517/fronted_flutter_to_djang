import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/book.dart';
import 'package:http/http.dart' as http;

class BookProvider with ChangeNotifier {
  BookProvider() {
    fetchTasks();
  }

  List<Book> bookList = [];
  List<Book> _searchedBooks = [];

  List<Book> get books => bookList;

  List<Book> get searchedBooks => _searchedBooks;

  // Fetch all books (initial data)
  fetchTasks() async {
    final url = Uri.parse('http://127.0.0.1:8000/books/apis/all/?format=json');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      bookList = data.map<Book>((json) => Book.fromJson(json)).toList();
      notifyListeners();
    }
  }

  // Search books by title via API call
  void searchBooksByTitle(String title) async {
    final url =
        Uri.parse('http://127.0.0.1:8000/books/apis/name/$title/?format=json');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      _searchedBooks = [Book.fromJson(data)];
      print(_searchedBooks);
      notifyListeners();
    } else {
      _searchedBooks = []; // Clear search results if the request fails
      notifyListeners();
    }
  }
}
