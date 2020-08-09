import 'package:flutter/cupertino.dart';

class NoteInheritedWidget extends InheritedWidget {
  final notes = [
    {
      'title': 'aksdljffffffffffflaksjflkadsjfldksajlksajflaf',
      'text': 'aksdljfffffff2njfn2iouksjflkadsjfldksajlksajflaf'
    },
    {
      'title': 'aksdljfffff20290-2rflkadsjfldksajlksajflaf',
      'text': 'aksdljfffffffffkf-3i2-rjflkadsjfldksajlksajflaf'
    },
    {
      'title': 'aksdljfi9823u42839fflaksjflkadsjfldksajlksajflaf',
      'text': 'aksdljfff;s#lfa;lf#saksjflkadsjfldksajlksajflaf'
    },
  ];

  NoteInheritedWidget(Widget child) : super(child: child);

  static NoteInheritedWidget of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType(
        aspect: NoteInheritedWidget) as NoteInheritedWidget);
  }

  @override
  bool updateShouldNotify(NoteInheritedWidget oldWidget) {
    return oldWidget.notes != notes;
  }
}
