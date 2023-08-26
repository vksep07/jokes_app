# Jokes App  ( :smile: )

The Joke App is a simple and engaging mobile application developed using the Flutter framework. Its primary function is to provide users with a constant stream of humorous jokes fetched from an open API. With its minimalist design and seamless functionality, the app aims to bring joy and entertainment to users while demonstrating clean coding practices and a well-organized project structure.

In this app we are showing the intaractive UI interface with Jokes Api data  to understand the basic flow. In this project we are using the clean architecture  with following folder breakup -> Parent folder - ( View, Bloc, Network ). We are using the modular approach for reduce the modular dependency between the each module of the project. Clean architecture also decouple the presentation layer and business layer.


## Logo

<img src="https://github.com/vksep07/jokes_app/blob/main/assets/images/unlimit_jokes_logo.png" alt="drawing" style="width:400px;"/>


## Features

- Joke Fetching: The app connects to an external open API that provides geek-themed jokes. Every minute, the app retrieves a new joke from this API to keep the content fresh and entertaining.

- Dynamic List: The jokes are displayed in a scrollable list on the app's main screen. The list automatically updates as new jokes are fetched and ensures that only the most recent 10 jokes are displayed at any given time.

- Minimalist UI: The user interface is intentionally kept clean and simple, allowing users to focus on the jokes themselves. The main screen consists of a list of jokes with no unnecessary distractions.


## Screenshots

![dark_theme_screenshot](https://github.com/vksep07/jokes_app/assets/16042343/414dd007-b6cd-4990-bcb4-79650461c805)

![dark_theme_screenshot](https://github.com/vksep07/jokes_app/assets/16042343/e981133d-7adb-4d09-8788-88b0123c5f7a)



## App Preview Video


https://github.com/vksep07/jokes_app/assets/16042343/d99b7d53-488b-4f50-8fd5-959dbac89053


## Requirements

- Any Operating System (ie. MacOS, Windows, Linux)
- Flutter
- Android Studio or Visual Studio Code
- Basic knowledge of Flutter/Dart


## Installation

Clone the repo

```bash
  git clone https://github.com/vksep07/jokes_app.git
```

Install the dependencies

```bash
    flutter pub get
```

Run the App

```bash
    flutter run
```
### Created and maintained by 
[Varun Kumar](https://github.com/vksep07)


If you found this project helpful or you learned something from the source code and want to thank me, consider buying me a cup of ☕<br>
!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)
## License

```
    MIT License

Copyright (c) 2022 Varun Kumar

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

```
