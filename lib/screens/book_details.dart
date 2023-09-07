import 'package:biblio_vault/model/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  final Book? book;

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
          icon: const Icon(CupertinoIcons.arrow_left,
            color: Colors.white,
          ),
        ),
        backgroundColor: CupertinoColors.systemOrange,
        title: Text(
          book!.bookName,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Hero(
                      tag: book!.bookId,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          color: Colors.green,
                          child: Image.network(
                            book!.bookImage,
                            width: 150.0,
                            height: 150.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          book!.bookName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Text(
                          book!.bookAuthor,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          '⭐ ${book!.bookRating}',
                          style: TextStyle(
                            color: Colors.amber.shade600,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          book!.bookPrice,
                          style: TextStyle(
                            color: Colors.green.shade600,
                            fontWeight: FontWeight.bold,
                            fontSize: 19.0,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        InkWell(
                          highlightColor: Colors.pinkAccent.shade100,
                          splashColor: CupertinoColors.systemPink,
                          borderRadius: BorderRadius.circular(16.0),
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                    width: 1.0,
                                    color: CupertinoColors.systemPink)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.favorite,
                                    color: CupertinoColors.systemPink,
                                  ),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    'Add to favorite',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const Divider(thickness: 2.0),
              Text(
                'About the Book',
                style: TextStyle(
                  letterSpacing: 1.2,
                  fontSize: 21.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
              ),
              const Divider(thickness: 2.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'A novel about holding on, letting go, and learning to love again.'
                  'Now in paperback, the endearing novel that captured readers\''
                  ' hearts and introduced a fresh new voice in women\'s fiction Cecelia Ahern.'
                  ' Holly couldn\'t live without her husband Gerry, until the day she had to. '
                  'They were the kind of young couple who could finish each other\'s sentences. '
                  'When Gerry succumbs to a terminal illness and dies, '
                  '30-year-old Holly is set adrift, unable to pick up the pieces. '
                  'But with the help of a series of letters her husband left her'
                  ' before he died and a little nudging from an eccentric assortment of family and friends, she learns to laugh, overcome her fears, and discover a world she never knew existed. '
                  'The kind of enchanting novel with cross-generational appeal that comes along once in a great while, PS, I Love You is a captivating love letter to the world!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey.shade800,
                    fontSize: 18.0,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
