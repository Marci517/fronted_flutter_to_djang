import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/book.dart';
import 'package:http/http.dart' as http;

class BookProvider with ChangeNotifier {
  BookProvider() {
    fetchTasks();
  }

  List<Book> bookList = [];

  List<Book> get books {
    return bookList;
  }

  fetchTasks() async {
    final url = Uri.parse('http://127.0.0.1:8000/books/apis/all/?format=json');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      bookList = data.map<Book>((json) => Book.fromJson(json)).toList();
      notifyListeners();
    }
  }
}
