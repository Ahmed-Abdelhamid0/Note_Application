import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/cubits/notes_cubit/notes_state.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/note_item.dart';

class NotesListView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit , NotesState>(
      builder: (context,state)
      {
        List<NoteModel> notes =BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder:(context , index)
            {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: NoteItem(
                  note: notes[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
