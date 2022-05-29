# Chapter 7: Creating Slides Screen

## Steps: 

### 1- adding the required lib in pubspec.yaml
```
  flip_card: ^0.6.0
  styled_text: ^5.0.0+1
  url_launcher: ^6.0.20
```
### 2- create Slides Screen class and Slide widget class 

under Screens we will create a new file and call it Slides_screen.dart
and under widget we will create a new file and call it slide_widget.dart

<img width="347" alt="image" src="https://user-images.githubusercontent.com/18642838/170355160-7af5e13b-a43e-41f4-8c18-fbfde62c041d.png">

### 3- create AppBar sub Widgets

* create two new files for mainscreen appbar and slidesscreen appbar under a newfolder called appbar under widgets folder.

  <img width="351" alt="image" src="https://user-images.githubusercontent.com/18642838/170879627-dbd82c1a-87fd-46b3-b97e-4081b185ba7f.png">

* make our old Appbar widget keep the common style and accept a list of widget as a prameter 

  ```
    class FlashCardsAppBar extends StatelessWidget {
    final List<Widget> childern;
    const FlashCardsAppBar({
      Key? key,
      this.childern = const [],
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return AppBar(
        shape: const Border(top: BorderSide(color: Colors.green, width: 3)),
        backgroundColor: Theme.of(context).cardColor,
        centerTitle: false,
        titleSpacing: 0,
        shadowColor: Theme.of(context).shadowColor,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: this.childern,
          ),
        ),
      );
    }
  }
  ````
* create a MainScreen appBar widget that extend Comsumerwidget, implement PreferredSizeWidget and accept title as a parameter.
  ```
  class MainScreenAppbar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;

  const MainScreenAppbar({
    Key? key,
    this.title = "",
  }) : super(key: key);
  ````
* make the MainScreenAppBar return a FlashCardsAppBar widget
  ```
    @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FlashCardsAppBar(childern: [
        ...
        ]
        )}
  ````
* then we will make a Slides AppBar widget that accept the a page and length as parameters and return FlashCardsAppBar as well.
  ```
  class SlidesScreenAppbar extends ConsumerWidget implements PreferredSizeWidget {
  final int page;
  final int listLength;
  const SlidesScreenAppbar({
    Key? key,
    this.page = 0,
    this.listLength = 0,
  }) : super(key: key);
  ```` 
### 4- update the footer widget to fit in slides screen
make the footer widget accept two variables and replace the harded coded text with the variables. 
```
class FlashCardsFooter extends StatelessWidget {
  final String title;
  final String tail;
  const FlashCardsFooter({Key? key, required this.title, this.tail = ""})
      : super(key: key);
```

### 5- create the Slide Widget under Slides

* create a statefull widget that accept a slide as a parameter, three functions for navigation, category name and number of pages. 

  ```
  class SlideWidget extends StatefulWidget {
  final Slide slide;
  final String categoryName;
  final int pages;
  final Function nextPage;
  final Function flip;
  final Function previousPage;
  const SlideWidget({
    Key? key,
    required this.slide,
    required this.categoryName,
    required this.pages,
    required this.flip,
    required this.nextPage,
    required this.previousPage,
  }) : super(key: key);
  ```

* create tags map and intiate it in the init state to pass it to the styled text widget

  ```
    Map<String, StyledTextTagBase> tags = {};
  ```
* Create the Slide layout which consist of a FlipCard widget the has the question at a side and the answer on the other side and can be fliped
and under it we will have the three navigation buttons. 

### 6- create Slides Screen 

* create a statefull widget that accept a category as a parameter 
  ```
  class SlidesScreen extends StatefulWidget {
    final Category category;
    const SlidesScreen({Key? key, required this.category}) : super(key: key);

    @override
    State<SlidesScreen> createState() => _MainScreenState();
  }
  ```

* create variables to hold the slides list, page number and isQuestion bool. 

  ```
    int page = 0;
  bool isQuestion = true;
  List<Widget> list = [];
  late String categoryName;
  late List<Slide> slides;

  PageController pageControllerH = PageController();
  ```
* inside the init state we will initiate the variables we created and add the slides to the list

  ```
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
  }
  ```
* we will create the three functions for next, previous and flip for the three buttons

  ```
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

  ```
* create a widget layout which returns a pageviewer that navigate through the slides

  ```
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
  ````
