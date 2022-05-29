# Chapter 9: Creating Impressum Screen

## Steps: 

### 1- create a new file under lib/screens and name it impressum.dart

<img width="361" alt="image" src="https://user-images.githubusercontent.com/18642838/170883284-4a6556ec-ab25-4e2c-b081-ff8eff4f4b7e.png">


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
