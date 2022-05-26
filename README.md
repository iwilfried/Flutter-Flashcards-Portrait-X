# Chapter 10: Creat glossries Screen

## Steps: 

### 1- create a new file under lib/screens and name it glossries_screen.dart

<img width="340" alt="image" src="https://user-images.githubusercontent.com/18642838/170464213-f5607dac-aa04-4c2c-873e-405f9095dca7.png">


### 2- create a stateless widget inside the file the accept a list of glossries as a parameter 

```
class GlossariesScreen extends StatefulWidget {
  final List<Glossry> glossries;
  const GlossariesScreen({Key? key, required this.glossries}) : super(key: key);
```
### 3- the screen layout will return a list of ExpansionTile that show the glossries.

### 4- update the appBar to accept a list of glossries as a paramter 

```
class FlashCardsAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final bool showLogo;
  final String title;
  final int page;
  final int listLength;
  final List<Glossry> glossries;
  const FlashCardsAppBar({
    Key? key,
    this.showLogo = true,
    this.glossries = const [],
    this.title = "",
    this.page = 0,
    this.listLength = 0,
  }) : super(key: key);
```
### 5- pass the glossries list to the appBar in the slides screen 
```
  appBar: FlashCardsAppBar(
    page: page,
    listLength: list.length,
    glossries: widget.category.glossries,
  ),
```
### 6- navigate to the glossries screen from the app bar 

```
  IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  GlossariesScreen(glossries: glossries),
            ),
          ),
      icon: Icon(
        Icons.collections_bookmark,
        color: Theme.of(context).primaryColor,
      )),
```
