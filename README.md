# Animated Flutter Login Screen 
A Synthwave-themed login screen written in Flutter as finals output. 

<img src="Screenshots/preview.gif" alt="Preview" width="300"/>


### Installation
Install package depencies in the ***pubspec.yaml*** from the command line.

```sh
$ flutter pub get
```
Alternatively, your editor might support ***flutter pub get***.

## Instructions
Follow these steps to start using the flutter project:

  1. Build the project and run ***main.dart***.
  2. To authenticate with the login screen, input ``cictapps@wvsu.edu.ph as email`` and ``1234 as password``.

### Packages Used

| Package |  README | 
| ------ | ------ |
| lottie 0.6.0 | https://pub.dev/packages/lottie/versions/0.6.0 |
| form_field_validator 1.0.1| https://pub.dev/packages/form_field_validator |
| assets_audio_player 1.4.0 | https://pub.dev/packages/assets_audio_player |

## Background of the Project
The project consists of 2 screens, the **Login Page** and **Menu Page**. 

##### **Login Page** 
- I used form field validator to validate the data input in email and password forms. Any ``empty`` and ``invalid`` inputs will show an error prompt.
- The animation used is from Lottie [https://lottiefiles.com/36400-synthrunner].

##### **Menu Page**
- The purpose of this page is to chill while listening to the radio played in background using the ***assets_audio_player 1.4.0***.
- The animation used is from Lottie [https://lottiefiles.com/36400-synthrunner].
- Another animation used is from a GIF found in Google Images that I converted into a lottie animation file.
- The duration of the background music of the radio is **45 minutes and 30 seconds**.
- Music is extracted from [https://www.youtube.com/watch?v=mZvQ9ipTK_8&t=69s]
- Once you logout, the radio will also stop.

## Screenshots

Login Page               |  Login Page - Blank input  |  Login Page - Invalid input | Menu Page
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/Sturg25/finals_output/blob/main/Screenshots/loginpage.png)|![](https://github.com/Sturg25/finals_output/blob/main/Screenshots/blank.png)|![](https://github.com/Sturg25/finals_output/blob/main/Screenshots/invalid.png)|![](https://github.com/Sturg25/finals_output/blob/main/Screenshots/menupage.png) 


## Development

#### ***Christian Sarabia***
#### ***BSCS-3A*** 
#### [GitHub Page](https://github.com/Sturg25/)

