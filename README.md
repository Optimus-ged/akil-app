### 1. How to set up and run the project

To run this app you will need the flutter version 3.29.3-0.0.pre.1 or higher, my apologies for not having many commits on this project, i had a small issue with my github

### 2. Clone the project

You can clone the project using this link <https://github.com/Optimus-ged/akil-app>

### 3. Brief explanation of the state management used and other tools 

For this project i chose to use the state management `BLOC` which is one of the best state management when working with flutter, it's gives the possibility to separate The presentation from the logic meaning you can easily change the entire presentation without having to worry about the ui to be broken since both of them (the logic and the presentation) are separated and also it Rebuilds only when state changes avoiding unnecessary widget rebuilds.

I used the dio package for api calling which is by far better than the http package with builtin functionalities like Interceptors, Global headers, Request cancellation, Logging, Retry logic and many more.

### 3. How to run the project

    - Open the project in vscode
    - Flutter pub get
    - Click on the start debugging icon in the topbar of vscode

### 4. Some screen shots

![Desktop view](/screenshots/desktop.jpg)
*Desktop screen view

![Mobile view](/screenshots/mobile.jpg)
*Mobile screen view