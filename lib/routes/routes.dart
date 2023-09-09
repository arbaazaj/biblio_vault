import 'package:biblio_vault/model/book.dart';
import 'package:biblio_vault/screens/book_details.dart';
import 'package:flutter/material.dart';

Route bookDetailsRoute(Book? book) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          BookDetails(book: book),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
}

// Route favoriteBooksRoute(Book? book) {
//   return PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) =>
//           FavoriteBooks(book: book),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         const begin = Offset(0.0, 1.0);
//         const end = Offset.zero;
//         const curve = Curves.ease;
//
//         var tween =
//         Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//         return SlideTransition(
//           position: animation.drive(tween),
//           child: child,
//         );
//       });
// }
