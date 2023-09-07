import 'package:biblio_vault/model/book.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  final Book book;

  const BookDetails({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Colors.orange,
        title: Text(
          book.bookName,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'bookImageTag',
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  color: Colors.green,
                  child: Image.network(
                    book.bookImage,
                    width: 150.0,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    book.bookName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Text(
                    book.bookAuthor,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '⭐ ${book.bookRating}',
                    style: TextStyle(
                      color: Colors.amber.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    color: Colors.orange,
                    thickness: 1,
                  ),
                  Text(
                    book.bookPrice,
                    style: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            const Divider(color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
