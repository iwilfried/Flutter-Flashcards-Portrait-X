import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  final Function startLesson;
  const HomeScreen({Key? key, required this.title, required this.startLesson})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Theme.of(context).backgroundColor.withOpacity(0.9),
                  BlendMode.darken),
              image: AssetImage(isPortrait
                  ? "assets/images/backPortrait.png"
                  : "assets/images/backLandscape.png"),
              fit: BoxFit.cover)),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            isPortrait
                ? Column(
                    children: [
                      Image.asset('assets/images/view.png',
                          width: 40, height: 40),
                      const SizedBox(
                        height: 15,
                      ),
                      AutoSizeText(
                        'WELCOME',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w300)),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/view.png',
                          width: 40, height: 40),
                      const SizedBox(
                        width: 20,
                      ),
                      AutoSizeText(
                        'WELCOME',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w300)),
                      ),
                    ],
                  ),
            const Spacer(),
            AutoSizeText(
              '${widget.title} FlashCards',
              maxLines: 4,
              textAlign: TextAlign.center,
              style: GoogleFonts.oswald(
                  textStyle: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
              )),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: AutoSizeText(
                'Use this flashcards to learn and understand vocabulary, terms and data protection regulations.',
                maxLines: 5,
                textAlign: TextAlign.center,
                style: GoogleFonts.oswald(
                    textStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                )),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: IconButton(
                      onPressed: () => widget.startLesson(),
                      icon: const Icon(Icons.arrow_forward_sharp,
                          size: 40, color: Color(0xffF16623))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}