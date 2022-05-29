# Chapter 8: Creating Learn more screen

## Steps: 

### 1- create a new file under lib/screens and name it learn_more.dart 

<img width="349" alt="image" src="https://user-images.githubusercontent.com/18642838/170881260-4a33cee5-3d3f-4a46-8f4c-8ec26985069d.png">


### 2- create learn more screen 
inside learn_more.dart create a new stateless class and name it LearnMore which accept three parameters

```
class LearnMore extends StatelessWidget {
  final String text;
  final String categoryName;
  final Map<String, StyledTextTagBase> tags;
  const LearnMore(
      {Key? key,
      required this.text,
      required this.tags,
      required this.categoryName})
      : super(key: key);
```

the screen layout will return a text widget wrapped with a single child scroll view. 

```
    return Scaffold(
        appBar: FlashCardsAppBar(title: "Learn more..."),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: StyledText(
                      text: text,
                      style: GoogleFonts.robotoCondensed(
                        textStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 19,
                          height: 1.7,
                        ),
                      ),
                      tags: tags,
                    )),
              ),
            ),
            FlashCardsFooter(title: categoryName)
          ],
        ));
```
### 3- create Secondry screens appbar under lib/widgets/appbar 

<img width="345" alt="image" src="https://user-images.githubusercontent.com/18642838/170881344-84af5323-3ce6-46d2-b32e-645055701a35.png">

### 4- update appbar widget to change back icon color with the theme.

```
   return AppBar(
      shape: const Border(top: BorderSide(color: Colors.green, width: 3)),
      backgroundColor: Theme.of(context).cardColor,
      centerTitle: false,
      titleSpacing: 0,
      shadowColor: Theme.of(context).shadowColor,
      iconTheme: IconThemeData(
        color: Theme.of(context).primaryColor, //change your color here
      ),
      title: Padding(
```
### 5- create Secondry Screen App Bar that accept title as a paramter

```
class SecondryScreensAppbar extends ConsumerWidget
    implements PreferredSizeWidget {
  final String title;

  const SecondryScreensAppbar({
    Key? key,
    this.title = "",
  }) : super(key: key);
```

### 6- navigate to LearnMore screen in the slide widget
```
  ..onTap = () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LearnMore(
                categoryName: widget.categoryName,
                tags: tags,
                text: widget.slide.learnMore)),
      ),
````

