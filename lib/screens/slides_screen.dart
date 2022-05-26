import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import '../models/category.dart';
import '../models/slide.dart';
import '../widgets/appbar.dart';
import '../widgets/footer.dart';
import '../widgets/slide_widget.dart';

class SlidesScreen extends StatefulWidget {
  final Category category;
  const SlidesScreen({Key? key, required this.category}) : super(key: key);

  @override
  State<SlidesScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<SlidesScreen> {
  int page = 0;
  bool isQuestion = true;
  List<Widget> list = [];
  late String categoryName;
  late List<Slide> slides;

  PageController pageControllerH = PageController();

  @override
  void initState() {
    slides = widget.category.slides;
    categoryName = widget.category.categoryName;
    slides.forEach((newslide) {
      list.add(SlideWidget(
        slide: newslide,
        categoryName: categoryName,
        nextPage: nextPage,
        flip: flip,
        previousPage: previousPage,
        pages: slides.length,
      ));
    });
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void flip() {
    setState(() {
      isQuestion = !isQuestion;
    });
  }

  void nextPage() {
    if (page < list.length) {
      pageControllerH.nextPage(
          duration: const Duration(milliseconds: 3),
          curve: Curves.fastOutSlowIn);
    }
  }

  void previousPage() {
    if (page > 0) {
      pageControllerH.previousPage(
          duration: const Duration(milliseconds: 3),
          curve: Curves.fastOutSlowIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlashCardsAppBar(page: page, listLength: list.length),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (int newpage) {
                setState(() {
                  page = newpage;
                });
              },
              scrollDirection: Axis.horizontal,
              controller: pageControllerH,
              scrollBehavior:
                  ScrollConfiguration.of(context).copyWith(dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              }),
              children: list,
            ),
          ),
          FlashCardsFooter(
              title: categoryName, tail: isQuestion ? "Question" : "Answer"),
        ],
      ),
    );
  }
}
