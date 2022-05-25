# Chapter 1: Create App bar for

## Steps: 

### 1- create an AppBar Widget
create appbar widget under lib/widgets folder 

<img width="341" alt="image" src="https://user-images.githubusercontent.com/18642838/170257143-4d1f1cf4-5e39-49d6-a388-d73b305652b2.png">
<br/><br/>

### 2- add the libraries we are going to use to pubspec.yaml 
```
  google_fonts: ^2.3.2
  auto_size_text: ^3.0.0
```
### 3- adding assets 

create an assets folder in the root folder then create an images folder inside it and add the image there. 

<img width="341" alt="image" src="https://user-images.githubusercontent.com/18642838/170258153-5c629532-9c2f-49d5-b819-43787e52b750.png">

then add this assets folder in pubspec.yamel

```
  assets:
    - assets/images/
```

### 4- Create the AppBar
create a statless widget that implement PreferredSizeWidget and return an appBar. 

### 5- Adding the app bar 

Return a Scaffold in the main screen and return The APPBar we created. 