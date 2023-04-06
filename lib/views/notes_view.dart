import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/widgets/add_note_bottom_sheet.dart';
import 'package:note_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
           showModalBottomSheet(
             isScrollControlled: true,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(16.0),
             ) ,
               context: context,
               builder: (context)=>AddNoteBottomSheet(),
           );
        },
        child: Icon(
            Icons.add,

        ),
      ),
      body: NotesViewBody(),
    );
  }
}
