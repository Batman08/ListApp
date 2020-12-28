import 'package:flutter/cupertino.dart';
import 'package:list_app/Helpers/StringHelpers.dart';

class NoteInheritedWidget extends InheritedWidget {
  final notes = [
    {
      StringHelpers.cardTitle:
          'aksdljffffffffffflaksjflksdfdfsfadsjfldksajlksajflaf',
      StringHelpers.cardDescription:
          'aksdljfffffff2njfn2iouksjflkadsjfldksajlksajflaf'
    },
    {
      StringHelpers.cardTitle:
          'aksdljfffff20290-2rflkadsjflsdfdsfsdksajlksajflaf',
      StringHelpers.cardDescription:
          'aksdljfffffffffkf-3i2-rjflkadsjfldksajlksajflaf'
    },
    {
      StringHelpers.cardTitle:
          'aksdljfi9823u42839fflaksjflkadsjfldksajlksajflaf',
      StringHelpers.cardDescription:
          'aksdljfff;s#lfa;lf#saksjflkadsjfldksajlksajflaf'
    },
  ];

  NoteInheritedWidget(Widget child) : super(child: child);

  static NoteInheritedWidget of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<NoteInheritedWidget>());
  }

  @override
  bool updateShouldNotify(NoteInheritedWidget oldWidget) {
    return oldWidget.notes != notes;
  }
}
