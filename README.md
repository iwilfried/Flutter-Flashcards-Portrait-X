# Chapter 8: Creating Learn more screen

## Steps: 

### 1- create a new file under lib/screens and name it learn_more.dart 

<img width="350" alt="image" src="https://user-images.githubusercontent.com/18642838/170455920-1516b3b8-cb7b-4e2d-8f72-b189377b3032.png">


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
### 3- update appBar widget to fit the new screen 
```
  if (title != "Learn more...")
    InkWell(
      onTap: () => title.isNotEmpty
          ? null
          : Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const MainScreen()),
            ),
      child: SizedBox(
        height: 30,
        child: Image.asset('assets/images/LogoMaster.png'),
      ),
    ),
```
### 4- navigate to LearnMore screen in the slide widget
```
  ..onTap = () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LearnMore(
                categoryName: widget.categoryName,
                tags: tags,
                text: widget.slide.learnMore)),
      ),
```

