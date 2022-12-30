# flutter_users_api_call (A Flutter App for calling users via REST API)

## Getting Started
This project is a non-complex app for calling a range of 20 users via API and rendering specific user's details in an on-click event (forward arrow cursor icon). (https://randomuser.me/api/?results=20)

### Folder Structure
Here is the core folder structure which flutter provides.
<code>
flutter-app/
 |- android
 |- build
 |- ios
 |- lib
 |- test
 </code>
 
 Here is the folder structure we have been using in this project
<code> 
lib/
|- pages/
|- pages/homepage.dart
|- pages/profile_page.dart
|- main.dart</code>

## Main
<code>import 'package:flutter/material.dart';
import 'package:flutter_users_api_call/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}</code>


### HomePage (before triggering 'fetch user' action)
<img src="https://user-images.githubusercontent.com/120676400/210025844-b9a73951-316c-47fb-a04b-fb58c65d3fd6.png" width="360" height="800">


### HomePage (With array of fetched users from API)
<img src="https://user-images.githubusercontent.com/120676400/210025906-291808ef-c1cf-4ccd-afc2-bb14ddc522b8.png" width="360" height="800">


### User Details Page (using Navigator.of(context).push)
<img src="https://user-images.githubusercontent.com/120676400/210025987-3ba997db-1feb-4479-9fea-d87b60a85410.png" width="360" height="800">
