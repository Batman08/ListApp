import 'package:flutter/material.dart';
import 'package:list_app/Helpers/StringHelpers.dart';
import 'package:list_app/Pages/NoteViewPage.dart';
import 'package:list_app/Providers/NoteProvider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

//3:50 / 15:23
class HomePageState extends State<HomePage> {
  Future<void> updateUI() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringHelpers.appTitle),
      ),
      body: FutureBuilder(
          future: NoteProvider.getNotesList(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            bool hasDatabaseConnected =
                (snapshot.connectionState == ConnectionState.done);
            if (hasDatabaseConnected) {
              final notes = snapshot.data;

              return ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NoteViewPage(
                                  NoteMode.Editing, notes[index])));
                      updateUI();
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, bottom: 30, left: 13, right: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // PopupMenuButton(
                            //     itemBuilder: (BuildContext context) {
                            //   return [
                            //     PopupMenuItem(child: Text('Edit'), value: NoteMode.Editing,),
                            //     PopupMenuItem(child: Text('Delete'),value: NoteMode.Deleting,),
                            //     //https://www.youtube.com/watch?v=CpjfR5rG2lM
                            //   ];
                            // }),
                            NoteTitle(notes[index][StringHelpers.cardTitle]),
                            Container(height: 4),
                            NoteDescription(
                                notes[index][StringHelpers.cardDescription]),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: notes.length,
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NoteViewPage(NoteMode.Adding, null)));
          updateUI();
          // print(notes.length);
          // print(notes);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class NoteTitle extends StatelessWidget {
  final String _title;

  NoteTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(_title,
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold));
  }
}

class NoteDescription extends StatelessWidget {
  final String _description;

  NoteDescription(this._description);

  @override
  Widget build(BuildContext context) {
    return Text(_description,
        style: TextStyle(color: Colors.grey.shade600),
        maxLines: 2,
        overflow: TextOverflow.ellipsis);
  }
}
