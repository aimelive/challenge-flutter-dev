import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui/screens/read_book.dart';
import 'package:flutter_ui/models/books_api.dart';
import 'package:flutter_ui/shared/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shimmer/shimmer.dart';

class BooksList extends StatefulWidget {
  const BooksList({Key? key}) : super(key: key);

  @override
  State<BooksList> createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  Widget bookTemplate(book, widthSize) {
    bool isMuted = true;
    return Column(
      children: [
        Container(
          width: widthSize,
          color: const Color(0xFF193059),
          child: InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return Dialog(
                      backgroundColor: const Color(0xFFD9D9D9),
                      child: Container(
                        //height: MediaQuery.of(context).size.height / 2,
                        height: MediaQuery.of(context).size.height / 2,
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(),
                                  Text(
                                    book.title,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                  IconButton(
                                    onPressed: () => Navigator.pop(context),
                                    icon: const Icon(Icons.close),
                                  )
                                ],
                              ),
                              Image.network(
                                book.imgUrl,
                                width: MediaQuery.of(context).size.width,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 25,
                                      backgroundColor: themePrimaryColor,
                                      backgroundImage:
                                          AssetImage("images/umuntu.jpeg"),
                                    ),
                                    const SizedBox(width: 5.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("By ${book.author}"),
                                        const Text("10 Books")
                                      ],
                                    ),
                                    const Spacer(),
                                    const Icon(Icons.verified_outlined)
                                  ],
                                ),
                              ),
                              const Text(
                                "Description",
                                style: TextStyle(fontSize: 18.0),
                              ),
                              Text(book.description),
                              const SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                ReadBook(book: book))),
                                    splashColor:
                                        themePrimaryColor.withOpacity(0.9),
                                    highlightColor:
                                        themeWhiteColor.withOpacity(0.5),
                                    child: Ink(
                                      padding: const EdgeInsets.all(12.0),
                                      height: 82,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFF97316)
                                              .withOpacity(0.6),
                                          borderRadius:
                                              BorderRadius.circular(28)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          Icon(Icons.book_online),
                                          Text(
                                            "Read and \n write",
                                            style: TextStyle(
                                                color: themeWhiteColor),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(12.0),
                                    height: 80,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFF97316)
                                            .withOpacity(0.6),
                                        borderRadius:
                                            BorderRadius.circular(28)),
                                    child: Column(
                                      children: const [
                                        Icon(Icons.radio),
                                        Text(
                                          "Listen only",
                                          style:
                                              TextStyle(color: themeWhiteColor),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(12.0),
                                    height: 80,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFF97316)
                                            .withOpacity(0.6),
                                        borderRadius:
                                            BorderRadius.circular(28)),
                                    child: Column(
                                      children: const [
                                        Icon(Icons.library_books),
                                        Text(
                                          "Read only",
                                          style:
                                              TextStyle(color: themeWhiteColor),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
            highlightColor: Colors.red,
            splashColor: Colors.yellow,
            child: Ink(
              child: Row(
                children: [
                  Image.network(
                    book.imgUrl,
                    width: widthSize / 2,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        book.preview,
                        style: const TextStyle(color: themeWhiteColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${book.title} \n Author: ${book.author}",
              style: const TextStyle(fontSize: 12.0),
            ),
            const SizedBox(width: 10),
            SvgPicture.asset("images/vector.svg"),
            const SizedBox(width: 5),
            GestureDetector(
                onTap: () {
                  setState(() {
                    isMuted = !isMuted;
                  });
                },
                child: isMuted
                    ? SvgPicture.asset("images/mic_on.svg")
                    : SvgPicture.asset("images/mute.svg")),
            const SizedBox(width: 10),
            SvgPicture.asset("images/currency.svg"),
            Text("${book.price} Frw"),
            ElevatedButton.icon(
              onPressed: () {},
              icon: SvgPicture.asset("images/cart.svg"),
              label: const Text(
                "Buy",
                style: TextStyle(color: themeBlackColor),
              ),
              style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFFBBF24), elevation: 0.0),
            )
          ],
        )
      ],
    );
  }

  Map? data;
  bool isLoading = true;
  void getData() async {
    try {
      Uri url = Uri.parse(apiEndPoint);
      http.Response response = await http.get(url);
      setState(() {
        data = jsonDecode(response.body);
        isLoading = false;
      });
    } catch (e) {
      print("Something went wrong, $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;

    return isLoading
        ? Column(
            children: const [
              ShimmerLoading(),
              ShimmerLoading(),
              ShimmerLoading(),
            ],
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: data?['Books'].length == 0
                ? const Text("No book found!")
                : Column(
                    children: data?['Books'].map<Widget>(
                      (book) {
                        final bookData = Book.fromJsonBook(book);
                        return bookTemplate(bookData, widthSize);
                      },
                    ).toList(),
                  ));
  }
}

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 100.0,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(3)),
      ),
    );
  }
}
