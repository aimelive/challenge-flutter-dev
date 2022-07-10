import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui/screens/books_list.dart';
import 'package:flutter_ui/shared/constants.dart';

class BooksZonePage extends StatefulWidget {
  const BooksZonePage({Key? key}) : super(key: key);

  @override
  State<BooksZonePage> createState() => _BooksZonePageState();
}

class _BooksZonePageState extends State<BooksZonePage> {
  final LinearGradient _gradient = const LinearGradient(
      colors: <Color>[Color(0xFFFEB326), themeWhiteColor, Color(0xFFFEB326)]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.0,
        backgroundColor: themeWhiteColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: const MyCustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 180.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/laptop_book.jpeg"),
                    ),
                  ),
                ),
                Container(
                  height: 180.0,
                  alignment: Alignment.center,
                  //decoration: const BoxDecoration(color: Color(0xAAF2F2F2)),
                  child: ShaderMask(
                    shaderCallback: (Rect rect) {
                      return _gradient.createShader(rect);
                    },
                    child: const Text(
                      "Augmented library of your learning contents",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Filter",
                  style: TextStyle(fontSize: 18.0),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "images/content_dropdown.svg",
                          width: 15.0,
                        ),
                        const Text(" Content")
                      ],
                    ),
                    Chip(
                      label: const Text("Cormics"),
                      deleteIcon: const Icon(Icons.arrow_drop_down),
                      onDeleted: () {},
                      backgroundColor: const Color(0xFFFBBF24),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "images/course_icon.svg",
                          width: 15.0,
                        ),
                        const Text(" Course")
                      ],
                    ),
                    Chip(
                      label: const Text("Math"),
                      deleteIcon: const Icon(Icons.arrow_drop_down),
                      onDeleted: () {},
                      backgroundColor: const Color(0xFFFBBF24),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "images/grade_icon.svg",
                          width: 15.0,
                        ),
                        const Text(" Grade")
                      ],
                    ),
                    Chip(
                      label: const Text("Primary 4"),
                      deleteIcon: const Icon(Icons.arrow_drop_down),
                      onDeleted: () {},
                      backgroundColor: const Color(0xFFFBBF24),
                    )
                  ],
                ),
              ],
            ),
            const BooksList()
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      decoration: const BoxDecoration(
        color: themePrimaryColor,
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(30),
          left: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SvgPicture.asset(
                "images/home.svg",
                width: 40,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Home",
                style: TextStyle(color: themeDarkBlue),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SvgPicture.asset(
                "images/tv_zone.svg",
                width: 40,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "TV",
                style: TextStyle(color: themeDarkBlue),
              ),
            ],
          ),
          Container(
            width: 100,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: themeWhiteColor,
              image: DecorationImage(
                image: AssetImage("images/ring.png"),
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 65,
                  height: 65,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEDA36),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: SvgPicture.asset("images/roll.svg"),
                )
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SvgPicture.asset(
                "images/book.svg",
                width: 30,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Books",
                style: TextStyle(color: themeDarkBlue),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SvgPicture.asset(
                "images/game.svg",
                width: 40,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Games",
                style: TextStyle(color: themeDarkBlue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyCustomAppBar extends StatelessWidget {
  const MyCustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          highlightColor: themeWhiteColor.withOpacity(0.5),
          splashColor: themePrimaryColor.withOpacity(0.8),
          child: Ink(
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    SvgPicture.asset("images/left_back_part.svg"),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
                      child: SvgPicture.asset(
                        "images/back_arrow.svg",
                        height: 18.0,
                      ),
                    )
                  ],
                ),
                const Text(
                  "Back",
                  style: TextStyle(color: themeBlackColor),
                ),
                SvgPicture.asset("images/right_part.svg"),
              ],
            ),
          ),
        ),
        const SizedBox()
      ],
    );
  }
}
