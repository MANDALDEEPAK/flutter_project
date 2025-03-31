import 'package:flutter/material.dart';

import '../models/book_models.dart';

const booksData = [
  {
    'title': 'The Hobbit',
    'detail': 'A fantasy novel by J.R.R. Tolkien about the journey of Bilbo Baggins.',
    'image': 'https://m.media-amazon.com/images/I/81t2CVWEsUL.jpg',
    'rating': '⭐⭐⭐⭐⭐',
    'genre': 'Fantasy'
  },
  {
    'title': 'To Kill a Mockingbird',
    'detail': 'A novel by Harper Lee exploring racial injustice in the Deep South.',
    'image': 'https://m.media-amazon.com/images/I/81OthjkJBuL.jpg',
    'rating': '⭐⭐⭐⭐',
    'genre': 'Classic'
  },
  {
    'title': '1984',
    'detail': 'A dystopian novel by George Orwell depicting a totalitarian regime.',
    'image': 'https://m.media-amazon.com/images/I/71kxa1-0mfL.jpg',
    'rating': '⭐⭐⭐⭐',
    'genre': 'Dystopian'
  },
  {
    'title': 'Harry Potter and the Sorcerer’s Stone',
    'detail': 'The first book in J.K. Rowling’s fantasy series about a young wizard.',
    'image': 'https://m.media-amazon.com/images/I/81YOuOGFCJL.jpg',
    'rating': '⭐⭐⭐',
    'genre': 'Fantasy'
  },
  {
    'title': 'The Alchemist',
    'detail': 'A philosophical novel by Paulo Coelho about following one’s dreams.',
    'image': 'https://m.media-amazon.com/images/I/71aFt4+OTOL.jpg',
    'rating': '⭐⭐⭐⭐',
    'genre': 'Adventure'
  }
];


List<Book>  books =  booksData.map((book) => Book.fromJson(book)).toList();