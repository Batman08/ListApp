import 'package:flutter/material.dart';
import 'package:list_app/Helpers/StringHelpers.dart';

enum NoteMode { Editing, Adding }

class NoteViewPage extends StatelessWidget {
  final NoteMode _noteMode;

  NoteViewPage(this._noteMode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_noteMode == NoteMode.Adding
            ? StringHelpers.addPageTitle
            : StringHelpers.editPageTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration:
                  InputDecoration(hintText: StringHelpers.editPageTitleHint),
            ),
            Container(
              height: 8,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: StringHelpers.editPageDescriptioneHint),
            ),
            Container(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                EditNoteButtons(StringHelpers.editPageSave, Colors.blue, () {
                  Navigator.pop(context);
                }),
                Container(
                  width: 15,
                ),
                EditNoteButtons(
                    StringHelpers.editPageDiscard, Colors.grey.shade400, () {
                  Navigator.pop(context);
                }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _noteMode == NoteMode.Editing
                      ? EditNoteButtons(StringHelpers.editPageDelete, Colors.red,
                          () {
                          Navigator.pop(context);
                        })
                      : Container(),
                ),
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
      minWidth: 100,
      height: 50,
      color: _color,
    );
  }
}
