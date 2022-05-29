import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/category.dart';
import '../widgets/appbar/main_screen_appbar.dart';
import 'categories_screen.dart';
import 'home_screen.dart';
import '../widgets/footer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int page = 0;
  List<Widget> list = [];

  List<Category> categories = [];
  String title = "";
  String lesson = "";

  PageController pageControllerH = PageController();

  void startLesson() {
    pageControllerH.nextPage(
        duration: const Duration(milliseconds: 3), curve: Curves.fastOutSlowIn);
  }

  Future<void> loadData() async {
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/slides.json");
    final jsonResult = jsonDecode(data); //latest Dart
    final catJson = jsonResult['Categories'];
    setState(() {
      title = jsonResult['title'];
      lesson = jsonResult['lesson'];
      categories =
          List<Category>.from(catJson.map((e) => Category.fromJson(e)));
      list = [
        HomeScreen(startLesson: startLesson, title: title),
        CategoriesScreen(categories: categories, title: title, lesson: lesson),
      ];
    });
  }

  @override
  void initState() {
    loadData();
    setState(() {
      list = [
        HomeScreen(startLesson: startLesson, title: title),
        CategoriesScreen(categories: categories, title: title, lesson: lesson),
      ];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainScreenAppbar(title: "Accelerated Learning"),
      body: Scaffold(
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
            FlashCardsFooter(title: title),
          ],
        ),
      ),
    );
  }
}
