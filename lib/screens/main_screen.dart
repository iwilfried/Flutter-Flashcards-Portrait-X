import 'dart:convert';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/category.dart';
import 'categories_screen.dart';
import 'home_screen.dart';

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
            Container(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              color: Colors.blue,
              width: double.infinity,
              height: 45,
              child: Align(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(title,
                    maxLines: 1,
                    style: GoogleFonts.robotoSlab(
                      textStyle: GoogleFonts.robotoSlab(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
