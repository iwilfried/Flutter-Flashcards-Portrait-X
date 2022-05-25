import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        shape: const Border(top: BorderSide(color: Colors.green, width: 3)),
        backgroundColor: Theme.of(context).cardColor,
        centerTitle: false,
        titleSpacing: 0,
        shadowColor: Theme.of(context).shadowColor,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Image.asset('assets/images/LogoMaster.png'),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Center(
                    child: Text("Accelerated Learning",
                        maxLines: 1,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w300))),
                  )),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PopupMenuButton<String>(
                      child: Icon(
                        Icons.more_vert,
                        color: Theme.of(context).primaryColor,
                      ),
                      onSelected: (String value) =>
                          value == 'Impressum' ? {} : {},
                      itemBuilder: (BuildContext context) {
                        return {'Dark mode', 'Impressum'}.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Scaffold(
        body: Container(
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
                  'General Data Protection Regulation(GDPR) FlashCards',
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
                          onPressed: () => {},
                          icon: const Icon(Icons.arrow_forward_sharp,
                              size: 40, color: Color(0xffF16623))),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: FlashCardsAppBar(),
    );
  }
}
