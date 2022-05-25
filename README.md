# Chapter 2: Create Home Screen

## Steps: 

### 1- add the new assets 
add the background images and the logo to the images folder assets/images

<img width="331" alt="image" src="https://user-images.githubusercontent.com/18642838/170261690-252d8582-ccde-477f-a951-b0b5d1753127.png">

### 2- create home screen


* First inside MainScreen.dart we will use MediaQuery to get the device highet, width and orientation inside the build function

    ```
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;
        bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    ```
* Next, we will add a body to the Scaffold widget and return a container that have our content

* then we will add the background images in a decoration att of the countainer. 

    ```
    decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).backgroundColor.withOpacity(0.9),
                        BlendMode.darken),
                    image: AssetImage(isPortrait
                        ? "assets/images/backPortrait.png"
                        : "assets/images/backLandscape.png"),
                    fit: BoxFit.cover))
    ```

* then we will add a column that will have our logo and the text of our home screen. 