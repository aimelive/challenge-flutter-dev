import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui/screens/books_zone.dart';
import 'package:flutter_ui/models/books_api.dart';
import 'package:flutter_ui/shared/constants.dart';

class ReadBook extends StatefulWidget {
  const ReadBook({Key? key, required this.book}) : super(key: key);
  final Book book;
  @override
  State<ReadBook> createState() => _ReadBookState();
}

class _ReadBookState extends State<ReadBook> {
  List pages = [];
  int activeIndex = 0;
  final carouselPagesController = CarouselController();

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    pages = widget.book.pages;
  }

  @override
  void dispose() {
    audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double bar = widthSize - 20;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: themeWhiteColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: const MyCustomAppBar(),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            carouselController: carouselPagesController,
            itemCount: pages.length,
            itemBuilder: (context, index, realIndex) {
              final pageContent = pages[index];
              return Container(
                width: widthSize,
                margin: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Color(0xFFD9D9D9),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        Text(
                          widget.book.title,
                          style: const TextStyle(
                              color: Color(0xFF193059), fontSize: 20.0),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          color: themeWhiteColor,
                          child: Text("Page ${index + 1} of ${pages.length}"),
                        )
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(pageContent),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            carouselPagesController.previousPage();
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                        IconButton(
                          onPressed: () {
                            carouselPagesController.nextPage();
                          },
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            options: CarouselOptions(
                initialPage: 0,
                onPageChanged: ((index, reason) =>
                    setState((() => activeIndex = index))),
                height: 420,
                viewportFraction: 1,
                enableInfiniteScroll: false),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("images/book_face.svg"),
              const SizedBox(width: 30.0),
              SvgPicture.asset("images/mic_record.svg"),
              const SizedBox(width: 30.0),
              SvgPicture.asset("images/full_screen.svg"),
            ],
          ),
          // Slider(
          //   value: position.inSeconds.toDouble(),
          //   onChanged: (value) async {},
          //   min: 0,
          //   max: duration.inSeconds.toDouble(),
          // ),
          Container(
            color: const Color(0xFF000000),
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      color: const Color(0xFFEEDA36),
                      padding: const EdgeInsets.all(5.0),
                      width: bar / 2,
                    ),
                    Expanded(
                      child: Container(
                        color: const Color(0xFFA6A6A6),
                        padding: const EdgeInsets.all(5.0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Row(
                  children: [
                    const Text(
                      "00:00",
                      style: TextStyle(color: themeWhiteColor),
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: () async {
                          if (isPlaying) {
                            await audioPlayer.pause();
                          } else {
                            await audioPlayer
                                .setSourceUrl(widget.book.audioUrl);
                            await audioPlayer
                                .play(widget.book.audioUrl as Source);
                          }
                        },
                        child: SvgPicture.asset("images/play.svg")),
                    const SizedBox(width: 10.0),
                    SvgPicture.asset("images/volume.svg"),
                    const Spacer(),
                    const Text(
                      "02:30",
                      style: TextStyle(color: themeWhiteColor),
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 10.0),
              Column(
                children: [
                  SvgPicture.asset("images/listen.svg"),
                  const Text("Listen Only"),
                ],
              ),
              const SizedBox(width: 10.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "images/open_book.svg",
                    width: 40,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text("Read Only"),
                ],
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
