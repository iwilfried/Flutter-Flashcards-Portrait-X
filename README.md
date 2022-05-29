# Chapter 9: Creating Impressum Screen

## Steps: 

### 1- create a new file under lib/screens and name it impressum.dart

<img width="347" alt="image" src="https://user-images.githubusercontent.com/18642838/170459078-2425c507-5cef-4f77-8007-ca9d424594b6.png">


### 2- create Impressume screen 
inside impressum.dart create a new stateless class and name it Impressum with no parameters and return a column of the text content. 



### 3- navigate to the Impressum screen from the Mainscreen & Slides screen appbar

```
  : value == 'Impressum'
        ? Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const ImpressumScreen()),
          )
````
