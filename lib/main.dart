import 'package:flutter/material.dart';
import 'package:list_app/Widgets/InheritedWidget.dart';
import 'Pages/HomePage.dart';
import 'Helpers/StringHelpers.dart';

// void main() => runApp(MyApp());

void main() {
  runApp(
    new NoteInheritedWidget(
     MaterialApp(
      // todo: theme: new ThemeData.light(),
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        StringHelpers.homePage: (BuildContext context) => new HomePage(),
      })));
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
