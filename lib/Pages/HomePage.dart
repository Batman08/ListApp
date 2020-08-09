import 'package:flutter/material.dart';
import 'package:list_app/Helpers/StringHelpers.dart';
import 'package:list_app/Pages/NoteViewPage.dart';
import 'package:list_app/Widgets/InheritedWidget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

//3:50 / 15:23
class HomePageState extends State<HomePage> {
  List<Map<String, String>> get _notes => NoteInheritedWidget.of(context).notes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringHelpers.appTitle),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NoteViewPage(NoteMode.Editing)));
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 30.0, bottom: 30, left: 13, right: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  noteTitle(),
                  Container(height: 4),
                  noteDescription()
                ],
              ),
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NoteViewPage(NoteMode.Adding)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

Text noteDescription() {
  return Text('Description',
      style: TextStyle(color: Colors.grey.shade600),
      maxLines: 2,
      overflow: TextOverflow.ellipsis);
}

Text noteTitle() {
  return Text('Title',
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold));
}
