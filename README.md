### 1. How to set up and run the project

First you will need node.js installed on your computer, if you dont'have it, you can install it from this website <https://nodejs.org/en/download/package-manager> if you already have node.js you can skip this step and go straight to the following.

### 2. Clone the project

You can clone the project using this link <https://github.com/Optimus-ged/coa-challenge>

### 3. Open the array manipulation challenge folder

    - cd coa-challenge

### 4. Run the array manipulation project

Open the arrayManipulation.js file, call the filter function and pass two variables to it, the first one is an array of numbers, the second one is a number like so
`console.log(filter([1, 2, 3], 4));`

In your terminal, run this command
`node arrayManipulation.js`

I created first a sum function called sum and then created an other function named filter with two loops, the second loop is looping in the array passed by the user, accordingly to the index of the first one, when the sum of the contiguous array values is greater than the target value passed, i clear the contiguous array variable and i quit the current loop as well, when the sum of the contiguous array values is equal to the target value i return true and straighly exit the function.

### 4. Run the string transformation project

Open the stringTransformation.js file, call the transorm function and pass a string variable to it like so
`console.log(transform("pizza"));`

In your terminal, run this command
`node stringTransformation.js`

I created two functions, the first one is for reversing the string, the second one is for converting string characters into asii values, the third function that i created is called transform, in this one i added three conditions, when the length of the string is divisible by 3 and 5 we reverse the string and then convert into asii values, if the length is only divisible by three, we only reverse it, when it's only divisible by five, we only convert it into asii values.

### 5. Run the photo gallery project

    - cd coa-ui-challenge
    - npm i
    - npm run dev

I created a react project with vite and used tailwind css for designing the ui, in the desktop view i used the ordinary zoom effect, but when the user switch to the mobile view i used a translate in the horizontal direction of -34% to make sure the image is showed to the user from a prefered position, when we open the full screen view, we change the index of the image displayed when according to the item clicked by the user, if he clicks now to the left or right icon, we just update the current index using react hooks.

![Desktop view](/screenshots/desktop-view.png)
*Desktop screen view

![Mobile view](/screenshots/mobile-view.png)
*Mobile screen view

![fullscreen view](/screenshots/fullscreen-view.png)
*full screen view