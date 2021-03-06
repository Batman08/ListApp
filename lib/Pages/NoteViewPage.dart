import 'package:flutter/material.dart';
import 'package:list_app/Helpers/StringHelpers.dart';
import 'package:list_app/Providers/NoteProvider.dart';
// import 'package:list_app/Widgets/NotesInheritedWidget.dart';

enum NoteMode { Editing, Adding, Deleting }

class NoteViewPage extends StatefulWidget {
  final NoteMode noteMode;
  final Map<String, dynamic> note;

  NoteViewPage(this.noteMode, this.note);

  @override
  _NoteViewPageState createState() => new _NoteViewPageState();
}

class _NoteViewPageState extends State<NoteViewPage> {
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _descriptionEditingController =
      TextEditingController();

  // List<Map<String, String>> get _notes => NoteInheritedWidget.of(context).notes;

  @override
  void didChangeDependencies() {
    if (widget.noteMode == NoteMode.Editing) {
      _titleEditingController.text = widget.note[StringHelpers.cardTitle];
      _descriptionEditingController.text =
          widget.note[StringHelpers.cardDescription];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.noteMode == NoteMode.Adding
            ? StringHelpers.addPageTitle
            : StringHelpers.editPageTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _titleEditingController,
              decoration:
                  InputDecoration(hintText: StringHelpers.editPageTitleHint),
            ),
            Container(
              height: 8,
            ),
            TextField(
              controller: _descriptionEditingController,
              decoration: InputDecoration(
                  hintText: StringHelpers.editPageDescriptioneHint),
            ),
            Container(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                EditNoteButtons(StringHelpers.editPageSave, Colors.blue, () {
                  final title = _titleEditingController.text;
                  final description = _descriptionEditingController.text;

                  bool addingNewNote = (widget?.noteMode == NoteMode.Adding);
                  bool editNote = (widget?.noteMode == NoteMode.Editing);
                  if (title.length == 0 || description.length == 0) {
                    return;
                  }
                  if (addingNewNote) {
                    NoteProvider.insertNote({
                      StringHelpers.cardTitle: title,
                      StringHelpers.cardDescription: description
                      // print(title);
                      // print(description);
                    });
                  } else if (editNote) {
                    NoteProvider.updateNote({
                      StringHelpers.databaseID:
                          widget.note[StringHelpers.databaseID],
                      StringHelpers.cardTitle: title,
                      StringHelpers.cardDescription: description
                    });
                  }
                  Navigator.pop(context);
                }),
                Container(
                  height: 70,
                ),
                widget.noteMode == NoteMode.Adding ? 
                EditNoteButtons(
                    StringHelpers.editPageDiscardNote, 
                    Colors.grey.shade400, () {
                  Navigator.pop(context);
                }
                ):EditNoteButtons(
                    StringHelpers.editPageDiscard, 
                    Colors.grey.shade400, () {
                  Navigator.pop(context);
                }),
                Container(
                  height: 70,
                ),
                widget.noteMode == NoteMode.Editing
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: EditNoteButtons(
                            StringHelpers.editPageDelete, Colors.red, () async {
                           setState(() {
                            NoteProvider.deleteNote(
                              widget.note[StringHelpers.databaseID],
                            );
                           });
                          Navigator.pop(context);
                        }),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EditNoteButtons extends StatelessWidget {
  final String _text;
  final Color _color;
  final Function _onPressed;

  EditNoteButtons(this._text, this._color, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPressed,
      child: Text(
        _text,
        // style: TextStyle(color: Colors.white),
      ),
      minWidth: 75,
      height: 50,
      color: _color,
    );
  }
}
