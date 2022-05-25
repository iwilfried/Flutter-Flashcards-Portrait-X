# Chapter 4: Get data from the JSON

## Steps: 

### 1- Create the JSON file
first we will create slides.json file under the assets folder and add the data to it. 

<img width="401" alt="image" src="https://user-images.githubusercontent.com/18642838/170269429-8d160f21-a968-42c0-8868-3308c41afa4a.png">

### 2- create classes to hold JSON data
create models folder under lib
and inside that folder we will create four classes 
1- category \
2- glossry \
3- slide \
4- tags 

<img width="404" alt="image" src="https://user-images.githubusercontent.com/18642838/170297848-688f5016-31e4-4a3f-aab3-374f5b755c36.png">

In each class we will have:\
1- the variables \
2- the constructor \
3- a from json junction to decode the json file

### 3- create loadData func in mainscreen to get the data from the JSON 

inside the load data we will:
* first load the slides.json file as string 
* then we decode the json 
* then we will create a categories List variable to hold the categories from the json file
* and a lesson String variable to hold the lesson name from json file
* and a title String variable to hold the title name from the json file.

```
  List<Category> categories = [];
  String title = "";
  String lesson = "";

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
    });
  }
  ```

### 4- call the loadData function in the instate method 

```
    @override
    void initState() {
        loadData();
        super.initState();
    }
```

### 5- replace the hardcoded title with the variable we got form the json 

```
    AutoSizeText(
    '$title FlashCards',
    maxLines: 4,
    textAlign: TextAlign.center,
    style: GoogleFonts.oswald(
        textStyle: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 30,
    )),
    ),
```

### 6- pass the title variable to the footer widget

in the main screen:
```
    FlashCardsFooter(title: title),
```
and inside the footer widget: 
```
  final String title;
  const FlashCardsFooter({Key? key, required this.title}) : super(key: key);
```
```
    child: AutoSizeText(title,
        maxLines: 1,
        style: GoogleFonts.robotoSlab(
            textStyle: GoogleFonts.robotoSlab(
                textStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500)),
        )),
```