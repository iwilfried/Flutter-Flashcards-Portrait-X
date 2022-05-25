# Chapter 5: create categories screen 

## Steps: 

### 1- Create categories screen class & home screen class under screens 
first we will create slides.json file under the assets folder and add the data to it. 

<img width="409" alt="image" src="https://user-images.githubusercontent.com/18642838/170304122-a0990134-889d-43f7-b402-d3676bdadf86.png">

### 2- Creating Home screen
* create a statful widget inside the class 
* make the class accept two variables 1- title 2- start lesson function 
* copy the content inside the expanded widget from main screen and return it in home screen
* pass the start lesson funtion to the arrow button at the bottom 
```
    onPressed: () => widget.startLesson(),
````

### 3- Creating categories widget 
* create a statful widget inside the class 
* make the class accept three variables 1- categories list 2- title 3- lesson 
* create listview builder to make a list of ExpansionTile for each category 

### 4- create a list variable to hold the home & categoris screen in main screen

* create the variable in the main screen 
    ```
    List<Widget> list = [];
    ````
* create intiate the variable inside the init state 
    ```
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
    ````
* update the passed data to the screen in load screen function 
    ```
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
    ````
### 5- create start lesson funtion inside mainscreen 
```
  void startLesson() {
    pageControllerH.nextPage(
        duration: const Duration(milliseconds: 3), curve: Curves.fastOutSlowIn);
  }
````

### 6- create a pageviewer in main screen 
Inside main screen we will create a page viewer to switch between the home screen and the categories screen. 

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