# Chapter 10: Creat glossries Screen

## Steps: 

### 1- create a new file under lib/screens and name it glossries_screen.dart

<img width="339" alt="image" src="https://user-images.githubusercontent.com/18642838/170882161-45a72ed8-7614-4600-acd9-33a546651358.png">


### 2- create a stateless widget inside the file that accept a list of glossries as a parameter 

```
class GlossariesScreen extends StatefulWidget {
  final List<Glossry> glossries;
  const GlossariesScreen({Key? key, required this.glossries}) : super(key: key);
```
### 3- the screen layout will return a list of ExpansionTile that show the glossries.

### 4- update the SlidesScreenAppbar to accept a list of glossries as a paramter 

```
class SlidesScreenAppbar extends ConsumerWidget implements PreferredSizeWidget {
  final int page;
  final int listLength;
  final List<Glossry> glossries;
  const SlidesScreenAppbar({
    Key? key,
    this.page = 0,
    this.listLength = 0,
    this.glossries = const [],
  }) : super(key: key);
```
### 5- pass the glossries list to SlidesScreen appBar in the slides screen 
```
    return Scaffold(
      appBar: SlidesScreenAppbar(
        page: page,
        listLength: list.length,
        glossries: widget.category.glossries,
      ),
```
### 6- navigate to the glossries screen from the SlidesScreenbar 

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
