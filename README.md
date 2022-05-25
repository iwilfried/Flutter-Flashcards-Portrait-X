# Chapter 6: adding dark Mode 

## Steps: 

### 1- add the new lib to the pubspec.yamel 
the first lib is riverpod for statemanagement 
the second one is shared preferences to save the state when we close the app and open it again. 
```
  flutter_riverpod: ^1.0.4
  shared_preferences: ^2.0.9
```

### 2- create a dark mode managment class 
create a new folder under lib and call it state_managment
create a new file inside the folder and call it dark_mode_state_manager.dart 

<img width="411" alt="image" src="https://user-images.githubusercontent.com/18642838/170315889-f346ed06-f038-4dd5-b57e-35e8313b5892.png">

### 3- create a StateNotifierProvider inside the class 

inside the class we will create darkModeStateManagerProvider with type bool 

```
final darkModeStateManagerProvider =
    StateNotifierProvider<DarkModeStateManager, bool>((ref) {
  return DarkModeStateManager(ref.read);
});
```
### 4- create the change notifier 
and create a Dark mode class that extend State Notifier with the same type as the provider bool
The class will have two functions 
1- init to get the state if exsit from the shared prefrenses and update the state 

```
  void _init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool darkMode = false;
    var jsonData = prefs.getString('darkMode') ?? '';
    if (jsonData != '') {
      darkMode = json.decode(jsonData)['mode'];
    }
    state = darkMode;
  }
```
2- switch dark mode funtion to switch the state when click the buttom from the app bar and save the last state to the shared pref 
```
  Future<void> switchDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state = !state;
    prefs.setString('darkMode', jsonEncode({'mode': state}));
    state = state;
  }
```

### 5- adding the provier scope in the main.dart in main function

```
void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}
```

### 6- make MyApp class extend Consumer widget 
we will make the my app class extend consumer widget so we will have the Ref variable which allow us to be able to read the data from any provider we will make. 
and we will get the darkmode provider state to switch between the modes. 
```
class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   bool darkMode = ref.watch(darkModeStateManagerProvider);
```

### 7- adding dark theme to Material app 

```
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        primaryColor: Colors.white,
        shadowColor: Colors.white24,
        cardColor: Colors.black45,

        /* dark theme settings */
      ),
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
```


### 8- Make FlashCards Appbar extend ConsumerWidget 

```
class FlashCardsAppBar extends ConsumerWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
```



### 9- switch the state when we click the button in the app bar

```
    onSelected: (String value) => value == 'Impressum'
        ? {}
        : ref
            .read(darkModeStateManagerProvider.notifier)
            .switchDarkMode(),
```
then change the work between the darkmode and lighmode 

```
                    itemBuilder: (BuildContext context) {
                      return {
                        Theme.of(context).brightness == Brightness.light
                            ? 'Dark mode'
                            : 'Light mode',
                        'Impressum'
                      }.map((String choice) {
````
