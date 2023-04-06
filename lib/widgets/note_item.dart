import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
const NoteItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context)=>EditNoteView(
                  note: note,
                ),),);
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 15.0,
          bottom: 15.0,
          left: 15.0,
        ),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children:
          [
            ListTile(
              title:Text(
                note.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26.0,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(
                    top: 16.0,
                    bottom: 16.0,
                ),
                child: Text(
                  note.subTitle,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 18.0,
                  ),

                ),
              ),
              trailing: IconButton(
                onPressed: ()
                {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 24.0,
                ),
              ),
            ),
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Text(
              note.date,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                  fontSize: 15.0,
              ),

            ),
                ),
          ],
        ),
      ),
    );
  }
}
